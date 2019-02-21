import 'package:flutter/material.dart';
import 'package:star_wars_app/model/movies_wrapper.dart';
import 'package:star_wars_app/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars_app/model/movie.dart';
import 'package:star_wars_app/screens/movie_details.dart';
import 'package:star_wars_app/screens/error_page_widget.dart';

class MoviesList extends StatefulWidget {
  final String title;

  MoviesList({Key key, this.title}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final _api = Api();
  Future<MoviesWrapper> moviesWrapper;

  @override
  void initState() {
    super.initState();
    moviesWrapper = _api.fetchMovies(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: new Text(widget.title)),
        body: FutureBuilder<MoviesWrapper>(
            future: moviesWrapper,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MovieListWidget(moviesWrapper: snapshot.data);
              } else if (snapshot.hasError) {
                return ErrorPageWidget(snapshot.error.toString());
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
        ListTile(
          title: Text(moviesList[index].title),
          onTap: () {
            Navigator.push(context,
                _onTap(context, moviesList[index].title, moviesList[index]));
          },
        ),
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

_onTap(BuildContext context, String title, Movie movie) {
  return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetails(title: title, movie: movie)));
}
