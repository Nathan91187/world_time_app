import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future <String> getTime(String location) async{
  try{
    Response resp = await get(
      Uri.parse("https://world-time-api3.p.rapidapi.com/timezone/$location"),
      headers: {
        'x-rapidapi-key': 'API_KEY',
        'x-rapidapi-host': 'HOST'
      }
    );
    Map times = jsonDecode(resp.body);
    String full = times['datetime'];
      return full.substring(11,16);
  }
  catch(e){
    return "Error";
  }
}