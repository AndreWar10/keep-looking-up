import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solarsystem/pages/home_page.dart';
import 'package:solarsystem/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _checkvalue = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            reverse: true,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  Icon(
                    Icons.star,
                    size: 100,
                  ),
                  SizedBox(height: 55),

                  //Hello
                  Text(
                    'Hello Again!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                    ),
                  ),
                  SizedBox(height: 10),
                  //Welcome Back
                  Text(
                    "Welcome back, you've been missed!",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //Email TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 4),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Email'),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //Password TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 4),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              //esconder/mostrar senha
                              child: Icon(_showPassword == false
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onTap: () {
                                setState(() {
                                  _showPassword =
                                      !_showPassword; //inverte o valor no clique
                                });
                              },
                            ),
                          ),
                          obscureText: _showPassword == false
                              ? true
                              : false, //esconder/mostrar password
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Checkbox(
                            value: _checkvalue,
                            onChanged: (value) {
                              setState(() {
                                _checkvalue = value!;
                              });
                            }),
                        Text('Remember me'),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //Sign In btn
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SizedBox(
                      height: 75,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          primary: Colors.deepPurple,
                          onPrimary: Colors.black,
                          minimumSize: Size(
                            double.infinity,
                            50,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          ' Login',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  Text('Or '),

                  SizedBox(
                    height: 25,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SizedBox(
                      height: 75,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          minimumSize: Size(
                            double.infinity,
                            50,
                          ),
                        ),
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.deepPurple,
                        ),
                        label: Text(' Sign Up with Google'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  //Not a Member?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        child: Text('Register Now',
                            style: TextStyle(fontSize: 14)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
