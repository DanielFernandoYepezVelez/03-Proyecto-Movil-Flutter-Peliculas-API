import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:catalogo_peliculas/src/models/pelicula_model.dart';
/* Aqui Estoy Customizando Este Widget Para Utilizarlo 
En Cualrquier Otro Lado De Mi Aplicación Que Requiera 
Reutilizar Este Widget Mostrando Las Peliculas */

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  /* Parametro Obligatorio Con El Required */
  CardSwiper({@required this.peliculas});

  /* Aqui Se Debe Analizar Actualizar El Video Del Profesor */
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        width: double.infinity, // Utiliza Todo El Ancho Posible
        // width: _screenSize.width * 0.7, // 0.7 === 70%
        height: _screenSize.height * 0.55, // 0.5 === 50%
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';

            return Hero(
              tag: peliculas[index].uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    'detalle',
                    arguments: peliculas[index],
                  ),
                  child: FadeInImage(
                    image: NetworkImage(peliculas[index].getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.65,
          // itemHeight: _screenSize.height,
          itemCount: peliculas.length,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
          // autoplay: true,
          // curve: Curves.easeInExpo,
        ),
      ),
    );
  }
}
