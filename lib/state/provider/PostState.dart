import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:insta_clone/state/models/PostModel.dart';
import 'package:insta_clone/state/models/UserModel.dart';
import 'package:insta_clone/state/provider/AppState.dart';
import 'package:insta_clone/state/services/PostServices.dart';

class PostState extends ChangeNotifier {
  var feedPostsLoading = false;
  var explorePostsLoading = false;
  var ownPostsLoading = false;
  var userPageDataLoading = false;
  List<PostModel> feedPosts = [];
  List<PostModel> explorePosts = [];
  List<PostModel> ownPosts = [];
  Map userPageData = {};

  Future<void> getFriendsPosts(id) async {
    print("Get Friends Posts");
    setFeedPostsLoading(true);

    PostServices().getFriendsPosts(id).then((response) async {
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          setFeedPostsLoading(false);
          clearFeedPosts();
          return;
        }

        var responseList = jsonDecode(response.body) as List;
        List<PostModel> postModel =
            responseList.map((e) => PostModel.fromJson(e)).toList();

        print(postModel.length);

        setPosts(postModel);
        setFeedPostsLoading(false);
      } else {
        setFeedPostsLoading(false);
        print(response.body);
        return;
      }
    }).catchError((response) {
      onError(response);
    });
  }

  Future<void> getAllPosts() async {
    print("Get All Posts");
    setExplorePostsLoading(true);
    PostServices().getAllPosts().then((response) async {
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          setExplorePostsLoading(false);
          clearExplorePosts();
          return;
        }

        var responseList = jsonDecode(response.body) as List;
        List<PostModel> postModel =
            responseList.map((e) => PostModel.fromJson(e)).toList();

        print(postModel.length);

        setExplorePosts(postModel);
        setExplorePostsLoading(false);
      } else {
        setExplorePostsLoading(false);
        print(response.body);
        return;
      }
    }).catchError((error) {
      onError(error);
    });
  }

  Future<void> getOwnPosts(id) async {
    print("Get Own Posts");
    setOwnPostsLoading(true);

    PostServices().getOwnPosts(id).then((response) async {
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          setOwnPostsLoading(false);
          clearOwnPosts();
          return;
        }

        var responseList = jsonDecode(response.body) as List;
        List<PostModel> postModel =
            responseList.map((e) => PostModel.fromJson(e)).toList();

        print(postModel.length);

        setOwnPosts(postModel);
        setOwnPostsLoading(false);
      } else {
        setOwnPostsLoading(false);
        print(response.body);
        return;
      }
    }).catchError((response) {
      onError(response);
    });
  }

  Future getAllUserData(id) async {
    print("Get All Posts and Data From A User");
    setUserPageDataLoading(true);

    var user = PostServices().getAllUserData(id).then((response) async {
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          setUserPageDataLoading(false);
          clearUserPageData();
          return null;
        }

        Map responseList = jsonDecode(response.body);

        UserModel data = UserModel.fromJson(responseList['user']);

        // print(data);

        List postModel =
            responseList['posts'].map((e) => PostModel.fromJson(e)).toList();

        print(postModel.length);

        Map userData = {'user': data, 'posts': postModel};

        setUserPageDataLoading(false);

        setUserPageData(userData);
      } else {
        setUserPageDataLoading(false);
        print(response.body);
        return null;
      }
    }).catchError((response) {
      onError(response);
    });

    return user;
  }

  Future<void> likePost(user, postId, index) async {
    print("Like/Unlike Posts");

    if (feedPosts[index].likes.contains(user.id)) {
      feedPosts[index].likes.remove(user.id);
    } else {
      feedPosts[index].likes.add(user.id);
    }

    PostServices().likePost(user.id, postId).then((response) async {
      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          return;
        }

        // print(response.body);
      } else {
        print(response.body);
        return;
      }
    }).catchError((response) {
      onError(response);
    });

    notifyListeners();
  }

  //  -----  //
  void clearFeedPosts() {
    feedPosts = [];
    notifyListeners();
  }

  void clearExplorePosts() {
    explorePosts = [];
    notifyListeners();
  }

  void clearOwnPosts() {
    ownPosts = [];
    notifyListeners();
  }

  void clearUserPageData() {
    userPageData = {};
    notifyListeners();
  }
  //  -----  //

  //  -----  //
  void setFeedPostsLoading(bool value) {
    feedPostsLoading = value;
    notifyListeners();
  }

  void setExplorePostsLoading(bool value) {
    explorePostsLoading = value;
    notifyListeners();
  }

  void setOwnPostsLoading(bool value) {
    ownPostsLoading = value;
    notifyListeners();
  }

  void setUserPageDataLoading(bool value) {
    userPageDataLoading = value;
    notifyListeners();
  }
  //  -----  //

  //  -----  //
  void setPosts(value) {
    feedPosts = value;
    notifyListeners();
  }

  void setExplorePosts(value) {
    explorePosts = value;
    notifyListeners();
  }

  void setOwnPosts(value) {
    ownPosts = value;
    notifyListeners();
  }

  void setUserPageData(value) {
    userPageData = value;
    notifyListeners();
  }

  //  -----  //
  void onError(value) {
    print(value);
  }
}
