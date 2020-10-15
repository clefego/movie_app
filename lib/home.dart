import 'package:flutter/material.dart';
import 'package:movie_app/media_list.dart';
import 'package:movie_app/common/MediaProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MediaProvider movieProvider = new MovieProvider();
  final MediaProvider showProvider = new ShowProvider();
  MediaType mediaType = MediaType.movie;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("TMDB BRASIL"), actions: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ]),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new DrawerHeader(child: new Material()),
          new ListTile(
            title: new Text("Cinema"),
            selected: mediaType == MediaType.movie,
            trailing: new Icon(Icons.local_movies),
            onTap: () {
              _changeMediaType(MediaType.movie);
              Navigator.of(context).pop();
            },
          ),
          new Divider(
            height: 5.0,
          ),
          new ListTile(
            title: new Text("Televisão"),
            selected: mediaType == MediaType.show,
            trailing: new Icon(Icons.live_tv),
            onTap: () {
              _changeMediaType(MediaType.show);
              Navigator.of(context).pop();
            },
          ),
          new Divider(
            height: 5.0,
          ),
          new ListTile(
            title: new Text("Sair"),
            trailing: new Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      )),
      body: new PageView(
        children: _getMediaList(),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      new BottomNavigationBarItem(
        icon: new Icon(Icons.thumb_up),
        title: new Text("Populares"),
        //onPressed: buttonState ? _buttonChange : null,
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.update),
        title: new Text("Em Breve"),
        //onPressed: buttonState ? _buttonChange : null,
      ),
      new BottomNavigationBarItem(
        icon: new Icon(Icons.star),
        title: new Text("Destaques"),
        //onPressed: buttonState ? _buttonChange : null,
      )
    ];
  }

  void _changeMediaType(MediaType type) {
    if (mediaType != type) {
      setState(() {
        mediaType = type;
      });
    }
  }

  List<Widget> _getMediaList() {
    return (mediaType == MediaType.movie)
        ? <Widget>[new MediaList(movieProvider)]
        : <Widget>[new MediaList(showProvider)];
  }
}
