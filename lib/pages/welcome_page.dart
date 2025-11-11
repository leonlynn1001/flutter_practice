import 'package:flutter/material.dart';
import 'package:flutter_pj_1/pages/home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageController;
  int _curlPage = 0;

  @override
  void initState(){
    _pageController = PageController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           PageView(
            controller: _pageController,
            onPageChanged: (int index){
              _curlPage = index;
              //print("Current Page "+ _curlPage.toString());
              setState(() {
                
              });
            },

            children: [
              //page1
              _makeDecoratedBox("p1.png"),
              _makeDecoratedBox("p2.png"),
              //_makeDecoratedBox("p3.png"),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/p3.png"),
                     fit:BoxFit.contain,
                     ),
                ),
                child: Column(
                  children: [
                    Expanded(child: SizedBox()),
                    Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            colors: [Colors.pinkAccent, Colors.amberAccent])
                        ),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context)=> HomePage()
                              )
                              );
                          }, 
                          style : ElevatedButton.styleFrom(
                            backgroundColor : Colors.transparent,
                          ),
                          child: Text(
                            "Start",
                            style: TextStyle(color: Colors.white,fontSize: 20.0),),
                          ),
                    ),
                    SizedBox(height: 200,)
                  ],
                  
                ),
              )
               
            ],
           ),
           //page indicator
           Column(
            children: [
              Expanded(child: SizedBox()),
              SizedBox(
                height: 150,
                child:   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: _curlPage == 0? Colors.amber : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blueAccent,width:2)
                      ),
                    ),
                    SizedBox(width: 5,),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: _curlPage == 0? Colors.amber : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blueAccent,width:2)
                        ),
                      ),
                    SizedBox(width: 5,),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blueAccent,width:2)
                        ),
                      ),
                  ],
                ),
              )
            
            ],
           )
            
          ],
      
      )
      );
    
  }

  _makeDecoratedBox(String image){
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/$image"),
          fit: BoxFit.contain,
          )
      ),
    );
  }
}