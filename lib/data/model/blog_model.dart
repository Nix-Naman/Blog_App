class BlogModel {
  String? id;
  String? imageUrl;
  String? title;

  BlogModel({this.id, this.imageUrl, this.title});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    title = json['title'];
  }
}
