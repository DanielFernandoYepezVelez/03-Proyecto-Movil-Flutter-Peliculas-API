import 'package:catalogo_peliculas/src/providers/peliculas_provider.dart';
import 'package:flutter/material.dart';

import 'package:catalogo_peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // centerTitle: false, No Es Necesaria, Pero Existe
          title: Text('Peliculas En Cines'),
          backgroundColor: Colors.indigoAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_swiperTarjetas(), _footer(context)],
          ),
        ));
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future:
          peliculasProvider.getEnCines(), // Como retorna Un Future Lo Acepta
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
              height: 450.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          /* Para Configurar Textos De Una Manera Global */
          Text('Populares', style: Theme.of(context).textTheme.subtitle1),
          FutureBuilder(
            future: peliculasProvider.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              print(snapshot.data);

              snapshot.data?.forEach((pelicula) => print(pelicula.title));
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
