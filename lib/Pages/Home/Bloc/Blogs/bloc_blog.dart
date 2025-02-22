import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_green/Pages/Home/Bloc/Blogs/Blog_Event.dart';
import 'package:go_green/Pages/Home/Bloc/Blogs/blog_state.dart';
import 'package:go_green/Pages/Home/Controllers/Repo/BlogRepo/blog_repository.dart';

class BlocBlog extends Bloc<BlogEvent, BlogState> {
  final BlogRepository blogRepository;

  BlocBlog({required this.blogRepository}) : super(BlogInitial()) {
    on<FetchBlogPosts>((event, emit)async{
      emit(BlogLoading());
      try {
        final blogPosts = await blogRepository.fetchAllBlogPosts();
        emit(BlogLoaded(blogPosts));
      } catch (e) {
        emit(BlogError(e.toString()));
      }
    });
  }

}
