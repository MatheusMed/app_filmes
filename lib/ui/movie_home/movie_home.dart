import 'package:app_filmes/controllers/movie_controller.dart';
import 'package:app_filmes/models/movie_genre.dart';
import 'package:app_filmes/models/movie_model_popular.dart';
import 'package:app_filmes/repositories/movie_repository/movie_repository.dart';
import 'package:app_filmes/repositories/movie_repository/movie_repository_impl.dart';
import 'package:app_filmes/services/dio_services/dio_services.dart';
import 'package:app_filmes/services/dio_services/dio_services_impl.dart';
import 'package:app_filmes/utils/api.utils.dart';
import 'package:flutter/material.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  final controller = MovieController(
    MovieRepositoryImpl(
      DioServicesImpl(),
    ),
  );

  List<MovieGenre> genreList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filmes'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<MovieModelPopular?>(
                valueListenable: controller.moviesPopular,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          separatorBuilder: (_, __) => SizedBox(height: 20),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          itemBuilder: (ctx, idx) {
                            return Container(
                              height: 550,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(ApiUtils.REQUEST_IMG(
                                    movies.listMovies[idx].posterPath,
                                  )),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        )
                      : Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
