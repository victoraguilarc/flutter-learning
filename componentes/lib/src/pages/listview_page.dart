import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListPage> {
  List<int> _listNumbers = [];
  int _lastItem = 0;
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    loadMoreImages();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // loadMoreImages();

        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List')),
      body: Stack(children: <Widget>[_createList(), _createLoading()]),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getFirstItems,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listNumbers.length,
          itemBuilder: (BuildContext context, int index) {
            final _image = _listNumbers[index];
            return FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/500/300?random=$index'));
          }),
    );
  }

  void loadMoreImages() {
    for (var i = 1; i <= 10; i++) {
      _lastItem++;
      _listNumbers.add(_lastItem);
    }
    setState(() {});
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });
    final Duration duration = Duration(seconds: 2);
    new Timer(duration, _httpResponse);
  }

  Future<void> getFirstItems() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listNumbers.clear();
      _lastItem++;
      loadMoreImages();
    });

    return Future.delayed(duration);
  }

  void _httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 300));
    loadMoreImages();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()]),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
