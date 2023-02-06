import 'package:adhicine/main.dart';
import 'package:flutter/material.dart';
import 'package:adhicine/constants.dart';
import 'package:line_icons/line_icons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset('assets/images/logo.png',scale:0.5,),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Sign In',style: TextStyle(fontSize: 46,fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail,color: kIconGreen,),
                ),
                validator: (val){
                  if(val!=null && !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(val))
                    {
                      return 'Invalid email';
                    }
                  return null;
                },
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_rounded,color: kIconGreen,),
                  suffixIcon: Icon(Icons.visibility_off_outlined,color: Colors.grey,),

                ),
                validator: (val){
                  if(val!=null && !RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
                      .hasMatch(val))
                  {
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(18)
                ),
                child: Center(child: Text('LOGIN',style: TextStyle(color: Colors.white),),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 8),child: Text('OR',style: TextStyle(color: Colors.grey),),),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const MyHomePage()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimary,
                      ),
                      borderRadius: BorderRadius.circular(18)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(LineIcons.googlePlus),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Login with Google'),
                    ),
                  ],),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//