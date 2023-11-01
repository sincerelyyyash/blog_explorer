import 'package:bloc/bloc.dart';
import 'package:blog_explorer/features/blogs/bloc/blog_event.dart';
import 'package:blog_explorer/features/blogs/bloc/blog_state.dart';
import 'package:meta/meta.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogInitial()) {
    on<BlogEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
