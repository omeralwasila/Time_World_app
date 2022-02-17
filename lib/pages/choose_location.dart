

import 'package:flutter/material.dart';
import 'package:world_time/Services/Word_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url:'Europe/London',location: 'London',flag: 'London.jpg', isDaytime: true),
    WorldTime(url:'Europe/Berlin',location: 'Berlin',flag: 'Berlin.png', isDaytime: true),
    WorldTime(url:'Africa/Cairo',location: 'Cairo',flag: 'Cairo.png', isDaytime: true),
    WorldTime(url:'Africa/Khartoum',location: 'Khartoum',flag: 'Khartoum.png', isDaytime: true),
    WorldTime(url:'America/New_York',location: 'New_York',flag: 'New_York.jpeg', isDaytime: true),
    WorldTime(url:'Asia/Riyadh',location: 'Riyadh',flag: 'Riyadh.png', isDaytime: true),
    WorldTime(url:'Australia/Adelaide',location: 'Adelaide',flag: 'Adelaide.png', isDaytime: true),
    WorldTime(url:'Asia/Anadyr',location: 'Anadyr-Russia',flag: 'Russia.png', isDaytime: true),

  ];

  void updateTime(index) async{
    WorldTime instance =locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor:Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child:ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ) ,
            ),
          );
        },
      ),
    );
  }
}
