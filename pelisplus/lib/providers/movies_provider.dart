import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pelisplus/helpers/debouncer.dart';
import 'package:pelisplus/models/models.dart';
import 'package:pelisplus/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  final _apiKey = '034e567383721590905ceac6bd0656f3';
  final _baseUrl = 'api.themoviedb.org';
  final _lang = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;
  Map<int, List<Cast>> moviesCasting = {};

  // Debouncing
  final debouncer = Debouncer(duration: const Duration(milliseconds: 1000));
  final StreamController<List<Movie>> _suggestionsStreamController =
      StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      this._suggestionsStreamController.stream;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String path,
      {int page = 1, Map extraParams = const {}}) async {
    final url = Uri.https(_baseUrl, path, {
      'api_key': _apiKey,
      'language': _lang,
      'page': '$page',
      ...extraParams
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = [...onDisplayMovies, ...nowPlayingResponse.results];
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', page: _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCasting({required int movieId}) async {
    if (moviesCasting.containsKey(movieId)) return moviesCasting[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = MovieCreditsResponse.fromJson(jsonData);
    moviesCasting[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies({required String query}) async {
    final jsonData =
        await _getJsonData('3/search/movie', extraParams: {'query': query});
    final searchResponse = SearchResponse.fromJson(jsonData);
    return searchResponse.results;
  }

  void getSuggestionsByQuery(String query) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      print('Nuevo valor: $value');
      final results = await searchMovies(query: query);
      _suggestionsStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      debouncer.value = query;
    });

    Future.delayed(const Duration(milliseconds: 101))
        .then((value) => timer.cancel());
  }
}
