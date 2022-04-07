import 'package:exampleofmyproject/Model/post_model.dart';
import 'package:exampleofmyproject/Service/api_service.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ScreenTwo extends StatelessWidget {

  const ScreenTwo({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(singlePostProvider.getTitle),
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
      body: Center(
        child: FutureBuilder<PostModel>(
          future: APISERVICE().getPostById(id: id.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              return Text("post data : ${snapshot.data!.toJson()}");
            }else if (snapshot.hasError){
              return const Text("Some error occurred");
            }else {
              return const CircularProgressIndicator();
            }
          }
        ),
      ),
    );
  }
}
