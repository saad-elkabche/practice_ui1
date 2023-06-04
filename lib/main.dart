import 'package:flutter/material.dart';

import 'secreens/home.dart';


void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      title: 'myApp',
      home: Home(),
    );
  }
}
