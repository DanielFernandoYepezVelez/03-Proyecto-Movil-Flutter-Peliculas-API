/* Delegate => Es Una Clase Que Debe Cumplir O Implementar
Ciertas Condiciones O Métodos */

import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: Las Acciones De Nuestro AppBar(Icono Para Limpiar O Cancelar La Busqueda)
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: Icono A La Izquierda Del Buscador Del AppBar
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Crea Los Resultados Que Aparecen En La Lista
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: Sugerencias Cuando La Persona Esta Escribiendo En El AppBar
    throw UnimplementedError();
  }
}
