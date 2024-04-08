class PostModel {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  PostModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  factory PostModel.fromJson(Map map) {
    return PostModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        url: map['url'],
        category: map['category'],
        language: map['language'],
        country: map['country']);
  }
}
