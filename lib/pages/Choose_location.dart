import 'package:flutter/material.dart';
import 'package:world_time/pages/CardSetup.dart';
import 'package:world_time/services/GetTime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  Widget cardMaker(Cardsetup card){
    return Card(
      child: InkWell(
        onTap: () async{
          try{
          String time = await getTime(card.time);
          if(context.mounted){
          Navigator.pop(context ,{
            'text': card.text,
            'image': card.imagePath,
            'time': time
          });}
        }
          catch(e){
            Navigator.pop(context ,{
              'text': card.text,
            'image': card.imagePath,
            'time': "Error"});
          }
        },
      child: Column(
        children: [
          Padding(
              padding: EdgeInsetsGeometry.fromLTRB(10, 10, 5, 10),
            child: Row(
              spacing: 5,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(card.imagePath),
                  radius: 60,
                ),
                Text(
                    card.text,
                )
              ],
            ),
          ),
        ],
      ),
    )
    );
  }
  List <Cardsetup> myCards = [
    Cardsetup(text: "Addis Ababa", imagePath: "assets/images/Ethiopia.png", time: "Africa/Addis_Ababa"),
    Cardsetup(text: "Cairo", imagePath: "assets/images/egypt.webp", time: "Africa/Cairo"),
    Cardsetup(text: "Berlin", imagePath: "assets/images/Germany.png", time: "Europe/Berlin"),
    Cardsetup(text: "Athens", imagePath: "assets/images/greece.png", time: "Europe/Athens"),
    Cardsetup(text: "Jakarta", imagePath: "assets/images/indonesia.png", time: "Asia/Jakarta"),
    Cardsetup(text: "Nairobi", imagePath: "assets/images/kenya.png" , time: "Africa/Nairobi"),
    Cardsetup(text: "Seoul", imagePath: "assets/images/southkorea.png", time: "Asia/Seoul"),
    Cardsetup(text: "London", imagePath: "assets/images/UK.png", time: "Europe/London"),
    Cardsetup(text: "New York", imagePath: "assets/images/usa.png", time: "America/New_York"),
    Cardsetup(text: "Chicago", imagePath: "assets/images/usa.png", time: "America/Chicago"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
        ),
        title: Text(
            "Choose Location",
            style: TextStyle(
              color: Colors.white
            ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
      child: Column(
        children:
          myCards.map((card) => cardMaker(card)).toList()
      ),
    ));
  }
}
