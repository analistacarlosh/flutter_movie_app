import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/service/movie_service.dart';

abstract class IMovieListState {
  void fetchUpcomingMovie();
  void searchMovie({@required String term});
}

class MovieListState extends ChangeNotifier implements IMovieListState {

  MovieListState({this.movieService});

  final MovieService movieService;
  int _page = 0;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  int get moviesQtd => _movies.length;

  @override
  void fetchUpcomingMovie() async {
    _page = _page + 1;

    movieService.fetchUpcomingMovie(page: _page)
        .then((upcomingMovieList) {
      _movies = [..._movies, ...upcomingMovieList];
      _errorMessage = '';
      notifyListeners();
    }).catchError((onError) {
      _errorMessage = 'Error to get Upcoming Movies';
      print('onError:: onError');
      notifyListeners();
    });
  }

  @override
  void searchMovie({@required String term}) {
    movieService.searchMovie(term: term)
        .then((movieList) {
      _movies = movieList;
      _errorMessage = '';
      print('searchMovie::success:: $movieList');
      notifyListeners();
    }).catchError((onError) {
      _errorMessage = 'Error to search Movies';
      print('searchMovie::onError');
      notifyListeners();
    });
  }
}