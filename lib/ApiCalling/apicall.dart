import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/DetailScreen.dart';

import 'ModelClass.dart';
import 'api_repo.dart';

class apicallScreen extends StatefulWidget {
  final String? category;

  const apicallScreen({Key? key, this.category}) : super(key: key);

  @override
  State<apicallScreen> createState() => _apicallScreenState();
}

class _apicallScreenState extends State<apicallScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Text("News App"),
      ),
      body: (isLoading == true)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: pm.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => detailScreen(
                            category: pm[index].name, description: pm[index].description, url: pm[index].url, country: pm[index].country,
                          ),));
                        },
                        child: Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2,color: Colors.white),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 2,),
                                  Text(
                            pm[index].name!,
                            style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          ),
                                  IconButton(onPressed:() {}, icon: Icon(CupertinoIcons.heart_fill,color: Colors.white,))
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                );

                // Text(pm[index].name!);
              },
            ),
    );
  }
}
