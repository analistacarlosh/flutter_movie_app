
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/genre_repository.dart';
import 'package:movie_app/repository/movie_repository.dart';

abstract class IMovieService {
  Future<List<Movie>> fetchUpcomingMovie({int page});
  Future<List<Movie>> searchMovie({String term, int page});
  List<Movie> setGenreOnMovie({List<Movie> movies, List<Genre> genres});
}

class MovieService implements IMovieService {
  MovieService({this.movieRepository, this.genreRepository});

  final MovieRepository movieRepository;
  final GenreRepository genreRepository;

  @override
  Future<List<Movie>> fetchUpcomingMovie({int page}) async {
    List<Movie> movies = await movieRepository.fetchUpcomingMovie(page: page);
    List<Genre> genres = await genreRepository.fetchGenre();
    List<Movie> moviesUpdated = setGenreOnMovie(
      movies: movies, genres: genres
    );
    return Future.value(moviesUpdated);
  }

  @override
  Future<List<Movie>> searchMovie({String term, int page}) async {
    List<Movie> movies = await movieRepository.searchMovie(
      term: term, page: page
    );
    List<Genre> genres = await genreRepository.fetchGenre();
    List<Movie> moviesUpdated = setGenreOnMovie(
      movies: movies, genres: genres
    );
    return Future.value(moviesUpdated);    
  }

  @override
  List<Movie> setGenreOnMovie({List<Movie> movies, List<Genre> genres}) {
    movies.forEach((movie) {
      movie.genres = genres.where((genre) => 
      movie.genresId.contains(genre.id)).toList();
    });
    return movies;
  }
}