import 'package:flutter/material.dart';
import 'package:flutter_pj_1/pages/flash_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.pinkAccent,)),
      home: FlashPage(),
      
    );
  }
}

