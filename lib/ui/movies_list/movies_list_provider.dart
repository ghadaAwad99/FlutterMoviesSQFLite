import 'package:flutter/material.dart';
import 'package:flutter_movies_sqflite/data/repository/movies_repository.dart';
import 'package:flutter_movies_sqflite/model/MovieModel.dart';

class MoviesProvider extends ChangeNotifier {
  List<MovieModel> movieModel = [];
  MoviesRepository _moviesRepository = MoviesRepository();

  MoviesProvider() {
    getMovies();
  }

  void getMovies() {
    print("getMovies inside provider");
    _moviesRepository.fetchMovies().then((value) {
      movieModel = value;
      notifyListeners();
    });
  }
}
