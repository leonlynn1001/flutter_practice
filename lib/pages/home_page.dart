import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> slideImages = [
    "p1.png",
    "p2.png",
    "p3.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Home Page",
          style: GoogleFonts.barlow(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          ),
          actions: [
            ElevatedButton(
              onPressed: (){},
              child: Icon(Icons.home),
              )
              
              ],
        ),
      body: _makeSlideShow(),
      drawer: Drawer(
        child: ListView(
          children: [
            _makeDrawerHeader(),
            _makeDrawerItem("Product", Icons.home),
            _makeDrawerItem("Cart", Icons.shopping_cart),
            _makeDrawerItem("Profile", Icons.person),
            _makeDrawerItem("Setting", Icons.settings),
          ],
        ),
      ),
    );
  }

  _makeDrawerHeader(){
    return DrawerHeader(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: Text(
        "Menu",
        style: GoogleFonts.barlow(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 26.0,
          )
        ),
        ),
    );
  }

  _makeDrawerItem(String title,IconData icon){
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {},
    );
  }

  _makeSlideShow(){
    return  Swiper(
      itemBuilder: (BuildContext context, int index){
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/${slideImages[index]}")
            )
          ),
        );
      },
      itemCount: 3,
      //pagination: new SwiperPagination(),
      //control: new SwiperControl()
    );
  }
}