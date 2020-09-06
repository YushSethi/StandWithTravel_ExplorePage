import 'package:flutter/material.dart';
import 'package:StandWithTravel/explorePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explore Page',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black54,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        'ExplorePage': (context) => ExplorePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text("Explore page"),
            onPressed: () {
              Navigator.pushNamed(context, "ExplorePage");
            },
          ),
        ],
      ),
    );
  }
}
