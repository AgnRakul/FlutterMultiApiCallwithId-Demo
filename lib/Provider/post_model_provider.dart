import 'package:exampleofmyproject/Model/post_model.dart';
import 'package:exampleofmyproject/Service/api_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  PostModel post = PostModel();

  bool isVisible = false;
  int selectedIndex = -1;
int postId = 0;
  void onChangedState(int index,int id) {
    isVisible = true;
    selectedIndex = index;
    postId = id;
    notifyListeners();
  }

  int get getpOstid {
    return postId;
  }

  List<PostModel> postLists = [];

  void getPostList() {
    APISERVICE().getPost().then((value) => {
          if (value!.isNotEmpty)
            {
              postLists = [...value],
              notifyListeners()
            }
          else
            {postLists = []}
        });
  }
}
