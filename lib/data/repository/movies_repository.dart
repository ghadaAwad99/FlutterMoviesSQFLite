//has reference to data source
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_sqflite/data/services/movies_api_service.dart';
import 'package:flutter_movies_sqflite/model/MovieModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../local_storage/db_helper.dart';

class MoviesRepository{
  MovieService _movieService = MovieService();

  Future<List<MovieModel>> fetchMovies() async{

    print("fetchMovies inside MoviesRepository");
    var connectivityResult = await (Connectivity().checkConnectivity());
    final dbHelper = DbHelper.instance;
    if(connectivityResult == ConnectivityResult.none){
      Fluttertoast.showToast(
          msg: "you are offline",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      final savedMovies = await dbHelper.queryAllRows();
      return List<MovieModel>.from(savedMovies!.map((savedMovie) => MovieModel.fromJson(savedMovie)));
    }else{
      Fluttertoast.showToast(
          msg: "you are online",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0
      );
      print("you are online");
      final movies = await _movieService.fetchMovies();
      for(final movie in movies){
        dbHelper.insert(movie.toMap());
      }
      return movies;
    }
  }
}