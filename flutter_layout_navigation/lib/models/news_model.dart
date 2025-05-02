class NewsModel {
  final String link;
  final String title;
  final String pubdate;
  final String description;
  final String thumbnail;

  NewsModel({
    required this.link,
    required this.title,
    required this.pubdate,
    required this.description,
    required this.thumbnail,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      link: json['link'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      pubdate: json['pubDate'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }
}