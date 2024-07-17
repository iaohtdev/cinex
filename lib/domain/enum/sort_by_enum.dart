enum SortByType {
  popularity_desc,
  primary_release_date;

  String get name => switch (this) {
        popularity_desc => 'popularity.desc',
        primary_release_date => 'primary_release_date.desc',
      };
}
