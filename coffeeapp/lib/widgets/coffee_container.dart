import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screens/coffeescreen.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  List<dynamic> _items = [];
  fetchData() async {
    final res =
        await http.get(Uri.parse('https://api.sampleapis.com/coffee/hot'));
    final data = jsonDecode(res.body);
    setState(() {
      _items = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return _items != null
        ? GridView.count(
            childAspectRatio: 0.7,
            crossAxisCount: 2,
            children: List.generate(_items.length, (index) {
              return Container(
                height: 600,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsPage(data: _items[index])));
                  },
                  child: Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          child: Hero(
                            tag: _items[index]['image'],
                            child: Image.network(
                              _items[index]['image'],
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _items[index]['title'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
