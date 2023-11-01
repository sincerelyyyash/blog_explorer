part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<BlogDataModel> blogs;
  HomeLoadedSuccessState({
    required this.blogs,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToBlogPageActionState extends HomeActionState {}

class HomeBlogFavouriteActionState extends HomeActionState {}
