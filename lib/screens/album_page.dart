import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  final int id;
  final String name;

  AlbumPage({this.id, this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              id.toString(),
              style: TextStyle(fontSize: 20.0, color: Colors.green),
            ),
            Text(name),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(name),
      ),
    );
  }
}
