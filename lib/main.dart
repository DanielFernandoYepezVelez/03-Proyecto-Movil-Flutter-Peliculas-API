import 'package:flutter/material.dart';

import 'package:catalogo_peliculas/src/pages/home_page.dart';
import 'package:catalogo_peliculas/src/pages/pelicula_detalle.dart';

void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'detalle': (BuildContext context) => PeliculaDetallePage(),
      },
    );
  }
}
