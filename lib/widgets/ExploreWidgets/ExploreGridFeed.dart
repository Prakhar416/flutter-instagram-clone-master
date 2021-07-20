import 'package:flutter/material.dart';
import 'package:insta_clone/state/provider/PostState.dart';
import 'package:insta_clone/widgets/SharedWidgets/ShimmerGridLoader.dart';
import 'package:provider/provider.dart';

class ExploreGridFeed extends StatelessWidget {
  var url = "https://storage.googleapis.com/instagram-clone/";

  @override
  Widget build(BuildContext context) {
    var postState = Provider.of<PostState>(context);

    return RefreshIndicator(
      strokeWidth: 1,
      color: Colors.grey,
      onRefresh: postState.getAllPosts,
      child: postState.explorePostsLoading == true
          ? ShimmerGridLoader()
          : GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
              itemCount: postState.explorePosts.length,
              itemBuilder: (_, index) {
                var image = postState.explorePosts[index];
                return GestureDetector(
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(url + image.postImageUrl)),
                );
              },
            ),
    );
  }
}
