class BaseModel {
  Dates dates;
  int page;
  int totalPages;
  int totalResults;
  dynamic results;

  BaseModel({
    required this.dates,
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    var resultsJson = json['results'];
    dynamic results;

    if (resultsJson is List) {
      results = resultsJson.map((item) => ResultItem.fromJson(item)).toList();
    } else if (resultsJson is Map) {
      results = ResultItem.fromJson(resultsJson as Map<String, dynamic>);
    }

    return BaseModel(
      dates: Dates.fromJson(json['dates']),
      page: json['page'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
      results: results,
    );
  }

  Map<String, dynamic> toJson() {
    dynamic resultsJson;

    if (results is List) {
      resultsJson =
          results.map((item) => (item as ResultItem).toJson()).toList();
    } else if (results is ResultItem) {
      resultsJson = (results as ResultItem).toJson();
    }

    return {
      'dates': dates.toJson(),
      'page': page,
      'total_pages': totalPages,
      'total_results': totalResults,
      'results': resultsJson,
    };
  }
}

class Dates {
  String maximum;
  String minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }
}

class ResultItem {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  ResultItem({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory ResultItem.fromJson(Map<String, dynamic> json) {
    return ResultItem(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
