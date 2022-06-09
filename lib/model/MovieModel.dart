import 'dart:convert';

import '../local_storage/db_helper.dart';

List<MovieModel> movieFromJson(String str) => List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieToJson(List<MovieModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  MovieModel({
    required this.title,
    required this.image,
    required this.rating,
    //required this.releaseYear,
    //this.genre,
  });

  String title;
  String image;
  double rating;
 // int releaseYear;
  //List<String>? genre;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    title: json["title"],
    image: json["image"],
    rating: json["rating"].toDouble(),
    //releaseYear: json["releaseYear"],
   // genre: List<String>.from(json["genre"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "rating": rating,
    //"releaseYear": releaseYear,
   // "genre": List<dynamic>.from(genre!.map((x) => x)),
  };

  Map<String, dynamic> toMap(){
    return {
      DbHelper.COLUMN_TITLE:title,
      DbHelper.COLUMN_IMAGE:image,
      //DbHelper.COLUMN_RELEASE_YEAR:releaseYear,
      DbHelper.COLUMN_RATING:rating,
    };
  }
}