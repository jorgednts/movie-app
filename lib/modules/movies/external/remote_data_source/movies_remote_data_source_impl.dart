import 'package:dio/dio.dart';

import '../../constants/movies_constants_url_api.dart';
import '../../data/mapper/remote_to_model.dart';
import '../../data/remote/data_source/movies_remote_data_source.dart';
import '../../data/remote/model/details/movie_details_response.dart';
import '../../data/remote/model/movie/movie_response.dart';
import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/model/details/movie_details_model.dart';
import '../../domain/model/movie/movie_model.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  MoviesRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<MovieModel>> getMoviesList() async {
    try {
      final response =
          await _dio.get('${MoviesConstantsUrlApi.movieBaseUrl}movies-v2');
      final List<MovieResponse> movieResponseList =
          (response.data.map((item) => MovieResponse.fromJson(item)).toList())
              .cast<MovieResponse>();
      return movieResponseList.toMovieListModel();
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        throw GenericErrorStatusCodeException();
      } else {
        throw NetworkErrorException();
      }
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    try {
      final response = await _dio
          .get('${MoviesConstantsUrlApi.movieBaseUrl}/${id.toString()}');
      final movieDetailResponse = MovieDetailsResponse.fromJson(response.data);
      return movieDetailResponse.toMovieDetailsModel();
    } on DioError catch (dioError, _) {
      if (dioError.type == DioErrorType.response) {
        throw GenericErrorStatusCodeException();
      } else {
        throw NetworkErrorException();
      }
    }
  }
}
