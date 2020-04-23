import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Us'),
      ),
      body: Material(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'mainLogo',
              child: SizedBox(
                height: 150,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        'This is Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'emailSignUp');
                },
                child: Card(
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'Continue with Email',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Continue with Facebook',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Register or Login as an Organization?\n',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: 'Click here',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => Navigator.pushNamed(context, 'orgLogin'),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}