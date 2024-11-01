extension FormatTime on int {
  String get formatTime {
    var result = '${(Duration(seconds: this))}'.split('.')[0].padLeft(8, '0');
    if (result.startsWith("00:")) {
      return result.substring(3);
    }
    return result;
  }
}

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

extension GetMonthName on int {
  String get getMonthName {
    if (this - 1 > monthsInYear.length - 1 || this < 1) {
      return "Invalid date";
    }
    return monthsInYear[this - 1];
  }
}
