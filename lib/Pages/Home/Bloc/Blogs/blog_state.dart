import 'package:equatable/equatable.dart';
import 'package:go_green/Data/Models/home/hot_places/blogPost.dart';


abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List<Blogpost> blogPosts;

  const BlogLoaded(this.blogPosts);

  @override
  List<Object> get props => [blogPosts];
}

class BlogError extends BlogState {
  final String message;

  const BlogError(this.message);

  @override
  List<Object> get props => [message];
}
