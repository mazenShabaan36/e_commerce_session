extension StringExt on String {
  String capitalize() {
    String trimmedValue = trim();
    List<String> separated = trimmedValue.split(' ');
    String res = "";
    for (var i = 0; i < separated.length; i++) {
      res =
          "${separated[i][0].toUpperCase()} ${separated[i].substring(1).toLowerCase()}";
    }
    return res;
  }

  int toInt() {
    return int.parse(this);
  }
}
