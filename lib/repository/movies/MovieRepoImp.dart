import 'dart:convert';

import 'package:project/data/remote/network/BaseApiService.dart';
import 'package:project/data/remote/network/NetworkApiService.dart';
import 'package:project/models/moviesList/MoviesMain.dart';
import 'package:project/repository/movies/MovieRepo.dart';
import 'package:project/data/remote/network/ApiEndPoints.dart';

class MovieRepoImp implements MovieRepo{

  BaseApiService _apiService = NetworkApiService();

  @override
  Future<MoviesMain?> getMoviesList() async {
    try {
      dynamic response = await _apiService.getResponse(
          ApiEndPoints().getMovies);
      print("MARAJ $response");
      final jsonData = MoviesMain.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
      print("MARAJ-E $e}");
    }
  }

}