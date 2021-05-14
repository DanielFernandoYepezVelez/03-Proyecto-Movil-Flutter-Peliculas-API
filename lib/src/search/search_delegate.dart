/* Delegate => Es Una Clase Que Debe Cumplir O Implementar
Ciertas Condiciones O Métodos */

import 'package:flutter/material.dart';

import 'package:catalogo_peliculas/src/models/pelicula_model.dart';
import 'package:catalogo_peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman 1',
    'Ironman 2',
    'Ironman 3',
    'Ironman 4',
    'Capitan América',
    'Superman'
  ];

  final peliculasRecientes = ['Spiderman', 'Capitan América'];
  String seleccion = '';

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: Las Acciones De Nuestro AppBar(Icono Para Limpiar O Cancelar La Busqueda)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: Icono A La Izquierda Del Buscador Del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  /* Cuando Yo Le De Click En La Opcion De La Lista Sugerida Se Construye El
  Resultado */
  @override
  Widget buildResults(BuildContext context) {
    // TODO: Crea Los Resultados Que Aparecen En La Lista
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueGrey,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: Sugerencias Cuando La Persona Esta Escribiendo En El AppBar(Search)

    /* Cada Vez Que La Persona Escribe En El AppBar La Propiedad 
    Query Va Ir Cambiando */
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final responsePelis = snapshot.data;

          return ListView(
            /* Los Mapas Retornas Iterables, Por Ender, Aplico El ToList() */
            children: responsePelis
                .map((pelicula) => ListTile(
                      leading: FadeInImage(
                        image: NetworkImage(pelicula.getPosterImg()),
                        placeholder: AssetImage('assets/img/no-image.jpg'),
                        width: 50.0,
                        fit: BoxFit.contain,
                      ),
                      title: Text(pelicula.title),
                      subtitle: Text(pelicula.originalTitle),
                      onTap: () {
                        close(context, null);
                        pelicula.uniqueId = '';
                        Navigator.pushNamed(context, 'detalle',
                            arguments: pelicula);
                      },
                    ))
                .toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  /* @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: Sugerencias Cuando La Persona Esta Escribiendo En El AppBar(Search)

    /* Cada Vez Que La Persona Escribe En El AppBar La Propiedad 
    Query Va Ir Cambiando */
    final listaSugerida = (query.isEmpty)
        ? peliculasRecientes
        : peliculas
            .where((peli) => peli.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
        itemCount: listaSugerida.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text(listaSugerida[i]),
            onTap: () {
              seleccion = listaSugerida[i];
              showResults(
                  context); // Esto Construye El Resultado Final Por Pantalla
            },
          );
        });
  } */
}
