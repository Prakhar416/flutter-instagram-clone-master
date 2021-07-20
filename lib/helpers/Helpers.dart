class Variables {
  String url = "https://storage.googleapis.com/instagram-clone/";
}

capitalize(value) {
  var a = value[0].toString().toUpperCase();
  var b = value.substring(1).toString();

  return a + b;
}

removeLastChars(String string, int chars) {
  return string.substring(0, string.length - chars);
}

trimDate(string) {
  return string.substring(string.length - 5);
}
