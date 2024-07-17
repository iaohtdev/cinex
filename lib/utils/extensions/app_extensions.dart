import 'package:cinex/domain/enum/genres_enum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension FocusNodeExtensions on FocusNode {
  void unfocusNode() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

extension StringExtensions on String {
  String formatDateVN() {
    if (this.isNotEmpty) {
      DateTime dateTime = DateFormat('yyyy-MM-dd').parse(this);
      return DateFormat('dd-MM-yyyy').format(dateTime);
    } else {
      return '01-01-2010';
    }
  }

  String formatYear() {
    if (this.isNotEmpty) {
      DateTime dateTime = DateFormat('yyyy-MM-dd').parse(this);
      return DateFormat('yyyy').format(dateTime);
    } else {
      return '2010';
    }
  }
}

extension IntExtensions on int {
  String formatTime() {
    int hours = this ~/ 60;
    int remainingMinutes = this % 60;

    String hourString = hours > 0 ? '${hours}hr ' : '';
    String minuteString = '${remainingMinutes}m';

    return hourString + minuteString;
  }
}

extension GenreExtensions on int {
  String getGenreNameById() {
    final genre = lstGenresFull.firstWhere(
      (element) => element['id'] == this,
      orElse: () => {"name": "Cảm xúc"},
    );
    return genre['name'];
  }
}
