import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/base_repository.dart';

abstract class IMovieRepository {
  Future<List<Movie>> fetchUpcomingMovie({int page = 1});
  Future<List<Movie>> searchMovie({@required String term, int page = 1});
}

class MovieRepository extends BaseRepository implements IMovieRepository {

  MovieRepository({this.dio});
  final Dio dio;

  @override
  Future<List<Movie>> fetchUpcomingMovie({int page = 1}) async {
    try {

      var response = await dio.get(getUrl('FETCH_UPCOMING_MOVIES')
      + '&page=$page'); 

      final Iterable json = response.data['results'];
      List<Movie> movieList = json.map((movie) => Movie.fromJson(movie))
          .toList();
      return Future.value(movieList);

    } catch (Error) {
      return Future.error(Exception('Failed to fetchUpcomingMovie:: $Error'));
    }
  }

  @override
  Future<List<Movie>> searchMovie({String term, int page = 1}) async {
    try {
      var response = await dio.get(getUrl('SEARCH_MOVIES')
      + '&query=$term&page=$page'); 

      final Iterable json = response.data['results'];
      List<Movie> movieList = json.map((movie) => Movie.fromJson(movie))
          .toList();
      return Future.value(movieList);
    } catch (Error) {
      return Future.error(Exception('Failed to searchMovie :: $Error'));
    }
  }
}