// import 'package:flutter/material.dart';
// import 'package:insta_clone/widgets/SharedWidgets/ShimmerGridLoader.dart';

// class CustomGridView extends StatelessWidget {
//   var images;

//   CustomGridView({this.images});
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: RefreshIndicator(
//         onRefresh: getAllPosts,
//         child: postState.explorePostsLoading == true
//             ? ShimmerGridLoader()
//             : GridView.builder(
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
//                 itemCount: postState.explorePosts.length,
//                 itemBuilder: (_, index) {
//                   var image = postState.explorePosts[index];
//                   return GestureDetector(
//                     child: Image(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(url + image.postImageUrl)),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }
