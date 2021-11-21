import 'package:app_filmes/models/movie_genre.dart';
import 'package:app_filmes/models/movie_model_popular.dart';
import 'package:app_filmes/repositories/movie_repository/movie_repository.dart';
import 'package:flutter/material.dart';

class MovieController {
  final MovieRepository _movieRepository;

  MovieController(this._movieRepository) {
    fetchPopular();
    fetchGenres();
  }

  ValueNotifier<MovieModelPopular?> moviesPopular =
      ValueNotifier<MovieModelPopular?>(null);
  ValueNotifier<MovieGenre?> moviesGenre = ValueNotifier<MovieGenre?>(null);

  fetchPopular() async {
    moviesPopular.value = await _movieRepository.getPopularMovies();
  }

  fetchGenres() async {
    moviesGenre.value = await _movieRepository.getGenres();
  }
}
