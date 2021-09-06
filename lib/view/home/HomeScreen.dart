import 'package:flutter/material.dart';
import 'package:project/data/remote/response/Status.dart';
import 'package:project/models/moviesList/MoviesMain.dart';
import 'package:project/res/AppContextExtension.dart';
import 'package:project/utils/Utils.dart';
import 'package:project/view/details/MovieDetailsScreen.dart';
import 'package:project/view/widget/MyTextView.dart';
import 'package:project/view_model/home/MoviesListVM.dart';
import 'package:provider/provider.dart';

import '../widget/MyErrorWidget.dart';
import '../widget/LoadingWidget.dart';

class HomeScreen extends StatefulWidget {

  static final String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MoviesListVM viewModel = MoviesListVM();

  @override
  void initState() {
    viewModel.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: MyTextView(context.resources.strings.homeScreen, context.resources.color.colorWhite, context.resources.dimension.bigText)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ChangeNotifierProvider<MoviesListVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<MoviesListVM>(builder: (context, viewModel, _) {
          switch (viewModel.movieMain.status) {
            case Status.LOADING:
              print("MARAJ :: LOADING");
              return LoadingWidget();
            case Status.ERROR:
              print("MARAJ :: ERROR");
              return MyErrorWidget(viewModel.movieMain.message ?? "NA");
            case Status.COMPLETED:
              print("MARAJ :: COMPLETED");
              return _getMoviesListView(viewModel.movieMain.data?.movies);
            default:
          }
          return Container();
        }),
      ),
    );
  }

  Widget _getMoviesListView(List<Movie>? moviesList) {
    return ListView.builder(
        itemCount: moviesList?.length,
        itemBuilder: (context, position) {
          return _getMovieListItem(moviesList![position]);
        });
  }

  Widget _getMovieListItem(Movie item) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          child: Image.network(
            item.posterurl ?? "",
            errorBuilder: (context, error, stackTrace) {
              return new Image.asset('assets/images/img_error.png');
            },
            fit: BoxFit.fill,
            width: context.resources.dimension.listImageSize,
            height: context.resources.dimension.listImageSize,
          ),
          borderRadius: BorderRadius.circular(context.resources.dimension.imageBorderRadius),
        ),
        title: MyTextView(item.title ?? "NA",context.resources.color.colorPrimaryText,context.resources.dimension.bigText),
        subtitle: MyTextView(item.year??"NA",context.resources.color.colorSecondaryText,context.resources.dimension.mediumText),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextView("${Utils.setAverageRating(item.ratings ?? [])}",context.resources.color.colorBlack,context.resources.dimension.mediumText),
            SizedBox(width: context.resources.dimension.verySmallMargin,),
            Icon(Icons.star,color: context.resources.color.colorAccent,),
          ],
        ),
        onTap: () {
          _sendDataToMovieDetailScreen(context, item);
        },
      ),
      elevation: context.resources.dimension.lightElevation,
    );
  }

  void _sendDataToMovieDetailScreen(BuildContext context, Movie item) {
    Navigator.pushNamed(context, MovieDetailsScreen.id,arguments: item);
  }
}
