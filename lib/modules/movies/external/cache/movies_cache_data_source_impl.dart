import 'package:hive/hive.dart';

import '../../data/cache/movies_cache_data_source.dart';
import '../../data/mapper/cache_to_domain.dart';
import '../../data/mapper/domain_to_cache.dart';
import '../../domain/model/details/movie_details_cache.dart';
import '../../domain/model/details/movie_details_model.dart';
import '../../domain/model/movie/movie_cache.dart';
import '../../domain/model/movie/movie_model.dart';

class MoviesCacheDataSourceImpl implements MoviesCacheDataSource {
  MoviesCacheDataSourceImpl(this.hiveInterface);

  final HiveInterface hiveInterface;

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final box = await hiveInterface.openBox('MovieDetailsBox');
    final MovieDetailsCache? movieDetailsCache = box.get(id);
    if(movieDetailsCache != null) {
      return movieDetailsCache.toMovieDetailsModel();
    }
    throw Exception();
  }

  @override
  Future<List<MovieModel>> getMovieList() async {
    final box = await hiveInterface.openBox('movielistbox');
    final movieListCache = List<MovieCache>.from(box.get('movielistbox'));
    return movieListCache.toMovieListModel();
  }

  @override
  Future<void> saveMovieDetails(MovieDetailsModel movieDetails) async {
    final movieDetailsCache = movieDetails.toMovieDetailsCache();
    final box = await hiveInterface.openBox('MovieDetailsBox');
    await box.put(movieDetails.id, movieDetailsCache);
  }

  @override
  Future<void> saveMovieList(List<MovieModel> movieList) async {
    final movieListCache = movieList.toMovieListCache();
    final box = await hiveInterface.openBox('movielistbox');
    await box.putAll({'movielistbox': movieListCache});
  }
}
