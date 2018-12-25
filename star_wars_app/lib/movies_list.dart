import 'package:flutter/material.dart';
import 'wrapper/movies_wrapper.dart';
import 'api/api.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_app/model/movie.dart';

class MoviesList extends StatefulWidget {
  final String title;

  MoviesList({Key key, this.title}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final _api = Api();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(widget.title)),
        body: FutureBuilder<MoviesWrapper>(
            future: _api.fetchMovies(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MovieListWidget(moviesWrapper: snapshot.data);
              } else if (snapshot.hasError) {
                // TODO WIDGET FOR ERROR MESSAGE
                print('ERROR: ' + snapshot.error.toString());
              } else {
                return ProgressIndicator();
              }
            }));
  }
}

// Widget that receives the moviesWrapper result and build the List View
class MovieListWidget extends StatelessWidget {
  final MoviesWrapper moviesWrapper;

  MovieListWidget({this.moviesWrapper});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: moviesWrapper.moviesResults.length,
        itemBuilder: (context, index) {
          return ListItemCell(
              moviesList: moviesWrapper.moviesResults, index: index);
        });
  }
}

// Widget that displays the cell with star wars movie
class ListItemCell extends StatelessWidget {
  final List<Movie> moviesList;
  final int index;

  ListItemCell({this.moviesList, this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(title: Text(moviesList[index].title)),
        Divider()
      ],
    );
  }
}

// Progress indicator when the data is not yet loaded
class ProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: CircularProgressIndicator()));
  }
}