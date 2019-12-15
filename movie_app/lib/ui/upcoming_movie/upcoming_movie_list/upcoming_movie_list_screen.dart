import 'package:flutter/material.dart';
import 'package:movie_app/ui/upcoming_movie/upcoming_movie_list/upcoming_movie_list_screen_state.dart';
import 'package:movie_app/ui/upcoming_movie/upcoming_movie_list/upcoming_video_item.dart';
import 'package:provider/provider.dart';

class UpcomingMovieListScreen extends StatefulWidget {
  const UpcomingMovieListScreen({Key key, this.title}) : super(key: key);
  final String title;

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
    if (maxScroll - currentScroll <= _scrollThreshold) {
      Provider.of<MovieListState>(context, listen: false)
          .fetchUpcomingMovie();
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MovieListState>(context, listen: false).fetchUpcomingMovie();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: TextField(
          textInputAction: TextInputAction.search,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          onChanged: (value) {
            if (value.length >= 3) {
              print(value);
              Provider.of<MovieListState>(context, listen: false)
              .searchMovie(term: value);  
            }
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('onPressed');
            },
          ),
        ],
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
            key: const Key('list'),
            itemCount: upcomingMovie.movies.length + 1,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return index == upcomingMovie.movies.length
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
