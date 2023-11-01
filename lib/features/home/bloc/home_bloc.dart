import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:blog_explorer/features/blogs/data/data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeFavouriteButtonClickedEvent>(homeFavouriteButtonClickedEvent);
    on<HomeFavouriteButtonNavigateEvent>(homeFavouriteButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final List<BlogDataModel> blogs = await fetchBlogs();

      if (blogs.isNotEmpty) {
        emit(HomeLoadedSuccessState(blogs: blogs));
      } else {
        emit(HomeErrorState());
      }
    } catch (e) {
      emit(HomeErrorState());
    }
  }

  static Future<List<BlogDataModel>> fetchBlogs() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        print(response.body);
        final Map<String, dynamic> result = jsonDecode(response.body);

        if (result.containsKey('blogs')) {
          final List<dynamic> blogList = result['blogs'];

          List<BlogDataModel> blogs = blogList
              .map((blogMap) => BlogDataModel.fromMap(blogMap))
              .toList();

          return blogs;
        } else {
          log('API response does not contain a "blogs" key.');
          return [];
        }
      } else {
        log('Request failed with status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  FutureOr<void> homeFavouriteButtonClickedEvent(
      event, Emitter<HomeState> emit) {}

  FutureOr<void> homeFavouriteButtonNavigateEvent(
      event, Emitter<HomeState> emit) {}

  
}
