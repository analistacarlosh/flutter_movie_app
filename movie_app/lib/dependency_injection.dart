import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/repository/genre_repository.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:movie_app/service/movie_service.dart';
import 'package:movie_app/ui/upcoming_movie/upcoming_movie_list/'
    'upcoming_movie_list_screen_state.dart';
import 'package:dio/dio.dart';

final getId = GetIt.instance;

Future<void> init() async {

  getId.registerLazySingleton(() => Dio());
  Dio dio = getId();
  dio.interceptors.add(
    DioCacheManager(CacheConfig(baseUrl: 'https://api.themoviedb.org/3/')).interceptor
  );

  getId.registerLazySingleton(() => GenreRepository(dio: getId()));
  getId.registerLazySingleton(() => MovieRepository(dio: getId()));
  
  getId.registerLazySingleton(() => MovieService(
    movieRepository: getId(), genreRepository: getId())
  );
  getId.registerLazySingleton(() => MovieListState(movieService: getId()));
}
