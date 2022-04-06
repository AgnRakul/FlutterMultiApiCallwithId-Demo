import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/singlepost_provider.dart';
import 'main.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final singlePostProvider = Provider.of<SinglePostProvider>(context, listen: false);
    singlePostProvider.getPostList();
    return Scaffold(
      appBar: AppBar(
        title: Text(singlePostProvider.getTitle),
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
    );
  }
}
