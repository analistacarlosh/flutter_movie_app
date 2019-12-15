import 'package:flutter/material.dart';
import 'package:movie_app/ui/common/custom_search_bar.dart';
import 'package:movie_app/ui/upcoming_movie/upcoming_movie_list/upcoming_movie_list_screen_state.dart';
import 'package:movie_app/ui/upcoming_movie/upcoming_movie_list/upcoming_video_item.dart';
import 'package:provider/provider.dart';

class UpcomingMovieListScreen extends StatefulWidget {
  const UpcomingMovieListScreen({Key key}) : super(key: key);

  @override
  _UpcomingMovieListState createState() => _UpcomingMovieListState();
}

class _UpcomingMovieListState extends State<UpcomingMovieListScreen> {

  _UpcomingMovieListState() {
    _scrollController.addListener(_onScroll);
  }

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    bool searchMode = Provider.of<MovieListState>(context, listen: false).searchMode;
    if (maxScroll - currentScroll <= _scrollThreshold && !searchMode) {
      Provider.of<MovieListState>(context, listen: false)
      .fetchUpcomingMovie();
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieListState>(context, listen: false).fetchUpcomingMovie();
    bool searchMode = Provider.of<MovieListState>(context, listen: false).searchMode;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: CustomSearchBar(
          title: 'Upcoming Movies',
          onTap: (value) =>
            Provider.of<MovieListState>(context, listen: false).searchMovie(term: value)
          ,
          onClose: () {
            Provider.of<MovieListState>(context, listen: false).resetMovieList();            
            Provider.of<MovieListState>(context, listen: false).fetchUpcomingMovie();
          },
        )
      ),
      body: Container(
        width: double.infinity,
        child: Consumer<MovieListState>(builder: (context, upcomingMovie, _) {

          if (upcomingMovie.errorMessage.isNotEmpty) {
            return Center(child: Container(
              child: Text(upcomingMovie.errorMessage),
            ),);
          }

          return ListView.builder(
            key: const Key('video_list'),
            itemCount: !searchMode ? upcomingMovie.movies.length + 1 : upcomingMovie.movies.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return index == upcomingMovie.movies.length && !searchMode
                  ? Center(child: const CircularProgressIndicator())
                  : UpcomingVideoItem(movieDetail: upcomingMovie
                  .movies[index]);
            },
            controller: _scrollController,
          );
        }),
      ),
    );
  }
}
