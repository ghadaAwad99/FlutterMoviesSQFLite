import 'dart:convert';

import 'package:flutter_movies_sqflite/model/MovieModel.dart';
import 'package:http/http.dart' as http;

class MovieService{

  Future<List<MovieModel>> fetchMovies() async{
    print("fetchMovies inside MovieService");
    final response = await http.get(Uri.parse("https://api.androidhive.info/json/movies.json"));

    if(response.statusCode == 200){
      print("response movies: ${response.body}");
      return List<MovieModel>.from((json.decode(response.body) as List).map((movie) => MovieModel.fromJson((movie)))).toList();
    } else{
      throw("Couldn't fetch movies");
    }
  }

}