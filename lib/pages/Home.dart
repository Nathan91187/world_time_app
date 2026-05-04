import 'package:flutter/material.dart';
import 'package:world_time/pages/Choose_location.dart';
import 'package:world_time/services/GetTime.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text = "Select City";
  String imagePath = "assets/images/earth.jpg";
  String time = "00:00";
  bool standard = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
              "assets/images/background.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 150),
            child: Column(
              children: [
                IconButton(
                    onPressed: () async{
                     final result = await Navigator.pushNamed(context, '/location') as Map;
                     if (result != null){
                       setState(() {
                       text = result['text'];
                       imagePath = result['image'];
                       time = result['time'];
                       });
                     }
                    },
                    icon: Icon(
                        Icons.bar_chart,
                        color: Colors.white,
                      size: 50,
                    )
                ),

                Row(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(imagePath),
                      radius: 30,
                    ),
                    Text(
                        text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40
                      ),
                    ),
                  ],
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
