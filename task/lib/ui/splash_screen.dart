import 'package:flutter/material.dart';
import 'package:task/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFEBEBEB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome"),
            SizedBox(height: 10,),
            Text("We Are Setting Things Up :)"),
            SizedBox(height: 50,),
            CircularProgressIndicator(color: Colors.red,)
          ],
        )
      ),
    );
  }
}
