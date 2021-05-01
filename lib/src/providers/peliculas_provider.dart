import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:catalogo_peliculas/src/models/pelicula_model.dart';

/* Para Las Peticiones HTTP */
class PeliculasProvider {
  String _apiKey = '4d142929e92c52183f0266f0cb5e94cc';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularesPage = 0;
  List<Pelicula> _populares = [];
  bool _cargando = false;

  /* ===== Codigo Para EL Stream ===== */
  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  /* Para Insertar Información */
  /* Aqui Mi Tuberia(StreamController) Solo Va Ha Aceptar Listas De Peliculas */
  /* Se Puede Omitir El Tipo De Dato, Pero No Es Lo Más Conveniente */
  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  /* Para Obtener La Informacón Emitida */
  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  /* Para Cerrar El Stream */
  void disposeStreams() {
    _popularesStreamController?.close();
  }

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
    /* Cuando LLego Aqui No Se Ejecuta Más El Código, Por El Tema Del Return */
    if (_cargando) return [];

    /* Aqui Voy A Iniciar A Cargar La Data De La API, Para Solicitar Información */
    _cargando = true;
    _popularesPage++;
    // print('Cargando Las Siguientes Peliculas');

    /* Aqui Estoy Generando La Url Con Parametros */
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    /* Optimización De Código */
    final respuesta = await _procesarRespuesta(url);
    _populares.addAll(respuesta);
    popularesSink(_populares);

    /* Cuando Yo Tengo La Respuesta De La API Vuelvo A Falso Cargando */
    _cargando = false;
    return respuesta;
  }
}
