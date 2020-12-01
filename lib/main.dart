import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setuNofification();
  }

  void setuNofification() async {
    _firebaseMessaging.getToken().then((value) {
      print(value);
    });
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print("Message: $message");
    }, onResume: (Map<String, dynamic> message) async {
      print("Resume: $message");
    }, onLaunch: (Map<String, dynamic> message) async {
      print("Launch: $message");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            child: RaisedButton(child: Text("Text"), onPressed: null)),
        title: Text("Carousel"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello1"),
          RaisedButton(
            onPressed: () {},
            child: Text("OK"),
            color: Colors.amber,
            hoverColor: Colors.red,
          ),
          FlatButton(onPressed: () {}, child: Text("Flat"))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black54,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Post", icon: Icon(Icons.cloud_upload)),
          BottomNavigationBarItem(label: "Page", icon: Icon(Icons.pages))
        ],
      ),
    );
  }
}
