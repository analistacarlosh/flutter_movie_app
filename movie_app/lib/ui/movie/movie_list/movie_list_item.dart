import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/ui/common/custom_cached_network_image.dart';
import 'package:movie_app/ui/movie/movie_detail/movie_detail_screen.dart';

class MovieListItem extends StatelessWidget {

  const MovieListItem({this.movieDetail});
  final Movie movieDetail;

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        key: Key('moviImage-${movieDetail.name}'),
        onTap: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
                MovieDetailScreen(movieDetail: movieDetail)
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(top: 3, bottom: 3, left: 5, right: 5),
          decoration: BoxDecoration(
            color: Colors.white30,
          ),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: CustomCacheNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: movieDetail.posterImageUrl,
                ),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(movieDetail.name,
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(left: 10, bottom: 20),
                    ),
                    Container(
                      child: Text(movieDetail.genres.map((genre) => genre.name)
                              .toList().join(', ')
                      ),
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(left: 10, bottom: 10),
                    ),
                    Container(
                      child: Text(movieDetail.releaseDate),
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(left: 10, bottom: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}

