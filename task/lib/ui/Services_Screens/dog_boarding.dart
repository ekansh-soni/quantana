import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task/widgets/Buttons.dart';

class DogBoarding extends StatefulWidget {
  const DogBoarding({super.key});

  @override
  State<DogBoarding> createState() => _DogBoardingState();
}

class _DogBoardingState extends State<DogBoarding> {
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEBEBEB),
        leading:  InkWell(onTap: (){Navigator.pop(context);},child: const Icon(Icons.chevron_left, size: 30,)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Skip", style: TextStyle(fontSize: 16, color: Colors.black),),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:20, top: 10, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dog Boarding', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
            const Text('When Do you need a sitter?', style: TextStyle(fontSize: 16, ),),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2.2,
                  width: MediaQuery.of(context).size.width,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                        blurRadius: 6,
                        color: Colors.grey.withOpacity(0.5))],
                  ),
                  child:   Padding(
                    padding:  const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20 ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Pet type(s)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius:const  BorderRadius.all(Radius.circular(50))
                                ),
                                child: const Center(child: Text("Dog", style: TextStyle(fontSize: 17),)),
                              ),
                              const SizedBox(width: 20,),
                              Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: const BorderRadius.all(Radius.circular(50))
                                ),
                                child: const  Center(child: Text("Cat",style: TextStyle(fontSize: 17))),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const Text("Dates", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        Center(
                          child: TextField(
                            readOnly: true,
                            controller: dateController,
                            decoration: const InputDecoration(hintText: 'Select your Date'),
                            onTap: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              if (date != null) {
                                dateController.text = DateFormat('MM/dd/yyyy').format(date);
                              }
                            },
                          )),
                        const SizedBox(height: 30,),
                        const Text("Location", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        const Text("New York, NY 10020, USA", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      ],
                    ),
                  )
                ),

              ],
            ),
            const SizedBox(height: 10,),
            const Text("Owners Who enter there dates find someone Faster", style: TextStyle(fontSize: 12),),
            const SizedBox(height: 50,),
            HomeScreenButton1(text: "Next", onPressed: (){}, textColor: Colors.white,),
          ],
        ),
      ),
    );
  }
}
