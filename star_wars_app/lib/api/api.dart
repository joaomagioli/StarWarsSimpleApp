import 'package:star_wars_app/model/movies_wrapper.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Api {
  static final String _baseUrl = "https://swapi.co/api/";

  // Method that consumes the endpoint
  Future<MoviesWrapper> fetchMovies(http.Client client) async {
    final response = await client.get(_baseUrl + 'films');
    if (response.statusCode == 200) {
      return _parseMovies(response.body);
    } else {
      throw Exception('Error fetching movies');
    }
  }

  // Method that parses the response
  MoviesWrapper _parseMovies(String responseBody) {
    final parsed = json.decode(responseBody);
    return MoviesWrapper.fromJson(parsed);
  }
}
