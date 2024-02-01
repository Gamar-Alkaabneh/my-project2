import 'package:final_project/screens/Explore.dart';
import 'package:final_project/screens/NavigationBarPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
      title: 'Aspen Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
      routes: {"/Explore":(_)=>Explore()},
    );
  });
}
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return Sizer(builder: builder)
    return Scaffold(


      body:Stack(
        //fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Overlay
          Positioned(top:90,left:53 ,right: 53,
              child: Container(child:Image.asset(
            'assets/Aspenaspen_logo_text_img (1).png',
            width: 50.w,
            height: 30.h,
            ),)),
                Positioned(left: 34,bottom: 120,
                    child: Container(padding: EdgeInsets.only(left: 20),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Text("Plan your ",style: TextStyle(color:Colors.white,fontSize: 24,fontFamily: "Montserrat",fontWeight:FontWeight.w400),),
                        Text(" Luxurious",style: TextStyle(color:Colors.white,fontSize: 40,fontFamily: "Montserrat",fontWeight:FontWeight.w500)),
                        Text(" Vacation",style: TextStyle(color:Colors.white,fontSize: 40,fontFamily: "Montserrat",fontWeight:FontWeight.w500))],),
                    )),
               Positioned(top:90.h,left:32,right:32,child:
               ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>NavigationBarpage()));},
                 child: Text("Explore",style:TextStyle(color: Colors.white,fontSize: 16,fontFamily: "CircularXX") ,),
                 style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),))

        ],
            ),
          );





  }
}
