import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/ui/common/custom_cached_network_image.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({this.movieDetail});
  final Movie movieDetail;

  final EdgeInsets defaultMargin = const EdgeInsets.all(10);
  final EdgeInsets defaultPadding = const EdgeInsets.only(left: 10, right: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(movieDetail.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                height: 400,
                child: Card(
                  child: CustomCacheNetworkImage(
                    key: const Key('upcomingMovieImage'),
                    fit: BoxFit.fill,
                    imageUrl: 'https://image.tmdb.org/t/p/w500${movieDetail.posterImageUrl}',
                  ),
                ),
              ),
            ),
            Container(
              margin: defaultMargin,
              padding: defaultPadding,
              child: Text(movieDetail.name,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: defaultMargin,
              padding: defaultPadding,
              child:  Text(
                movieDetail.releaseDate,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Container(
              margin: defaultMargin,
              padding: defaultPadding,
              child: Text(movieDetail.genres.map((genre) => genre.name)
                    .toList().join(', '),
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Container(
              margin: defaultMargin,
              padding: defaultPadding,
              child: Text(movieDetail.overview,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
