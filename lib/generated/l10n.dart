// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TMDB`
  String get appTitle {
    return Intl.message(
      'TMDB',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Carregando ...`
  String get movieDetailsPageLoading {
    return Intl.message(
      'Carregando ...',
      name: 'movieDetailsPageLoading',
      desc: '',
      args: [],
    );
  }

  /// `Ocorreu um erro!`
  String get genericError {
    return Intl.message(
      'Ocorreu um erro!',
      name: 'genericError',
      desc: '',
      args: [],
    );
  }

  /// `Falha na conexão!`
  String get failedConnection {
    return Intl.message(
      'Falha na conexão!',
      name: 'failedConnection',
      desc: '',
      args: [],
    );
  }

  /// `Lançamento:`
  String get movieListPageReleaseDate {
    return Intl.message(
      'Lançamento:',
      name: 'movieListPageReleaseDate',
      desc: '',
      args: [],
    );
  }

  /// `Ver Mais`
  String get movieListPageSeeMore {
    return Intl.message(
      'Ver Mais',
      name: 'movieListPageSeeMore',
      desc: '',
      args: [],
    );
  }

  /// `Título Original:`
  String get movieDetailsPageOriginalTitle {
    return Intl.message(
      'Título Original:',
      name: 'movieDetailsPageOriginalTitle',
      desc: '',
      args: [],
    );
  }

  /// `MAIS INFORMAÇÕES:`
  String get movieDetailsPageMoreInfo {
    return Intl.message(
      'MAIS INFORMAÇÕES:',
      name: 'movieDetailsPageMoreInfo',
      desc: '',
      args: [],
    );
  }

  /// `Produtoras:`
  String get movieDetailsPageProductionCompanies {
    return Intl.message(
      'Produtoras:',
      name: 'movieDetailsPageProductionCompanies',
      desc: '',
      args: [],
    );
  }

  /// `Receita:`
  String get movieDetailsPageRevenue {
    return Intl.message(
      'Receita:',
      name: 'movieDetailsPageRevenue',
      desc: '',
      args: [],
    );
  }

  /// `Disponível Em:`
  String get movieDetailsPageAvailableIn {
    return Intl.message(
      'Disponível Em:',
      name: 'movieDetailsPageAvailableIn',
      desc: '',
      args: [],
    );
  }

  /// `Tente Novamente`
  String get tryAgain {
    return Intl.message(
      'Tente Novamente',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
