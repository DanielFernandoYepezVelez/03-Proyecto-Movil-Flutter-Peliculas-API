import 'package:flutter/material.dart';

import 'package:catalogo_peliculas/src/models/pelicula_model.dart';

/* Este Es Un Widget Que Tiene Como Objetivo Mostrar Las
Peliculas De Forma Horizontal En Cualquier Parte De Mi
Aplicación. Aqui Se Reciben El Listado De La Peliculas,
Asi Yo Puedo Reutilizar Este Widget De Forma Horizontal
En Cualquier Parte De Mi Aplicación Mostrando La Lista
De Las Peliculas. Un Widget Customizado O Personalizado*/

/* Las Peliculas Vienen Del Padre Y No Es La Responsabilidad
De Esta Clase Mantener Su Estado, Por Ende Es Un StatelessWidget */
class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.3),
        children: _targetas(context),
      ),
    );
  }

  List<Widget> _targetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 160.0,
                ),
              ),
            ),
            SizedBox(height: 3.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}
