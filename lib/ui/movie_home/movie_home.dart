import 'package:app_filmes/configs/movies_cached_repository_decorator.dart';

import 'package:app_filmes/controllers/movie_controller.dart';
import 'package:app_filmes/models/movie_genre.dart';
import 'package:app_filmes/models/movie_model.dart';

import 'package:app_filmes/repositories/movie_repository/movie_repository_impl.dart';

import 'package:app_filmes/services/dio_services/dio_services_impl.dart';
import 'package:app_filmes/ui/details/movie_details.dart';
import 'package:app_filmes/utils/api.utils.dart';
import 'package:app_filmes/widgets/button_type_select.dart';

import 'package:app_filmes/widgets/text_form_custom.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({Key? key}) : super(key: key);

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  final controller = MovieController(
    MoviesCachedRepositoryDecorator(
      MovieRepositoryImpl(
        DioServicesImpl(),
      ),
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
            ValueListenableBuilder<MoviesModel?>(
              valueListenable: controller.movies,
              builder: (_, movies, __) {
                return Visibility(
                  visible: movies != null,
                  child: TextFormCustom(
                    onChanged: controller.onChanged,
                    label: 'Pesquise Filmes',
                    icon: Icon(
                      Icons.search,
                      color: Color(0xff5E6770),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonTypeSelect(
                  typeText: 'Açao',
                  onPressed: () {},
                ),
                ButtonTypeSelect(
                  typeText: 'Aventura',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                ),
                ButtonTypeSelect(
                  typeText: 'Fantasia',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                ),
                ButtonTypeSelect(
                  typeText: 'Comédia',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ValueListenableBuilder<MoviesModel?>(
                valueListenable: controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          separatorBuilder: (_, __) => SizedBox(height: 20),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          itemBuilder: (ctx, idx) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => MovieDetails(
                                      movie: movies.listMovies[idx],
                                    ),
                                    fullscreenDialog: true,
                                  ),
                                );
                              },
                              child: CachedNetworkImage(
                                fit: BoxFit.contain,
                                height: 500,
                                imageUrl: ApiUtils.REQUEST_IMG(
                                  movies.listMovies[idx].posterPath,
                                ),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
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
