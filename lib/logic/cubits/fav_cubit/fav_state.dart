import 'package:blog_app/data/model/blog_model.dart';

abstract class FavState {}

class NotInFav extends FavState {}

class AddingToFavState extends FavState {
  final List<BlogModel> FavBlogs;
  AddingToFavState(this.FavBlogs);
}
