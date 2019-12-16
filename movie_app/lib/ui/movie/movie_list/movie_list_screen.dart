import 'package:flutter/material.dart';
import 'package:movie_app/ui/common/custom_loading.dart';
import 'package:movie_app/ui/common/custom_message.dart';
import 'package:movie_app/ui/common/custom_search_bar.dart';
import 'package:movie_app/ui/movie/movie_list/movie_list_state.dart';
import 'package:movie_app/ui/movie/movie_list/movie_list_item.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key key}) : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  _MovieListScreenState() {
    _scrollController.addListener(_infiniteScroll);
  }

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  void _infiniteScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    bool searchMode =
        Provider.of<MovieListState>(context, listen: false).searchMode;

    if (maxScroll - currentScroll <= _scrollThreshold) {
      if (searchMode) {
        Provider.of<MovieListState>(context, listen: false).searchMovie();
      } else {
        Provider.of<MovieListState>(context, listen: false)
            .fetchUpcomingMovie();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieListState>(context, listen: false).fetchUpcomingMovie();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: CustomSearchBar(
        title: 'Upcoming Movies',
        onTap: (value) {
          Provider.of<MovieListState>(context, listen: false).resetMovieList();
          Provider.of<MovieListState>(context, listen: false)
          .searchMovie(term: value);
        },
        onClose: () {
          Provider.of<MovieListState>(context, listen: false).resetMovieList();
          Provider.of<MovieListState>(context, listen: false)
              .fetchUpcomingMovie();
        },
      )),
      body: Container(
        width: double.infinity,
        child: Consumer<MovieListState>(builder: (context, upcomingMovie, _) {
          if (upcomingMovie.errorMessage.isNotEmpty) {
            return CustomMessage(title: upcomingMovie.errorMessage);
          }

          if (upcomingMovie.movies.length == 0) {
            return CustomLoading();
          }

          return ListView.builder(
            key: const Key('video_list'),
            itemCount: upcomingMovie.movies.length + 1,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return index == upcomingMovie.movies.length
                  ? Center(child: const CircularProgressIndicator())
                  : MovieListItem(movieDetail: upcomingMovie.movies[index]);
            },
            controller: _scrollController,
          );
        }),
      ),
    );
  }
}
