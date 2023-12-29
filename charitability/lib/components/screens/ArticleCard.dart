class ArticleCard {
  String cardTitle;
  String context;
  String image;
  String summary;

  ArticleCard(String title, String imagePath, String summar, String contexts) {
    cardTitle = title;
    context = contexts;
    image = imagePath;
    summary = summar;
  }
}
