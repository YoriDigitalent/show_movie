import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tes_javan_movie/model/model.dart';
import 'package:tes_javan_movie/shared/shared_value.dart';

class MovieProvider extends ChangeNotifier {
  getNowPlayingMovies() async {
    var response = await http.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => Movie.fromJson(e)).toList();
  }

  getTopRatedMovies() async {
    var response = await http.get(
        'https://api.themoviedb.org/3/movie//top_rated?api_key=$apiKey&language=en-US&page=1');

    print(response.statusCode);
    print(response.body);

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => Movie.fromJson(e)).toList();
  }
}
