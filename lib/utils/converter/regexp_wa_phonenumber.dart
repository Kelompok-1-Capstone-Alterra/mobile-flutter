String? regExpPhoneNumber(String url) {
  RegExp regExp = RegExp(r"(?<=\+)(\d+)");
  Match match = regExp.firstMatch(url) as Match;

  return "+${match.group(0)}";
}
