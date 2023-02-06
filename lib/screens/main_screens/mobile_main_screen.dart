import 'dart:ui';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/weather.dart';

import '../calculator_screens/calculator_screen.dart';
import '../mail_screen.dart';

class MobileViewMainScreen extends StatefulWidget {
  const MobileViewMainScreen({Key? key}) : super(key: key);

  @override
  State<MobileViewMainScreen> createState() => _MobileViewMainScreenState();
}

class _MobileViewMainScreenState extends State<MobileViewMainScreen> {
  String key = '847236d6e702a966436762b968d0054c';
  String cityName = 'Paris';
  late WeatherFactory wf= WeatherFactory(key);
  Weather? w;
  bool isLoading=false;

  getWeather() async {
    setState(()=>isLoading=true);
    w = await wf.currentWeatherByCityName(cityName);
    isLoading=false;
    setState(() {});
  }

  Widget iconWidget(String title,String location){
    // double height = 77.0;
    // double width = 72.0;
    return  Container(
      // alignment: Alignment.center,
      // color: Colors.deepOrange,
      // width:width.w,height: height.h,
      // width:72.0,height: 87.0,
      // constraints: BoxConstraints(minWidth: width,minHeight: height,maxWidth: 72*2.5,maxHeight: 87*3),
      // padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64.0,
            height:64.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(location),fit: BoxFit.cover),
              color: Colors.black54,
              borderRadius:
              BorderRadius.circular(20),
            ),
          ),
          Text(title,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600,color: Colors.white),)
        ],
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    getWeather();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading?Center(child: CircularProgressIndicator(),):Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        decoration: BoxDecoration(
          color: Colors.blueAccent,
          image: DecorationImage(image: AssetImage("assets/wallpapers/wallpaper-1.jpg",),fit:BoxFit.cover )
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 140,
                // color: Colors.redAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${DateTime.now().hour>12?DateTime.now().hour-12:DateTime.now().hour}:${DateTime.now().minute}",
                            // "7:30",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: SvgPicture.asset("assets/glyph_icons/cellular.svg",height: 20,color: Colors.white,)

                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child:
                            SvgPicture.asset("assets/glyph_icons/wifi.svg",height: 20,color: Colors.white,)

                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child:
                                SvgPicture.asset("assets/glyph_icons/battery-charging.svg",height: 20,color: Colors.white,)
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            constraints: BoxConstraints(minWidth: 100, maxWidth: 1090),
                      padding: EdgeInsets.all(20.0),
                      // color: Colors.black,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 155.w,
                                    height:155.h,
                                    constraints: BoxConstraints(minWidth: 155, minHeight: 170, maxWidth:155*3,maxHeight:170*3,),
                                    padding: EdgeInsets.all( 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(cityName  ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                        SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset("assets/weathers/cloudy.png",fit: BoxFit.fill,),
                                        ),
                                        Text(
                                          w!.temperature.toString().replaceAll("Celsius", "°"),
                                          style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600),),
                                      ],
                                    ),
                                    // color: Colors.white,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      html.window.open('https://open.spotify.com/playlist/4Y1gCpZpx6qx4vWzEVNGtC?si=7beca5e7623a44ac', 'new tab');
                                    },
                                    child: Container(
                                      width: 155.w,
                                      height:155.h,
                                      constraints: BoxConstraints(minWidth: 155, minHeight: 170, maxWidth:155*3,maxHeight:170*3,),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.greenAccent),
                                        color: Color(0xff1d231c),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right:10,
                                            top: 10,
                                            child:SvgPicture.asset("assets/glyph_icons/spotify.svg",width: 30,height: 30,color: Colors.white,),),
                                          Positioned(
                                            left:10,
                                            top: 10,
                                            child:Container(
                                              width: 70.w,
                                                height: 70.h,
                                                constraints: BoxConstraints(minWidth: 70,minHeight: 70,maxHeight:140,maxWidth: 140 ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.brown),
                                                  image: DecorationImage(image: AssetImage("assets/images/play.png"),fit: BoxFit.cover ),
                                                  color: Colors.orange,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                // child: Image.asset("assets/images/play.png",width: 50,height: 50,)
                                              ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 90.w,
                                                    child: Text("グル's Playlist✨",
                                                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),overflow: TextOverflow.ellipsis,),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: Icon(Icons.play_arrow,size: 35,color: Colors.white,),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                      // color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.start,
                              direction: Axis.horizontal,
                              spacing: 20.w,
                              runSpacing: 10,
                              children: [
                                iconWidget("Clock", "assets/ios_icons/clock.png"),
                                iconWidget("Calendar", "assets/ios_icons/calendar.png"),
                                iconWidget("Photos", "assets/ios_icons/photos.png"),
                                iconWidget("Books", "assets/ios_icons/app-books.png"),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CalculatorScreen()));
                                    },
                                    child: iconWidget("Calculator", "assets/ios_icons/calculator.png")),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MailScreen()));
                                    },
                                    child: iconWidget("Mail", "assets/ios_icons/mail.png")),
                                iconWidget("Weather", "assets/ios_icons/weather.png"),
                                iconWidget("Twitter", "assets/ios_icons/twitter.png"),
                                GestureDetector(
                                    onTap: (){
                                      html.window.open('https://www.linkedin.com/in/guruprasadh-j/', 'new tab');
                                    },
                                    child: iconWidget("LinkedIn", "assets/ios_icons/linkedin.png")),
                                iconWidget("Connects", "assets/ios_icons/connect.png"),
                                // iconWidget("WhatsApp", "assets/ios_icons/whatsapp.png"),
                              ],
                            )
                          ],
                      ),
                    ),
                        ),),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 400,
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 20.0),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: new ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                          child: Container(

                            child: BackdropFilter(
                                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 400,
                      margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 67,
                            height: 67,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/ios_icons/phone.png"),fit: BoxFit.cover),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            width: 67,
                            height: 67,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/ios_icons/app-store.png"),fit: BoxFit.cover),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            width: 67,
                            height: 67,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/ios_icons/settings.png"),fit: BoxFit.cover),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),Container(
                            width: 67,
                            height: 67,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/ios_icons/camera.png"),fit: BoxFit.cover),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
