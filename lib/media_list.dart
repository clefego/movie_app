import 'package:flutter/material.dart';
import 'package:movie_app/common/HttpHandler.dart';
import 'package:movie_app/model/Media.dart';
import 'package:movie_app/media_list_item.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = new List();

  @override
  void initState() {
    super.initState();
    loadPopularMovies();
  }

  void loadPopularMovies() async {
    var movies = await HttpHandler().fetchPopularMovies();
    setState(() {
      _media.addAll(movies);
    });
  }

  void loadUpcomingMovies() async {
    var movies = await HttpHandler().fetchUpcomingMovies();
    setState(() {
      _media.clear();
      _media.addAll(movies);
    });
  }

  void loadTopRatedMovies() async {
    var movies = await HttpHandler().fetchTopRatedMovies();
    setState(() {
      _media.clear();
      _media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return new MediaListItem(_media[index]);
        },
      ),
    );
  }
}
