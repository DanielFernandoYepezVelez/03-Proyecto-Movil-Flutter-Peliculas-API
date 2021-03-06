// Generated by https://quicktype.io

/* Asi Es La Respuesta Que Me Genera La API The movieDB,
  Pero Vamos Ha Realizar Algunos Cambios */
/* class Respuesta {
  Dates dates;
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  Respuesta({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
}

class Dates {
  String maximum;
  String minimum;

  Dates({
    this.maximum,
    this.minimum,
  });
}

class Result {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  OriginalLanguage originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
}

enum OriginalLanguage { EN, JA, RU, ES }
*/

/* Este Es La Lista(Arreglo) Que Me Almacena Todas Las Peliculas */
class Peliculas {
  /* Aqui Especificamente Se Almacena La Pelicula Una A Una */
  List<Pelicula> items = [];

  Peliculas();

  /* Aqui Se Esta Recibiendo La Lista De Lo Que Me Retorna La API De Forma Original*/
  Peliculas.fromJsonList(List<dynamic> /*!*/ jsonList) {
    /* Aqui Yo Me Paso Por Esa Lista Dinamica E Itero En Cada Item De Su LLave - Valor */
    for (var item in jsonList) {
      /* Aqui Lo Que Yo Recibo De Forma Original Lo Mapea A Los Tipos De Datos Que
      Me Ayuden A Identificar El Contenido De Las Peliculas */
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

/* Esta Clase Es Para Mapear Los Tipos De Datos De Las Peliculas Como Yo Lo Quiero Definir */
class Pelicula {
  // String? uniqueId;
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Pelicula({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  /* Lo Que Viene De Forma Original De La API Pasa Por Aqui
  Para Que Se Mapee O Transforme En Los Tipos Que Yo Necesito */
  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    voteCount = json['vote_count'];
  }

  get uniqueId {
    return '$id-tarjetica';
  }

  get uniqueIdBanner {
    return '$id-tarjetica';
  }

  getPosterImg() {
    if (posterPath == null) {
      return 'https://mantenimientocode.xyz/images/not-found.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getBackgroundImg() {
    if (posterPath == null) {
      return 'https://mantenimientocode.xyz/images/not-found.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }
}
