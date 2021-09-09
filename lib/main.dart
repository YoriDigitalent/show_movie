import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tes_javan_movie/bloc/movie_bloc.dart';
import 'package:tes_javan_movie/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MovieBloc()..add(FetchMovies()),
        ),
      ],
      child: MaterialApp(
        home: BerandaPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
