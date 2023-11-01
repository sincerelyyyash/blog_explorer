import 'package:blog_explorer/features/blogs/data/data_model.dart';
import 'package:blog_explorer/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BlogCardWidget extends StatelessWidget {
  final BlogDataModel blogDataModel;
  final HomeBloc homeBloc;
  const BlogCardWidget(
      {super.key, required this.blogDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Color(0xFF121212),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     border: Border.all(color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(blogDataModel.imageUrl))),
            ),
            const SizedBox(height: 10),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      blogDataModel.title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      maxLines: null,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeFavouriteButtonClickedEvent(
                          clickedBlog: blogDataModel));
                    },
                    icon: Icon(Icons.favorite_border)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
