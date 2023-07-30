import 'package:flutter/material.dart';
import 'package:task/ui/Services_Screens/dog_boarding.dart';

import '../Services_Screens/house_sitting.dart';


class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color(0xFFEBEBEB),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text("FIND AND BOOK A SITTER"),
            const SizedBox(height: 20,),
            Expanded(
              child: Center(
                child: ListView(
                  children:  [
                    InkWell(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DogBoarding(),));
                    },child: const Card(child: ListTile(
                      leading: Icon(Icons.dark_mode),
                      title: Text("Dog Boarding"),
                      subtitle: Text("In the sitter's home"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),),),
                    InkWell(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HouseSittingScreen()));
                    },child: const Card(child: ListTile(
                      leading: Icon(Icons.dark_mode),
                      title: Text("House Sitting"),
                      subtitle: Text("in Your Home"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),),),
                    const Card(child: ListTile(
                      leading: Icon(Icons.food_bank),
                      title: Text("Drop-In visits "),
                      subtitle: Text("Visit in your home"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),),
                    const Card(child: ListTile(
                      leading: Icon(Icons.sunny),
                      title: Text("Doggy Day Care"),
                      subtitle: Text("In the sitter's home"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),),
                    const Card(child: ListTile(
                      leading: Icon(Icons.directions_walk),
                      title: Text("Dog walking"),
                      subtitle: Text("In Your Neighborhood"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),),

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
