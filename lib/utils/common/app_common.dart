import 'package:cinex/utils/enum/genres_enum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCommon {
  static void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String formatDateVN(String? dateString) {
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString ?? '');

    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String formatTime(int minutes) {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;

    String hourString = hours > 0 ? '${hours}hr ' : '';
    String minuteString = '${remainingMinutes}m';

    return hourString + minuteString;
  }

  static String getGenreNameById(int id) {
    final genre = lstGenresFull.firstWhere((element) => element['id'] == id,
        orElse: () => {"name": "Unknown"});
    return genre['name'];
  }

  static List<String> getGenreNamesByIds(List<int> ids) {
    return ids.map((id) {
      final genre = lstGenresFull.firstWhere((element) => element['id'] == id,
          orElse: () => {"name": "Unknown"});
      return genre['name'] as String;
    }).toList();
  }
}
