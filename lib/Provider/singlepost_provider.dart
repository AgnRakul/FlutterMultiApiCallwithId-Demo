import 'package:flutter/material.dart';

import '../Model/post_model.dart';
import '../Service/api_service.dart';

class SinglePostProvider extends ChangeNotifier {
  PostModel post = PostModel();

  int? _userId;
  int? get getUserId {
    return _userId;
  }

  int? _id;
  int? get getId {
    return _id;
  }

  String _title = '';
  String get getTitle {
    return _title;
  }

  String _body = '';
  String get getBody {
    return _body;
  }

  void getPostList() {
    APISERVICE().getPostById(id: _id.toString()).then(
      (value) {
        _userId = value.userId;
        _id = value.id;

        _title = value.title.toString();
        _body = value.body.toString();

        notifyListeners();
        return PostModel();
      },
    );
  }
}
