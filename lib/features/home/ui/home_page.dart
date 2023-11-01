import 'package:blog_explorer/features/blogs/ui/blog_page.dart';
import 'package:blog_explorer/features/favourites/ui/favourite_page.dart';
import 'package:blog_explorer/features/home/bloc/home_bloc.dart';
import 'package:blog_explorer/features/home/ui/blog_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_consumer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeBlogFavouriteActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FavouritePage()));
        } else if (state is HomeNavigateToBlogPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BlogPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF121212),
                title: Container(
                    child: Row(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                      height: 50,
                    ),
                  ],
                )),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeFavouriteButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                ],
              ),
              backgroundColor: Color(0xFF000000),
              body: ListView.builder(
                  itemCount: successState.blogs.length,
                  itemBuilder: (context, index) {
                    return BlogCardWidget(
                        homeBloc: homeBloc,
                        blogDataModel: successState.blogs[index]);
                  }),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
