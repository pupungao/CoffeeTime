import 'package:flutter/material.dart';
import 'package:coffeeapp/widgets/appbar_actions.dart';
import './widgets/input_field.dart';
import './widgets/carousel.dart';
import './widgets/tags.dart';
import './widgets/coffee_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF93dfd9),
          elevation: 0.0,
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: InkResponse(
              onTap: () {},
              child: Icon(
                Icons.menu,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 18.0, top: 5),
            child: Image(
              image: AssetImage('images/amazoncoffee.png'),
              width: 60,
              height: 60,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            AppBarActions(),
          ],
        ),
        body: Container(
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(),
                  Carousel(),
                  Padding(padding: EdgeInsets.all(5), child: Tags()),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Expanded(child: Books()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}