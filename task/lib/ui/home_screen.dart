import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/ui/auth/login_screen.dart';
import 'package:task/ui/auth/sign_up_screen.dart';
import 'package:task/widgets/Buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: CircleAvatar(backgroundColor: Colors.green, backgroundImage:AssetImage('assets/home.png'),  ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                },
                child: const Text("Sign In", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Container(
                    height: MediaQuery.of(context).size.height/2,
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(image: AssetImage('assets/home.png'))
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: HomeScreenButton1(text: "Find Pet Care", onPressed: (){}),
                ),
                const SizedBox(height: 20,),
                HomeScreenButton2(text: "Create Account", onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SignUpScreen(),));
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
