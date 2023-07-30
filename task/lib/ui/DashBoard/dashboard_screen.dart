import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/ui/Bottom_Nav_Bar_Screens/more.dart';
import 'package:task/ui/Bottom_Nav_Bar_Screens/services.dart';
import 'package:task/ui/home_screen.dart';
import 'package:task/utils/utils.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int myIndex = 0;
  List<Widget> widgetList = const [
    ServicesScreen(),
    MoreScreen(),
  ];

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFEBEBEB),
        appBar: AppBar(
          backgroundColor: const Color(0xFFEBEBEB),
          elevation: 1,
          title: const Text("Select a Service"),
          centerTitle: true,
          automaticallyImplyLeading: false,
            actions: [
              IconButton(onPressed: (){
                auth.signOut().then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                }).onError((error, stackTrace){
                  Utils().toastMessage(error.toString());
                });
              }, icon: const Icon(Icons.logout))
            ],
        ),
        body: Column(

          children: [

            Expanded(
              child: Center(
                child: widgetList[myIndex],
              ),

            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/grass.png'),
                      fit: BoxFit.cover
                  )
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Services"),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
          ],
        ),
      ),
    );
  }
}
