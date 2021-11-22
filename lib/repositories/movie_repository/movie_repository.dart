import 'package:app_filmes/models/movie_genre.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/models/movie_model_popular.dart';

abstract class MovieRepository {
  Future<MoviesModel> getPopularMovies();
  // Future<MovieGenre> getGenres();
}
