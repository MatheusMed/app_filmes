import 'package:app_filmes/controllers/movie_controller.dart';
import 'package:app_filmes/models/movie_genre.dart';
import 'package:app_filmes/repositories/movie_repository/movie_repository.dart';
import 'package:app_filmes/repositories/movie_repository/movie_repository_impl.dart';
import 'package:app_filmes/services/dio_services/dio_services.dart';
import 'package:app_filmes/services/dio_services/dio_services_impl.dart';
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
      body: Container(),
    );
  }
}
