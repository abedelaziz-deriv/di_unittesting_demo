// coverage:ignore-file
class ArticlesDataModel {
  ArticlesDataModel({
    required this.id,
    required this.url,
    required this.title,
    required this.source,
    required this.publishedDate,
    required this.summary,
    required this.image,
  });

  final int id;
  final String url;
  final String title;
  final String source;
  final String publishedDate;
  final String summary;
  final String? image;
}
