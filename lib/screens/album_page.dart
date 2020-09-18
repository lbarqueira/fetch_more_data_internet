import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  final int id;
  final String name;

  AlbumPage({this.id, this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
    );
  }
}