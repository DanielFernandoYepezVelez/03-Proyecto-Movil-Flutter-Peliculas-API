import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:catalogo_peliculas/src/models/pelicula_model.dart';

/* Para Las Peticiones HTTP */
class PeliculasProvider {
  String _apiKey = '4d142929e92c52183f0266f0cb5e94cc';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    /* Aqui Hacemos La Petición */
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    // print(decodedData);

    // Aqui Solo Obtengo Las Peliculas Y No Toda La Data
    // Aqui Hago El Proceso Para Transformar Esa Respuesta En Lo Que Defini En Mi Modelo
    final peliculas = Peliculas.fromJsonList(decodedData['results']);

    // Los Items Donde Esta La Lista De Las Peliculas Una A Una
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    /* Aqui Estoy Generando La Url Con Parametros */
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    /* Optimización De Código */
    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    /* Aqui Estoy Generando La Url Con Parametros */
    final url = Uri.https(
        _url, '3/movie/popular', {'api_key': _apiKey, 'language': _language});

    /* Optimización De Código */
    return await _procesarRespuesta(url);
  }
}
