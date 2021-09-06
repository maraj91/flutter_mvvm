import 'package:flutter/material.dart';
import 'package:project/data/remote/response/ApiResponse.dart';
import 'package:project/models/moviesList/MoviesMain.dart';
import 'package:project/repository/movies/MovieRepoImp.dart';

class MoviesListVM extends ChangeNotifier {
  final _myRepo = MovieRepoImp();

  ApiResponse<MoviesMain> movieMain = ApiResponse.loading();

  void _setMovieMain(ApiResponse<MoviesMain> response) {
    print("MARAJ :: $response");
    movieMain = response;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    _setMovieMain(ApiResponse.loading());
    _myRepo
        .getMoviesList()
        .then((value) => _setMovieMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setMovieMain(ApiResponse.error(error.toString())));
  }
}
