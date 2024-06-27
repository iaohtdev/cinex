import 'package:cinex/utils/enum/genres_enum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCommon {
  static void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String formatDateVN(String dateString) {
    if (dateString.isNotEmpty) {
      DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString);

      return DateFormat('dd-MM-yyyy').format(dateTime);
    } else {
      return '01-01-2010';
    }
  }

  static String formatYear(String dateString) {
    if (dateString.isNotEmpty) {
      DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString);
      return DateFormat('yyyy').format(dateTime);
    } else {
      return '2010';
    }
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
        orElse: () => {"name": "Cảm xúc"});
    return genre['name'];
  }
}
