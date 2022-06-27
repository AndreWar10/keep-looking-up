import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solarsystem/pages/login_page.dart';
import 'package:solarsystem/pages/terms_and_conditions_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  bool _checkvalue = false;

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
                  SizedBox(height: 70),
                  Icon(
                    Icons.app_registration_outlined,
                    size: 100,
                  ),
                  SizedBox(height: 25),

                  //Hello
                  Text(
                    'Sign Up',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                    ),
                  ),
                  SizedBox(height: 10),
                  //Welcome Back
                  Text(
                    "Welcome, tell me who are you!",
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 55,
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
                              border: InputBorder.none, hintText: 'Full name'),
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

                  //Password TextField
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
                            hintText: 'Confirm Password',
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

                  SizedBox(
                    height: 10,
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
                        Text('By signing up, you are agree to our',
                            style: TextStyle(fontSize: 13)),
                        Expanded(
                          child: TextButton(
                            child: Text('Terms & Conditions',
                                style: TextStyle(fontSize: 12)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TermsPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 30,
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
                        onPressed: () {},
                        child: Text(
                          ' Continue',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Joined us before?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        child: Text('Sign In', style: TextStyle(fontSize: 14)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
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
