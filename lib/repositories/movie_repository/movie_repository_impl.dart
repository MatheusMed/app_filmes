import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/models/movie_model_popular.dart';
import 'package:app_filmes/models/movie_genre.dart';
import 'package:app_filmes/repositories/movie_repository/movie_repository.dart';
import 'package:app_filmes/services/dio_services/dio_services.dart';

const kKey = 'a858faa7e3471048ecfd025841284026';

class MovieRepositoryImpl implements MovieRepository {
  final DioServices _dioServices;
  MovieRepositoryImpl(this._dioServices);

  @override
  Future<MoviesModel> getPopularMovies() async {
    var result = await _dioServices.getDio().get('list/1?page=1');
    print(result.data);
    return MoviesModel.fromJson(result.data);
  }

  // @override
  // Future<MovieGenre> getGenres() async {
  //   var result = await _dioServices
  //       .getDio()
  //       .get('/genre/movie/list?api_key=$kKey&language=pt-BR');
  //   print(result.data);
  //   return MovieGenre.fromJson(result.data);
  // }
}
