import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/common/Constants.dart';
import 'package:movie_app/model/Media.dart';

class HttpHandler {
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "pt-BR";

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchPopularMovies() {
    var uri = new Uri.https(_baseUrl, "3/movie/popular",
        {'api_key': apikey, 'page': "1", 'language': _language});

    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item)).toList()));
  }

  Future<List<Media>> fetchUpcomingMovies() {
    var uri = new Uri.https(_baseUrl, "3/movie/popular",
        {'api_key': apikey, 'page': "1", 'language': _language});

    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item)).toList()));
  }

  Future<List<Media>> fetchTopRatedMovies() {
    var uri = new Uri.https(_baseUrl, "3/movie/popular",
        {'api_key': apikey, 'page': "1", 'language': _language});

    return getJson(uri).then(((data) =>
        data['results'].map<Media>((item) => new Media(item)).toList()));
  }
}
