import 'package:flutter/material.dart';
import 'package:movie_app/ui/movie/movie_list/movie_list_screen.dart';
import 'package:movie_app/dependency_injection.dart' as di;
import 'package:movie_app/ui/movie/movie_list/movie_list_state.dart';
import 'package:provider/provider.dart';

import 'dependency_injection.dart';

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>
            getId.get<MovieListState>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.black,
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, color: Colors.white, fontWeight:
            FontWeight.bold),
            title: TextStyle(fontSize: 36.0, color: Colors.white, fontStyle:
                FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily:
            'Hind'),
          ),
        ),
        home: const MovieListScreen(),
      ),
    );
  }
}
