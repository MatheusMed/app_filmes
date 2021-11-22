import 'dart:convert';

import 'package:app_filmes/configs/movies_repository_decorator.dart';
import 'package:app_filmes/models/movie_model.dart';

import 'package:app_filmes/repositories/movie_repository/movie_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCachedRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCachedRepositoryDecorator(MovieRepository moviesRepository)
      : super(moviesRepository);

  @override
  Future<MoviesModel> getPopularMovies() async {
    try {
      MoviesModel movies = await super.getPopularMovies();
      _saveInCahche(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCahche(MoviesModel movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovie = jsonEncode(movies.toJson());
    prefs.setString('movies-cache', jsonMovie);
    print('filmes salvos no cache' + jsonMovie);
  }

  Future<MoviesModel> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies-cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = MoviesModel.fromJson(json);
    print('cache filmes' + movies.toString());
    return movies;
  }
}
