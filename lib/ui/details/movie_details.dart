import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/utils/api.utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  Movies? movie;

  MovieDetails({this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buttonBack(context),
              SizedBox(
                height: 65,
              ),
              _movieDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  _buttonBack(context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 10),
        child: Container(
          height: 30,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 12,
                ),
                Text('Voltar'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _movieDetails(context) {
    return Column(
      children: [
        CachedNetworkImage(
          fit: BoxFit.contain,
          height: 500,
          imageUrl: ApiUtils.REQUEST_IMG(movie!.posterPath),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
        ),
      ],
    );
  }
}
