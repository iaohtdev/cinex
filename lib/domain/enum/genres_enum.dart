enum GenresType {
  action,
  anime,

  // adventure,
  comedy,
  horror,
  drama,
  thriller;

  String get name => switch (this) {
        action => 'Hành động',
        anime => 'Hoạt hình',
        // adventure => 'Phiêu lưu',
        comedy => 'Hài',
        horror => 'Kinh dị',
        drama => 'Chính kịch',
        thriller => 'Giật gân',
      };
  String get nameUS => switch (this) {
        action => 'Action',
        anime => 'Animation',
        // adventure => 'Adventure',
        comedy => 'Comedy',
        horror => 'Horror',
        drama => 'Drama',
        thriller => 'Thriller',
      };
  int get id => switch (this) {
        action => 28,
        // adventure => 12,
        anime => 16,
        comedy => 35,
        horror => 27,
        drama => 18,
        thriller => 53,
      };
}

final List<Map<String, dynamic>> lstGenresFull = [
  {"id": 28, "name": "Hành Động"},
  {"id": 12, "name": "Phiêu Lưu"},
  {"id": 16, "name": "Hoạt Hình"},
  {"id": 35, "name": "Hài"},
  {"id": 80, "name": "Hình Sự"},
  {"id": 99, "name": "Tài Liệu"},
  {"id": 18, "name": "Chính Kịch"},
  {"id": 10751, "name": "Gia Đình"},
  {"id": 14, "name": "Giả Tượng"},
  {"id": 36, "name": "Lịch Sử"},
  {"id": 27, "name": "Kinh Dị"},
  {"id": 10402, "name": "Nhạc"},
  {"id": 9648, "name": "Bí Ẩn"},
  {"id": 10749, "name": "Lãng Mạn"},
  {"id": 878, "name": "Khoa Học Viễn Tưởng"},
  {"id": 10770, "name": "Chương Trình Truyền Hình"},
  {"id": 53, "name": "Gây Cấn"},
  {"id": 10752, "name": "Chiến Tranh"},
  {"id": 37, "name": "Miền Tây"}
];
final List<Map<String, dynamic>> lstGenresFullUS = [
  {"id": 28, "name": "Action"},
  {"id": 12, "name": "Adventure"},
  {"id": 16, "name": "Animation"},
  {"id": 35, "name": "Comedy"},
  {"id": 80, "name": "Crime"},
  {"id": 99, "name": "Documentary"},
  {"id": 18, "name": "Drama"},
  {"id": 10751, "name": "Family"},
  {"id": 14, "name": "Fantasy"},
  {"id": 36, "name": "History"},
  {"id": 27, "name": "Horror"},
  {"id": 10402, "name": "Music"},
  {"id": 9648, "name": "Mystery"},
  {"id": 10749, "name": "Romance"},
  {"id": 878, "name": "Science Fiction"},
  {"id": 10770, "name": "TV Movie"},
  {"id": 53, "name": "Thriller"},
  {"id": 10752, "name": "War"},
  {"id": 37, "name": "Western"}
];
