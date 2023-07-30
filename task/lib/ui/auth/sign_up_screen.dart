import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/ui/auth/login_screen.dart';
import 'package:task/utils/utils.dart';
import 'package:task/widgets/Buttons.dart';
import 'package:task/widgets/text_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(){
    setState(() {
      loading = true;
    });
    _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString() ,
        password: passwordController.text.toString()).then((value){
      setState(() {
        loading = false;
      });

    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("SignUp"),
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
                    Row(
                      children: [
                        Expanded(
                          child: TextBoxLoginScreen1(
                            text: "First Name",
                            controller: firstNameController,
                            icon: const Icon(Icons.person_2),
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please Enter FirstName";
                              }
                              return null;
                            } ,
                          ),
                        ),// for FirstName
                        Expanded(
                          child: TextBoxLoginScreen1(
                            text: "Last Name",
                            controller: lastNameController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please Enter Last Email";
                              }
                              return null;
                            } ,
                          ),
                        ), //for Lastname
                      ],
                    ),
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
                    ),// For Username
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
              HomeScreenButton1(loading: loading,text: "Create Account", onPressed: (){
                if(_formKey.currentState!.validate()){
                  login();
                }
              }),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have an Account!"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                  }, child: const Text("Sign In", style: TextStyle(color: Colors.green),))
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}
