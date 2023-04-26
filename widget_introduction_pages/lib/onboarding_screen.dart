import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'home_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index){
              setState((){

                //when last page set onLastPage true
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: [
              Container(
                color: Colors.pink,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              )
            ],
          ),
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Text("skip",
                    style: TextStyle(fontSize: 20),
                    ),
                    onTap: (){
                      _controller.jumpToPage(2);
                    },
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  onLastPage ?
                  GestureDetector(
                    child: Text("done",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return HomePage();
                      }));
                    },
                  ) :
                  GestureDetector(
                    child: Text("next",
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: (){
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                  ),
                ],
              ),),
        ],
      ),
    );
  }
}
