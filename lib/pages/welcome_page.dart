import 'package:flutter/material.dart';

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
              DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,
                  )
                )
                ),
                //page2
                 // Page 2
              Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    "Welcome Page 2",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              //page3
               // Page 2
              Container(
                color: Colors.pink,
                child: const Center(
                  child: Text(
                    "Welcome Page 3",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),


              
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
}