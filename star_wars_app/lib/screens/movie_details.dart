import 'package:flutter/material.dart';
import 'package:star_wars_app/model/movie.dart';

class MovieDetails extends StatefulWidget {
  final String title;
  final Movie movie;

  MovieDetails({this.title, this.movie});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MovieContent(movie: widget.movie),
    );
  }
}

class MovieContent extends StatelessWidget {
  final Movie movie;

  MovieContent({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: <Widget>[
          Text(
            'Episode: ' + movie.episodeId.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            'Release Date: ' + movie.releaseDate,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            'Director: ' + movie.director,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            'Producers: ' + movie.producer,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Container(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(movie.openingCrawl,
                textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
          )
        ],
      ),
    );
  }
}
