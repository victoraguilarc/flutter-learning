import 'package:flutter/material.dart';
import 'package:pelisplus/delegators/search_delegate.dart';
import 'package:pelisplus/providers/movies_provider.dart';
import 'package:pelisplus/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context);

    print(movieProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
            icon: Icon(Icons.search_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: movieProvider.onDisplayMovies),
            MovieSlider(
              movies: movieProvider.popularMovies,
              title: 'Popular...',
              onNextPage: () => movieProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
