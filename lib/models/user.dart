class User {
  int userid = 0;

  User();

  getUser() {
    return userid;
  }

  String convertIntoPhone(int option,String dgt) {
    String digits = dgt;

    switch (option) {
      case 1: //Phone
        RegExp format = RegExp(r'(\d{3})(\d{3})(\d{3})(\d{3})');
        var matches = format.allMatches(digits).elementAt(0);
        var newFormat =
            "(${matches.group(1)}) ${matches.group(2)} ${matches.group(3)} ${matches.group(4)}";
        return newFormat;
        break;

      case 2: //Credit Card
        RegExp format = RegExp(r'(\d{4})(\d{4})(\d{4})(\d{4})');
        var matches = format.allMatches(digits).elementAt(0);
        var newFormat =
            "${matches.group(1)} ${matches.group(2)} ${matches.group(3)} ${matches.group(4)}";
        return newFormat;
        break;
      default:
        return digits;
        break;
    }
  }
}
