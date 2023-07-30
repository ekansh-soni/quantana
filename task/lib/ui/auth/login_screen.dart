import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/ui/DashBoard/dashboard_screen.dart';
import 'package:task/widgets/Buttons.dart';
import 'package:task/widgets/text_box.dart';

import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }

  final _auth = FirebaseAuth.instance;

  void login(){
    setState(() {
      loading= true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()
    ).then((value) {
      // Utils().toastMessage(value.user!.email.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoardScreen(),));
      setState(() {
        loading= false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading= false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextBoxLoginScreen1(
                      text: "Email",
                      controller: emailController,
                      icon: const Icon(Icons.mail),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Enter Valid Email";
                        }
                        return null;
                      } ,
                    ), // For Username
                    TextBoxLoginScreen1(
                      text: "Password",
                      controller: passwordController,
                      OT: true,
                      icon: const Icon(Icons.password),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Enter Password";
                        }
                        return null;
                      },
                    ), // For Password
                  ],
                ),
              ),
              HomeScreenButton1(text: "Login",loading: loading ,onPressed: (){
                if(_formKey.currentState!.validate()){login();}
              }),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have an Account! "),
                  TextButton(onPressed: (){}, child: const Text("Tap Here", style: TextStyle(color: Colors.green),))
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}
