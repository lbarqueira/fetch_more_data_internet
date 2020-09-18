import 'package:fetch_more_data_internet/models/album.dart';
import 'package:fetch_more_data_internet/providers/theme.dart';
import 'package:fetch_more_data_internet/services/album_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'album_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: Provider.of<ThemeProvider>(context).getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_6),
              color: Colors.white,
              onPressed: () {
                print('todo swap the theme');
                ThemeProvider themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.swapTheme();
              },
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder<List<Album>>(
            future: futureAlbums,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AlbumList(albumList: snapshot.data);
                //Text(snapshot.data[1].title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class AlbumList extends StatelessWidget {
  final List<Album> albumList;

  const AlbumList({this.albumList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albumList.length,
      itemBuilder: (context, index) {
        return ListTile(
          subtitle: Text(albumList[index].id.toString()),
          title: Text(albumList[index].title),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AlbumPage(
                  id: albumList[index].id,
                  name: albumList[index].title,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
