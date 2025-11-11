import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pj_1/pages/welcome_page.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashPage extends StatefulWidget {
  const FlashPage({super.key});
  
  

  @override
  State<FlashPage> createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> {
  //toggle for download btn
  bool isDownLoad = false;

  _checkVersion() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      isDownLoad = true;
    });
   
  }

  @override
  //initState() is a lifecycle method in a StatefulWidget — it’s called exactly once when your widget is first created.
  void initState(){
    super.initState();
    _checkVersion();
  }

  @override
  Widget build(BuildContext context) {
    double vSpace = 30.0;
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              duration: Duration(seconds: 5),
              child:  _makeLogo(),
            ),
           
            SizedBox(height: vSpace,),
            FadeInUp(
              duration: Duration(seconds: 1),
              delay: Duration(seconds: 5),
              child: _makeTitle()
              ),
            SizedBox(height: vSpace,),
            FadeIn( 
              delay: Duration(seconds: 6),
              duration: Duration(seconds: 1),
              child: _makeProgress()
              ).heartBeat(),
            SizedBox(height: vSpace,),
            FadeInLeft(
              delay: Duration(seconds: 11),
              duration: Duration(seconds: 1),
              child:  _makeLoadingText()
              ),
            SizedBox(height: vSpace,),
            isDownLoad ? BounceIn(delay:Duration(seconds: 12),child: _makeDownLoadBtn()) : SizedBox(),

          ],
        )
      ),
    );
  }
  //this is logo
  _makeLogo(){
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 236, 147, 177),
          width: 1.0,
        )
      ),
      child: CircleAvatar(
      radius: 50.0,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage("assets/images/logo.png"),
    ),
    ).heartBeat(delay: Duration(seconds: 5), duration: Duration(seconds: 2));
  }

  _makeTitle(){
    return Text(
      "Coder Media",
      style: GoogleFonts.exo2(
        textStyle: TextStyle(
        color: Colors.pinkAccent,
        fontSize: 40.0,
        fontWeight: FontWeight.bold
      ),
      )
    );
  }

  _makeProgress(){
    return CircularProgressIndicator(
      color: Colors.redAccent,
      backgroundColor: Colors.amber,
    ).bounce(
      delay: Duration(seconds: 9),
      duration: Duration(seconds: 2)
    );
  }

  _makeLoadingText(){
    return Text("Please wait",
      style: GoogleFonts.notoSans(
        textStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        )
      )
    );
  }

  _makeDownLoadBtn(){
    return ElevatedButton.icon(onPressed: ()=>{
        // debugPrint("Width is")
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()))
    }, 
    style: ElevatedButton.styleFrom(
      elevation: 5,
      backgroundColor: Colors.pinkAccent,
    ),
    icon: Icon(Icons.download, color: Colors.white),
    label:Text("Download", style: TextStyle(color:Colors.white))
    );
  }
}