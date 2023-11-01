import 'package:blog_explorer/features/blogs/data/data_model.dart';

abstract class BlogEvent {}

class BlogInitialEvent extends BlogEvent {}

class BlogRemoveFromBlogEvent extends BlogEvent {
  final BlogDataModel blogDataModel;
  BlogRemoveFromBlogEvent({
    required this.blogDataModel,
  });
}
