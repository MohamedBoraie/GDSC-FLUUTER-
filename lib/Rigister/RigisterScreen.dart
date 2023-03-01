import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gdscproject/Component/Coponent.dart';
import 'package:gdscproject/Layout/layoutScreen.dart';
import 'package:gdscproject/Login/Login_Screen.dart';

import '../animatedList/AnimatedList.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool obscure1 = true;
bool obscure2 = true;
bool dcolor1 = true;
bool dcolor2 = true;
bool dcolor3 = true;
bool dcolor4 = true;
bool dcolor5 = true;

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  var set1PasswordController = TextEditingController();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var set2PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        height: size.height / 3,
                        color: Colors.purple,
                        child: Center(
                            child: Text(
                          "REgister".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                    Positioned(
                    top: size.height/25,
                        child: IconButton(
                            onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,)))
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      MyTextFormField(
                        controller: fullNameController,
                        label: 'Full name ',
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please inter your name ';

                          }
                        },
                        prefixIcon: Icons.person_outline_outlined,
                      ),
                      MyTextFormField(
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
                          label: ('Email Address'),
                          prefixIcon: (Icons.email_outlined),
                          controller: emailController,
                          hint: ' example@gmail.com',
                          keyboardType: TextInputType.emailAddress),
                      MyTextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please inter your phone ';

                          }
                        },
                        prefixIcon: Icons.phone_outlined,
                        label: 'phone',
                        controller: phoneController,
                      ),

                      MyTextFormField(
                        label: 'Password',
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Password Is Required';

                          }
                        },


                        hint: '. . . . . . . . . . .',
                        prefixIcon: Icons.lock_outline,
                        keyboardType: TextInputType.visiblePassword,
                        controller: set1PasswordController,
                        suffixIcon:
                            obscure1 ? Icons.visibility_off : Icons.visibility,
                        suffixColor: obscure1 ? Colors.grey : Colors.purple,
                        obscure: obscure1,
                        suffixFunction: () {
                          setState(() {
                            obscure1 = !obscure1;
                          });
                        },
                      ),
                      MyTextFormField(
                        label: 'Confirm Password ',
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please inter your password again';

                          }
                        else if(set1PasswordController.text!=set2PasswordController.text){

                          return  'Different Password' ;
                          }
                        },

                        hint: '. . . . . . . . . . .',
                        prefixIcon: Icons.lock_outline,
                        keyboardType: TextInputType.visiblePassword,
                        controller: set2PasswordController,
                        suffixIcon:
                            obscure2 ? Icons.visibility_off : Icons.visibility,
                        suffixColor: obscure2 ? Colors.grey : Colors.purple,
                        obscure: obscure2,
                        suffixFunction: () {
                          setState(() {
                            obscure2 = !obscure2;
                          });
                        },
                      ),
                      SizedBox(
                        height: size.height / 55,
                      ),
                      Mybutton(onPressed: () {
                        if(formKey.currentState!.validate()){

                            MyNavigator(context, AnimatedListScreen());


                        }
                      }, text: 'register', height: 55),
                    const  SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 20),
                        child: OutlinedButton(
                          onPressed: () {
                        Navigator.pop(context);
                          },
                           child: const Text (
                            'login',
                            style:
                             TextStyle (  color: Colors.purple, fontSize: 19),
                          ),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 55),
                            side:const BorderSide(
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
