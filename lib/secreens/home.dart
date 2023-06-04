import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  //container
  late double containerHeight;
  late double containerToHeight;
  //circle
  late double circleWidth;
  late double circleToWidth;
  late double circleX;
  late double circleY;
  late double circleToX;
  late double circleToY;

  final Duration duration=const Duration(milliseconds: 300);
  bool _isShown=false;


  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: duration)
    ..addListener(_onAnimationUpdate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    
    containerHeight=height/3;
    containerToHeight=(height/2)+height/6;

    circleWidth=width-(width/3);
    circleToWidth=containerToHeight*1.4;

    circleX=(width/3)/2;
    circleY=-circleWidth/2;

    circleToX=width/2;
    circleToY=-circleToWidth/8;
    
    return Scaffold(
        body: Column(
          children: [
            AnimatedContainer(
                duration: duration,
              width: double.infinity,
              height: _isShown?containerToHeight+80:containerHeight+80,

              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: duration,
                    width: double.infinity,
                    height: _isShown?containerToHeight:containerHeight,
                    color: const Color.fromRGBO(61, 82, 169,1),
                    child: Stack(
                      children: [
                        _circle,
                        _cloud,
                        _header,
                        _man,
                        light1,
                        light2,
                        light3,
                        light4
                      ],
                    ),
                  ),
                  _gateWay
                ],
              ),
            ),


          ],
        ),
    );
  }

  Widget get _man{
    return Align(
      alignment: Alignment.bottomCenter,
      child: Transform.scale(
        scale:2.2*_controller.value,
        alignment: Alignment.bottomCenter,
        child: Image.asset("assets/images/man.png"),
      ),
    );

  }
  Widget get _cloud{
    return AnimatedPositioned(
      duration: duration,
      right: circleX,
      top: _isShown?-circleWidth:0,
      child: Container(
        width: circleWidth,
        height: circleWidth/2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:const EdgeInsets.only(bottom: 50),
                child: Image.asset("assets/icons/cloud.png",height: 30,width: 30,)
            ),
            Image.asset("assets/icons/cloud.png"),
          ],
        ),
      ),
    );
  }
  Widget get _circle{
    return  AnimatedPositioned(
      duration:duration,
      left: _isShown?circleToX:circleX,
      top:_isShown?circleToY:circleY,
      child: AnimatedContainer(
        duration: duration,
        height:_isShown?circleToWidth: circleWidth,
        width:_isShown?circleToWidth: circleWidth,
        decoration:const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(255, 118, 146,1)
        ),
      ),
    );
  }
  Widget get _header{
    return Padding(
      padding:const EdgeInsets.only(top: 30,left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/icons/icon1.png",height: 30,width: 30,),
          const Icon(Icons.menu_outlined,color: Colors.white,size: 30,)
        ],
      ),
    );
  }
  Widget get _gateWay{
    return Positioned(
     bottom: 10,
      child:Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(text:"Stan's\n",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 22),
                    children: [
                      TextSpan(text: 'Office',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30))
                    ],
                  ),
                  textAlign: TextAlign.start,

                ),
                Text.rich(TextSpan(text:"23° indoor\nDoor closed",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 18)))

              ],
            ),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            margin:const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width*0.9,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.grey,blurRadius: 15,offset: Offset(5,5),spreadRadius: 0)
              ]
            ),
            child: Row(
              children: [
                Expanded(
                    child: Image.asset("assets/images/image1.png",fit: BoxFit.cover,)
                ),
                Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Gateway",style:Theme.of(context).textTheme.titleLarge!.copyWith(color: const Color.fromRGBO(61, 82, 169,1),)),
                          Text("online",style:Theme.of(context).textTheme.titleSmall!.copyWith(color:Colors.grey)),
                          Text("Alarming",style:Theme.of(context).textTheme.titleMedium!.copyWith(color:Colors.grey)),
                          Switch(
                            value:_isShown ,
                            onChanged: _startAnimation,
                            activeColor:const Color.fromRGBO(255, 117, 146, 1) ,

                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget get light1{
   double width= MediaQuery.of(context).size.width;
    return AnimatedPositioned(
      left:_isShown?width/5:width/2,
       bottom: _isShown?(containerToHeight-(containerToHeight/3)):0,
       duration: duration,
      child:Transform.rotate(
          angle: -0.4,
          child: Image.asset("assets/icons/lighting.png")
      ) ,
    );
  }
  Widget get light2{
    double width= MediaQuery.of(context).size.width;
    return AnimatedPositioned(
      left:_isShown?width/12:width/2,
      bottom: _isShown?containerToHeight/3:0,
      duration: duration,
      child:Transform.rotate(
        angle: -0.8,
          child: Image.asset("assets/icons/lighting.png")
      ) ,
    );
  }

  Widget get light3{
    double width= MediaQuery.of(context).size.width;
    return AnimatedPositioned(
      right:_isShown?width/5:width/2,
      bottom: _isShown?(containerToHeight-(containerToHeight/3)):0,
      duration: duration,
      child:Transform.rotate(
          angle: 0.0,
          child: Image.asset("assets/icons/lighting.png")
      ) ,
    );
  }
  Widget get light4{
    double width= MediaQuery.of(context).size.width;
    return AnimatedPositioned(
      right:_isShown?width/12:width/2,
      bottom: _isShown?containerToHeight/3:0,
      duration: duration,
      child:Transform.rotate(
          angle: 0,
          child: Image.asset("assets/icons/lighting.png")
      ) ,
    );
  }



  void _startAnimation(bool value) {
    setState(() {
      if(value){
        _controller.forward();
      }else{
        _controller.reverse();
      }
      _isShown=value;
    });
  }

  void _onAnimationUpdate(){
    setState(() {

    });
  }
}
