enum MediaType {
  movie,
  tv,
  person;

  String get name => switch (this) {
        movie => 'movie',
        tv => 'tv',
        person => 'person',
      };
}
