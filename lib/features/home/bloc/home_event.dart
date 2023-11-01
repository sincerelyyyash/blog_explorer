part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeFavouriteButtonClickedEvent extends HomeEvent {
  final BlogDataModel clickedBlog;
  HomeFavouriteButtonClickedEvent({
    required this.clickedBlog,
  });
}

class HomeFavouriteButtonNavigateEvent extends HomeEvent {}

class HomeBlogButtonNavigateEvent extends HomeEvent {}
