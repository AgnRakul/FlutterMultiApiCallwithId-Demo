import 'package:exampleofmyproject/Provider/post_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/post_model_provider.dart';
import 'Provider/singlepost_provider.dart';
import 'main.dart';r

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final singlePostProvider =
        Provider.of<SinglePostProvider>(context, listen: false);
    final postProvider = Provider.of<PostProvider>(context, listen: false);

    singlePostProvider.getPostList(postProvider.getpOstid);
    return Consumer<SinglePostProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(value.getId.toString()),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const MyApp()),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_ios),
            )
          ],
        ),
      ),
    );
  }
}
