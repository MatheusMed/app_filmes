import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/repositories/movie_repository/movie_repository.dart';
import 'package:flutter/material.dart';

class MovieController {
  final MovieRepository _movieRepository;

  MovieController(this._movieRepository) {
    fetchPopular();
  }

  ValueNotifier<MoviesModel?> movies = ValueNotifier<MoviesModel?>(null);

  MoviesModel? _cachedMovies;

  onChanged(String value) {
    var list = _cachedMovies!.listMovies
        .where(
            (e) => e.toString().toLowerCase().contains((value.toLowerCase())))
        .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
  }

  fetchPopular() async {
    movies.value = await _movieRepository.getPopularMovies();
    _cachedMovies = movies.value;
  }
}
