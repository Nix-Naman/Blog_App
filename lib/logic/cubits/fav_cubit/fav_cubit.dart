import 'package:blog_app/data/model/blog_model.dart';
import 'package:blog_app/logic/cubits/fav_cubit/fav_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(NotInFav());
  List<BlogModel> fav = [];
  void addToFav(BlogModel blog) {
    print(blog.id);
    fav.add(blog);
    emit(AddingToFavState(fav));
  }
}
