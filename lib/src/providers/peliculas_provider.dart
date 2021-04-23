import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:catalogo_peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apiKey = '4d142929e92c52183f0266f0cb5e94cc';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }
}
