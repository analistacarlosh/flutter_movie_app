import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/repository/base_repository.dart';

abstract class IGenreRepository {
  Future<List<Genre>> fetchGenre();
  List<Genre> genreListFromJson(List<dynamic> json);
}

class GenreRepository extends BaseRepository implements IGenreRepository {

  GenreRepository({this.dio});
  final Dio dio;

  @override
  Future<List<Genre>> fetchGenre() async {
    try {
      var response = await dio.get(
      getUrl('FETCH_GENERS'),
      options: buildCacheOptions(Duration(hours: 1),
      maxStale: Duration(hours: 1))
      );
      List<Genre> genreList = genreListFromJson(response.data['genres']);
      return Future.value(genreList);
    } catch (Error) {
      return Future.error(Exception('Failed to fetch Genre list:: $Error'));
    }
  }

  @override
  List<Genre> genreListFromJson(List<dynamic> json) {
    List<Genre> genreList = [];
    json.forEach((item) => genreList.add(Genre.fromJson(item)));
    return genreList;
  }
}