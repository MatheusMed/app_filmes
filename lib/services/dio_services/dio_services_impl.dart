import 'package:dio/dio.dart';

import 'dio_services.dart';

class DioServicesImpl implements DioServices {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        queryParameters: {
          'language': 'pt-BR',
        },
        headers: {
          'content-type': 'application/json;charset=utf8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhODU4ZmFhN2UzNDcxMDQ4ZWNmZDAyNTg0MTI4NDAyNiIsInN1YiI6IjYxNmQ1NjM5M2Q0ZDk2MDA0MzJmODc0YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RFqgvLYN43iNZn5w0274hhrl6Ojzgn7PmebexhiUrzw'
        },
      ),
    );
  }
}
