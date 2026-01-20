import 'package:flutter/material.dart';
import 'package:kakao_clone/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 120),
            Image(image: AssetImage('assets/images/kakao_logo.jpg'), width: 100, height: 100),
            SizedBox(height: 20),
            Text('Welcome to KakaoTalk', style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            Text(
              'If you have a Kakao account,',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'log in with your email or phone number.',
              style: TextStyle(color: Colors.grey),
            ),
            // SizedBox(height: 20),
            // FilledButton(
            //   onPressed: () {},
            //   style: FilledButton.styleFrom(
            //     backgroundColor: Color(0xFFFFE812),
            //     foregroundColor: Colors.black,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Icon(Icons.chat_bubble_rounded),
            //       SizedBox(width: 10),
            //       Text('Login with KakaoTalk'),
            //     ],
            //   ),
            // ),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email or Phone Number'),
              controller: emailController,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              controller: passwordController,
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: Color.fromARGB(152, 211, 211, 211),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [Text('Log In')],
              ),
            ),
            FilledButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  shape: LinearBorder(),
                  child: Container(
                    padding: EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Kakao',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          'Terms and conditions',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset(
                          'assets/images/TermOfService.jpg',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 20),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                          text: 'Our',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Terms and Conditions ',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: 'and',
                            ),
                            TextSpan(
                              text: ' Privacy Policy ',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: 'have been updated. To continue using KakaoTalk and Sign up, please review and agree to the updated terms.'
                            )
                          ]
                        )),
                        SizedBox(height: 20),
                        Text(
                          'Email Confirmation: ${emailController.text}',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        SizedBox(height: 20),
                        FilledButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          ),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text('Confirm'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: Color.fromARGB(152, 211, 211, 211),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [Text('Sign Up')],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Find Kakao Account or Password',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
