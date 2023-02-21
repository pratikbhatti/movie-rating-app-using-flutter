import 'dart:convert';

import 'package:demo35/screens/movie/modal/movie_rating_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<MovieRatingModal?> getData(String name) async {
    String jsonlink = "https://imdb8.p.rapidapi.com/auto-complete?q=$name";

    var response = await http.get(
        Uri.parse("https://imdb8.p.rapidapi.com/auto-complete?q=$name"),
        headers: {
          "X-RapidAPI-Key":
              "87abe4cb29msh6beb9362154f19ep11cd62jsn3c19af95b5ce",
          "X-RapidAPI-Host": "imdb8.p.rapidapi.com",
        });
    // print("Check ===== ${response.statusCode}");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print("start $json");
      return MovieRatingModal.fromJson(json);
    } else {
      print("Error 400");
      return null;
    }
    print("End ===== $name");
  }
}
