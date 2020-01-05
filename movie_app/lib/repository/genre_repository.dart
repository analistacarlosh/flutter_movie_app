import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/repository/base_repository.dart';

abstract class IGenreRepository {
  Future<List<Genre>> fetchGenre();
}

class GenreRepository extends BaseRepository implements IGenreRepository {

  GenreRepository({this.dio});
  final Dio dio;

  @override
  Future<List<Genre>> fetchGenre() async {
    try {

      var response = await dio.get(
      getUrl('FETCH_GENERS'),
      options: buildCacheOptions(const Duration(hours: 1),
      maxStale: const Duration(hours: 1))
      );

      final Iterable json = response.data['genres'];
      List<Genre> genreList = json.map((genre) => Genre.fromJson(genre))
          .toList();
      return Future.value(genreList);

    } catch (Error) {
      return Future.error(Exception('Failed to fetch Genre list:: $Error'));
    }
  }
}