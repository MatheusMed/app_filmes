import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

import 'dio_services.dart';

const kUrl = ' https://api.themoviedb.org/3/';
const kToken =
    'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhODU4ZmFhN2UzNDcxMDQ4ZWNmZDAyNTg0MTI4NDAyNiIsInN1YiI6IjYxNmQ1NjM5M2Q0ZDk2MDA0MzJmODc0YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RFqgvLYN43iNZn5w0274hhrl6Ojzgn7PmebexhiUrzw';
const kContentType = 'application/json;charset=utf8';

class DioServicesImpl implements DioServices {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: kUrl,
        contentType: kContentType,
        headers: {
          'Authorization': kToken,
        },
      ),
    );
  }
}
