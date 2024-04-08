import 'package:flutter/material.dart';
import 'package:news_app/apicall.dart';

import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> categoryList = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('News App'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3),
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => apicallScreen(category :categoryList[index] ),));
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ApiCall(category: categoryList[index])));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2,color: Colors.white),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(categoryList[index],style: TextStyle(color: Colors.white,fontSize: 20,)),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

