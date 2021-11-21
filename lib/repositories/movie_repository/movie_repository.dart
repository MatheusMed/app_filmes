import 'package:app_filmes/models/movie_genre.dart';
import 'package:app_filmes/models/movie_model_popular.dart';

abstract class MovieRepository {
  Future<MovieModelPopular> getPopularMovies();
  Future<MovieGenre> getGenres();
}
