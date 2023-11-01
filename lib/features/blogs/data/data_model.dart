
class BlogDataModel {
  final String id;
  final String imageUrl;
  final String title;

  BlogDataModel({
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  factory BlogDataModel.fromMap(Map<String, dynamic> map) {
    return BlogDataModel(
      id: map['id'],
      imageUrl: map['image_url'],
      title: map['title'],
    );
  }
}
