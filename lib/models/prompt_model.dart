class PromptModel {
  String id;
  String category;
  String content;
  String description;
  bool isPublic;
  String language;
  String title;
  bool isFavourite;
  Map<String, dynamic> additionalProperties;

  PromptModel({
    required this.id,
    required this.category,
    required this.content,
    required this.description,
    required this.isPublic,
    required this.language,
    required this.title,
    this.isFavourite = false,
    this.additionalProperties = const {},
  });

  factory PromptModel.fromJson(Map<String, dynamic> json) {
    return PromptModel(
      id: json['_id'] ?? '',
      category: json['category'] ?? '',
      content: json['content'] ?? '',
      description: json['description'] ?? '',
      isPublic: json['isPublic'] ?? false,
      language: json['language'] ?? '',
      title: json['title'] ?? '',
      isFavourite: json['isFavourite'] ?? false,
      additionalProperties: Map<String, dynamic>.from(json)..removeWhere((key, value) => ['_id', 'category', 'content', 'description', 'isPublic', 'language', 'title', 'isFavourite'].contains(key)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'content': content,
      'description': description,
      'isPublic': isPublic,
      'language': language,
      'title': title,
      'isFavourite': isFavourite,
      ...additionalProperties,
    };
  }

  @override
  String toString() {
    return 'PromptModel{id: $id, category: $category, content: $content, description: $description, isPublic: $isPublic, language: $language, title: $title, isFavourite: $isFavourite, additionalProperties: $additionalProperties}';
  }
}