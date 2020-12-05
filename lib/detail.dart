import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final url;
  final title;
  final urlToImage;
  final publishedAt;
  final content;
  final author;

  Detail({
    this.url,
    this.title,
    this.content,
    this.publishedAt,
    this.author,
    this.urlToImage
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          urlToImage != null ? Image.network(urlToImage) : Container(
            height: 250,
            color: Colors.grey[200],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$publishedAt',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('$content'),
                Divider(),
                Text('$author'),
                Text('$url'),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
