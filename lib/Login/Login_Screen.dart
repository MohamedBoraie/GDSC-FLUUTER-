import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gdscproject/Component/Coponent.dart';
import 'package:gdscproject/Rigister/RigisterScreen.dart';

import '../Layout/layoutScreen.dart';
import '../animatedList/AnimatedList.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool obscure = true;

bool dcolor1 = true;
bool dcolor2 = true;

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  var setPasswordController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: size.height / 3,
                    width: double.infinity,
                    color: Colors.purple,
                    child: Center(
                      child: Text(
                        "login".toUpperCase(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      MyTextFormField(
                          label: ('Email Address'),
                          prefixIcon: (Icons.email_outlined),
                          controller: emailController,
                          hint: ' Example@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isNotEmpty &&!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)){
                        return " Email formate Is Incorrect";
                      }
                      if(value.isEmpty){
                        return " Email Address is Required";
                      }
                      else{
                        return null;
                      }
                                    },
                      ),

                      SizedBox(
                        height: size.height / 70,
                      ),
                      MyTextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Password Is Required';

                          }
                        },
                        label: 'Password',
                        hint: '. . . . . . . . . . .',
                        prefixIcon: Icons.lock_outline,
                        keyboardType: TextInputType.visiblePassword,
                        controller: setPasswordController,
                        suffixIcon:
                            obscure ? Icons.visibility_off : Icons.visibility,
                        suffixColor: obscure ? Colors.grey : Colors.purple,
                        obscure: obscure,
                        suffixFunction: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },


                      ),
                      SizedBox(
                        height: size.height / 70,
                      ),
                      Mybutton(
                          text: 'Login',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnimatedListScreen(),
                                  ));
                            }
                          },
                          width: size.width - 100,
                          height: 55),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(bottom: 20),
                        child: OutlinedButton(
                          onPressed: () {
                            MyNavigator(context, RegisterScreen());
                          },
                          child: const Text(
                            'RIGISTER',
                            style: TextStyle(color: Colors.purple, fontSize: 19),
                          ),
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(size.width - 100, 55),
                            side: BorderSide(
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
