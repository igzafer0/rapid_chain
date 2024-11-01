const List monthsInYear = [
  "Ocak",
  "Şubat",
  "Mart",
  "Nisan",
  "Mayıs",
  "Haziran",
  "Temmuz",
  "Ağustos",
  "Eylül",
  "Ekim",
  "Kasım",
  "Aralık",
];

extension FormatTime on DateTime {
  String get formatTime {
    return "$day ${monthsInYear[month - 1]} $year / ${hour < 10 ? "0$hour" : "$hour"}:${minute < 10 ? "0$minute" : "$minute"}";
  }

  String get formatTimeOnlyDate {
    return "$day ${monthsInYear[month - 1]}";
  }

  String get formatTimeOnlyTime {
    return "${hour < 10 ? "0$hour" : "$hour"}:${minute < 10 ? "0$minute" : "$minute"}";
  }

  String get formatTimeOnlyDateWithYear {
    return "$day ${monthsInYear[month - 1]} $year";
  }
}
