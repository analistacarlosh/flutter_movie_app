import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/service/movie_service.dart';

abstract class IMovieListState {
  void fetchUpcomingMovie();
  void searchMovie({String term});
  void resetMovieList();
}

class MovieListState extends ChangeNotifier implements IMovieListState {

  MovieListState({this.movieService});

  final MovieService movieService;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  int _page = 0;

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  int get moviesQtd => _movies.length;

  bool get searchMode => _searchMode;
  bool _searchMode = false;

  String get searchTerm => _searchTerm;
  String _searchTerm;

  @override
  void fetchUpcomingMovie() async {
    _page = ++_page;
    movieService.fetchUpcomingMovie(page: _page).then((upcomingMovieList) {
      _movies = [..._movies, ...upcomingMovieList];
      _errorMessage = '';
      _searchMode = false;
      notifyListeners();
    }).catchError((onError) {
      print('fetchUpcomingMovie ${onError}');
      _errorMessage = 'Error to fetch Upcoming movies';
      notifyListeners();
    });
  }

  @override
  void searchMovie({String term}) {
    _page = ++_page;
    var auxTerm = term ?? _searchTerm;
    movieService.searchMovie(term: auxTerm, page: _page).then((movieList) {
      _movies = [..._movies, ...movieList];
      _searchTerm = auxTerm;
      _errorMessage = '';
      _searchMode = true;
      notifyListeners();
    }).catchError((onError) {
      _errorMessage = 'Error to search movies';
      notifyListeners();
    });
  }

  @override
  void resetMovieList() {
    _movies = [];
    _page = 0;
    notifyListeners();
  }
}