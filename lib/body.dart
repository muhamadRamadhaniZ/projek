import 'dart:convert';

import 'package:crud/detail.dart';
import 'package:crud/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List _post = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Berita Indo",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: ListView.builder(
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: _post[index]['urlToImage'] != null
                  ? Image.network(_post[index]['urlToImage'], width: 100,fit: BoxFit.cover,)
                  : Center(),
            ),
            title: Text('${_post[index]['title']}', maxLines: 2,overflow: TextOverflow.ellipsis,),
            subtitle: Text('${_post[index]['description']}', maxLines: 2,overflow: TextOverflow.ellipsis,),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => Detail(
                    url: _post[index]['url'],
                    title: _post[index]['title'],
                    content: _post[index]['content'],
                    publishedAt: _post[index]['publishedAt'],
                    author: _post[index]['author'],
                    urlToImage: _post[index]['urlToImage'],
                    
                  )));
            },
          );
        },
      ),
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => Home())),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=id&apiKey=d90eab2bdd53406ea87463fd85f5e4e0');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _post = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

}
