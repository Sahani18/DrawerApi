import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class GitHub extends StatefulWidget {
  @override
  _GitHubState createState() => _GitHubState();
}

class _GitHubState extends State<GitHub> {
  final String link = "https://randomuser.me/api/?results=50";
  List data;
  bool isLoading = false;

  Future getUser() async {
    var response = await http.get(Uri.encodeFull(link));

    List userData = jsonDecode(response.body)['results'];
    setState(() {
      data = userData;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("Random User")),
      ),
      body: Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.pink.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Image(
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  data[index]['picture']['thumbnail']),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  data[index]['name']['first'] +
                                      " " +
                                      data[index]['name']['last'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(padding: EdgeInsets.only(top: 2)),
                                Text(data[index]['phone']),
                                Padding(padding: EdgeInsets.only(top: 2)),
                                Text("Gender : ${data[index]['gender']}",
                                    style: TextStyle(fontSize: 15)),
                                Padding(padding: EdgeInsets.only(top: 1)),
                                Text(data[index]['email'],
                                    style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
