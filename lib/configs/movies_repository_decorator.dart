import 'package:app_filmes/models/movie_genre.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/repositories/movie_repository/movie_repository.dart';

class MoviesRepositoryDecorator implements MovieRepository {
  final MovieRepository _moviesRepository;
  MoviesRepositoryDecorator(this._moviesRepository);

  @override
  Future<MoviesModel> getPopularMovies() async {
    return await _moviesRepository.getPopularMovies();
  }
}
