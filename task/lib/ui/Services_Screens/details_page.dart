import 'package:flutter/material.dart';
import 'package:task/widgets/Buttons.dart';

import '../../Models/PetModel.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.userPet});
  final Data userPet;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.chevron_left, size: 30,),
        ),
        title: Text(userPet.userName.toString(),style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.share),
          )
        ],
        centerTitle: true,
      ) ,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(userPet.petImage.toString()), fit: BoxFit.fill)),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          HomeScreenButton1(text: "Contact This Sitter", onPressed: (){})
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          // Profile image
          Positioned(
            top: 150.0, // (background container size) - (circle height / 2)
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(userPet.petImage.toString()), fit: BoxFit.fill)
              ),
            ),
          )
        ],
      )
    );
  }
}
