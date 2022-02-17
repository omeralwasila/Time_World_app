

import 'dart:ffi';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {


  late String location;//location name for the ui
  late String time;//the time in that location
  late String flag; //url to an asset flag icon
  late String url;//location url for api endpoint
   bool isDaytime;// true or fals if daytime or not

 WorldTime({required this.location,required this.flag,required this.url, required this.isDaytime});

  Future <void> getTime() async{

    try {

      final Url='http://worldtimeapi.org/api/timezone/$url';
      Response respons =  await get(Uri.parse(Url));
      Map data =jsonDecode(respons.body);
      // print(data);

      //fet properties  from data
      String datetime=data['datetime'];
      String offset =data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      //create DateTime object
      DateTime now= DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(offset) ));

      //set time properity
      isDaytime= now.hour>5 && now.hour < 18 ? true : false ;
      time = DateFormat.jm().format(now);
    }
    catch (e){
      print('caught error:$e');
      time=' not Found ';
    }

  }


}
