import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:catalogo_peliculas/src/models/pelicula_model.dart';
/* Aqui Estoy Customizando Este Widget Para Utilizarlo 
En Cualrquier Otro Lado De Mi Aplicación Que Requiera 
Reutilizar Este Widget Mostrando Las Peliculas */

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  /* Parametro Obligatorio Con El Required */
  CardSwiper({required this.peliculas});

  // peliculas![index].uniqueId = '${peliculas![index].id}-tarjeta';

  /* Aqui Se Debe Analizar Actualizar El Video Del Profesor */
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return CarouselSlider.builder(
      itemCount: this.peliculas.length,
      itemBuilder: (context, index, realIndex) =>
          _MoviePosterImage(pelicula: this.peliculas[index]),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );
  }
}

class _MoviePosterImage extends StatelessWidget {
  const _MoviePosterImage({
    Key? key,
    required this.pelicula,
  }) : super(key: key);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'detalle', arguments: this.pelicula),
      child: FadeInImage(
        // image: NetworkImage(pelicula.getPosterImg()),
        image: NetworkImage(pelicula.getBackgroundImg()),
        placeholder: AssetImage('assets/img/loading.gif'),
        fit: BoxFit.cover,
      ),
    );
  }
}
