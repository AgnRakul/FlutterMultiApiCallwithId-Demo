import 'dart:convert';
import "package:http/http.dart" as http;
import '../Model/post_model.dart';

class APISERVICE {
  Future<List<PostModel>?> getPost() async {
    final response = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/posts',
    ));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final List data = result;

      return data.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to Fetch Stores");
    }
  }

  Future<PostModel> getPostById({String? id}) async {
    print("getPostById" + id!);
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
    );

    if (response.statusCode == 200) {
      return PostModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to Fetch Stores");
    }
  }
}
