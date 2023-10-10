import 'package:blog_app/data/model/blog_model.dart';
import 'package:blog_app/data/repositeries/blog_repository.dart';
import 'package:blog_app/logic/cubits/blog_cubit/blog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogLoadingState()) {
    getBlogs();
  }
  BlogRepository blogRepository = BlogRepository();
  void getBlogs() async {
    try {
      List<BlogModel> blogs = await blogRepository.fetchBlogs();
      emit(BlogLoadedState(blogs));
    } catch (ex) {
      emit(BlogErrorState(ex.toString()));
    }
  }
}
