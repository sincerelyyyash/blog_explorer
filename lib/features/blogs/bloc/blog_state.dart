import 'package:blog_explorer/features/blogs/data/data_model.dart';

abstract class BlogState {}

abstract class BlogActionState extends BlogState {}

class BlogInitial extends BlogState {}

class BlogSuccessState extends BlogState {
  final List<BlogDataModel> blogItems;
  BlogSuccessState({
    required this.blogItems,
  });
}

class BlogRemoveFromCartEvent extends BlogState{
  
}