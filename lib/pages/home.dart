
import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map date={};
  @override
  Widget build(BuildContext context) {
    date= date.isNotEmpty? date: ModalRoute.of(context)?.settings?.arguments as Map;
   print(date);

   //set background
    String bgImage= date['isDaytime'] ?  'day.jpg' : 'night.png';
    Color? bgcolor=date['isDaytime'] ? Colors.blue : Colors.indigo[700];


    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async{
                       dynamic result=await Navigator.pushNamed(context, '/location');
                        setState(() {
                          date={
                            'time':result['time'],
                            'location':result['location'],
                            'isDaytime':result['isDaytime'],
                            'flag':result['flag']
                          };
                        });
                      },
                    icon:Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                    ),
                    label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                    ),


                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text(
                          date['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      date['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
