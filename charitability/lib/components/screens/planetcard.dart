class PlanetCard {
  String cardTitle;
  String cardImage;
  double topMargin;
  int number;

  PlanetCard(String title, String imagePath, double marginTop, int screenName) {
    number = screenName;
    cardTitle = title;
    cardImage = imagePath;
    topMargin = marginTop;
  }
}
