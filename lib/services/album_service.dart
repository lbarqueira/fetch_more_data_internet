import 'dart:convert';
import 'package:fetch_more_data_internet/models/album.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(int id) async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/$id');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// fetchAlbums method

Future<List<Album>> fetchAlbums() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonResponse = jsonDecode(response.body) as List;
    return jsonResponse.map((e) => Album.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
