import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/Models/PetModel.dart';

import 'details_page.dart';
class HouseSittingScreen extends StatefulWidget {
  const HouseSittingScreen({super.key});

  @override
  State<HouseSittingScreen> createState() => _HouseSittingScreenState();
}

class _HouseSittingScreenState extends State<HouseSittingScreen> {

  Future<PetModel> petApi() async {
    final response = await http.get(Uri.parse('https://jatinderji.github.io/users_pets_api/users_pets.json'));
      var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return PetModel.fromJson(data);
    }else{
      return PetModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEBEBEB),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: const Text(
          "House Sitting",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.settings),
          Icon(Icons.location_on),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<PetModel>(
              future: petApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailsPage(userPet:  snapshot.data!.data![index]),));
                          },
                          title: Column(
                            children: [
                              Row(
                                children: [
                                const Text("Owner Name: ", style:  TextStyle(fontSize:14, fontWeight: FontWeight.bold ),),
                                Expanded(child: Text(snapshot.data!.data![index].userName.toString(), style:const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),))
                              ],),
                              Row(children: [
                                const Text("Pet Name: ", style:  TextStyle(fontSize:14, fontWeight: FontWeight.bold ),),
                                Text(snapshot.data!.data![index].petName.toString(), style:const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),)
                              ],),
                              Row(children: [
                                const Text("Friendly: ", style:  TextStyle(fontSize:14, fontWeight: FontWeight.bold ),),
                                Text(snapshot.data!.data![index].isFriendly.toString(), style:const TextStyle(fontSize: 14, ),)
                              ],),
                            ],
                          ) ,
                          leading: CircleAvatar(radius: 25,backgroundImage: NetworkImage(snapshot.data!.data![index].petImage.toString())),
                          trailing: const Icon(Icons.chevron_right, size: 24,),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )

        ],
      ),
    );
  }
}
// Text(snapshot.data!.data![index].id.toString())