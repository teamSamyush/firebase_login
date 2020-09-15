import 'package:firebase_login/loading.dart';
import 'package:firebase_login/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  bool loading = false;
  bool loadingGoogle = false;
  bool loadingFacebook = false;
  bool loadingPhone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/background.jpeg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  elevation: 0,
                  height: 55,
                  minWidth: 240,
                  color: Colors.white,
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInAnon();
                    if(result==null) {
                      print('Unsucessful');
                      setState(() {
                        loading = false;
                      });
                    } else {
                      print('Successful');
                      print(result.uid);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Container(
                    width: 255,
                    child: Center(
                      child: loading ? Loading() : Text(
                        'Sign In Anonymously',
                        style: GoogleFonts.rubik(
                            textStyle:
                            TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    ),
                  ),
                ), //Anonymous Sign In
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  elevation: 0,
                  height: 55,
                  minWidth: 240,
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      loadingGoogle = true;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Container(
                    width: 255,
                    child: loadingGoogle ? Loading() : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            'assets/google-icon.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Sign In with Google',
                          style: GoogleFonts.rubik(
                              textStyle:
                              TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                ), //Google Sign In
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  elevation: 0,
                  height: 55,
                  minWidth: 240,
                  color: Color(0xff3C5998),
                  onPressed: () {
                    setState(() {
                      loadingFacebook = true;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Container(
                    width: 255,
                    child: loadingFacebook ? Loading() : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            'assets/facebook-icon.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Sign In with Facebook',
                          style: GoogleFonts.rubik(
                              textStyle:
                              TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                ), //facebook Sign In
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  elevation: 0,
                  height: 55,
                  minWidth: 240,
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      loadingPhone = true;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Container(
                    width: 255,
                    child: loadingPhone ? Loading() : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 30,
                          child: SvgPicture.asset(
                            'assets/phone-icon.svg',
                            fit: BoxFit.contain,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Sign In with Phone Number',
                          style: GoogleFonts.rubik(
                              textStyle:
                              TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                ), //Phone Sign In
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
              'Firebase Sign In',
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  textStyle:
                  TextStyle(color: Colors.black, fontSize: 35,)),
            ),
          )
        ],
      ),
    );
  }
}

