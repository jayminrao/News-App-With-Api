import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ModelClass.dart';
import 'api_repo.dart';

class detailScreen extends StatefulWidget {
  final String? category;
  final String? description;
  final String? url;
  final String? country;

  const detailScreen(
      {Key? key, this.category, this.description, this.url, this.country})
      : super(key: key);

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  List<PostModel> pm = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isLoading = true;
    });
    ApiRepo().loadJsonData(widget.category).then((value) {
      pm = value;

      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text('News Detail')),
      body: Column(
        children: [
          Container(
            // height: 120,
            width: 400,
            color: Colors.black,
            child: Column(
              children: [
                Text(
                  'News Name',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.category!,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Divider(height: 2,color: Colors.white,),
          SizedBox(height: 10,),
          Container(
            // height: 200,
            width: 400,
            color: Colors.black,
            child: Column(
              children: [
                Text(
                  'News Description',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.description!,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Divider(height: 2,color: Colors.white,),
          SizedBox(height: 10,),
          Container(
            // height: 100,
            width: 400,
            color: Colors.black,
            child: Column(
              children: [
                Text(
                  'News Website',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.url!,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Divider(height: 2,color: Colors.white,),
          SizedBox(height: 10,),
          Container(
            // height: 100,
            width: 400,
            color: Colors.black,
            child: Column(
              children: [
                Text(
                  'News Country',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.country!,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Divider(height: 2,color: Colors.white,),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
