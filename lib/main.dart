// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:exampleofmyproject/screen2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/post_model_provider.dart';
import 'Provider/singlepost_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<PostProvider>(
        create: (context) => PostProvider(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    postProvider.getPostList();

    return Scaffold(
      body: Consumer<PostProvider>(
        builder: (context, value, child) => Stack(
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: value.postLists.length,
              itemBuilder: (context, index) {
                final data = value.postLists[index];

                return Card(
                  color: const Color(0xFFFBFBFB),
                  elevation: value.selectedIndex == index ? 0 : 0,
                  child: ListTile(
                    selected: value.selectedIndex == index ? true : false,
                    trailing: value.selectedIndex == index
                        ? const Icon(
                            Icons.check_circle_rounded,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                          ),
                    title: Text(
                      data.title ?? 'No data',
                      style: TextStyle(
                        color: value.selectedIndex == index
                            ? Colors.blue
                            : Colors.black,
                        fontFamily: 'Circular Std',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      value.onChangedState(index);
                      debugPrint(
                        data.id.toString(),
                      );
                    },
                  ),
                );
              },
            ),
            Visibility(
              visible: value.isVisible,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // background
                      fixedSize: const Size(300, 58),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      final int selectedIndex =
                          context.read<PostProvider>().selectedIndex;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((_) => ScreenTwo(id: selectedIndex))));
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
