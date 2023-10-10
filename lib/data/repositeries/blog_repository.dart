import 'package:blog_app/data/model/blog_model.dart';
import 'package:blog_app/data/repositeries/api/api.dart';

class BlogRepository {
  API api = API();

  Future<List<BlogModel>> fetchBlogs() async {
    try {
      var response = await api.sendRequest.get("/blogs");
      List<dynamic> blogs = response.data['blogs'];
      return blogs.map((e) => BlogModel.fromJson(e)).toList();
    } catch (e) {
      throw e;
    }
  }
}
