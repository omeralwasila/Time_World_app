import 'package:flutter/material.dart';
import 'package:world_time/Services/Word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  Future <void> setupWorldTime () async{
     WorldTime instance =WorldTime(location: 'London', flag: 'sudan.png', url: 'Europe/London', isDaytime:true);

    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/Home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });


   }



  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child:SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ) ,
      ),
    );
  }
}
