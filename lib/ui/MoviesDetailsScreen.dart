import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_sqflite/model/MovieModel.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MoviesScreenDetails extends StatelessWidget {
  final MovieModel movie;

  MoviesScreenDetails(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title as String),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Hero(
                    tag: "${movie.title}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                          image: CachedNetworkImageProvider(
                              movie.image)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  RatingBarIndicator(
                      rating: (movie.rating / 2),
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      }),
                  const Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "Title : ${movie.title}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  const Text(
                    "Description:",
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(movie.title),
                  ),
                ],
              )),
        ));
  }
}
