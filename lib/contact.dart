import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final String url = "https://api.github.com/users";
  List data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future getData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );

    setState(() {
      var convertData = json.decode(response.body);
      data = convertData;

      isLoading = false;
    });
     //return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  backgroundColor: Colors.red,
                )
              : ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.all(6),
                      color: Colors.red.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(
                              data[index]['avatar_url'],
                            ),
                            title: Text(
                              data[index]['login'],
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              data[index]['url'],
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
