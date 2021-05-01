import 'package:catalogo_peliculas/src/providers/peliculas_provider.dart';
import 'package:catalogo_peliculas/src/widgets/movie_horizontal.dart';
import 'package:flutter/material.dart';

import 'package:catalogo_peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* Para Configurar Textos De Una Manera Global */
          Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Populares',
                  style: Theme.of(context).textTheme.subtitle1)),
          SizedBox(height: 5.0),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                    peliculas: snapshot.data,
                    siguientePagina: peliculasProvider.getPopulares);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
