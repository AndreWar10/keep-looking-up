import 'package:firebase_auth/firebase_auth.dart';
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

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _senhaTextController = TextEditingController();

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

                Image.asset(
                  'assets/astronauta/cadastro.png',
                  width: 150,
                  height: 150,
                ),

                //Hello
                Text(
                  'Sign Up',
                  style: GoogleFonts.montserrat(
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                //Welcome Back
                Text(
                  "Welcome, let's make your registration ",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 45,
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
                        controller: _emailTextController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),

                // SizedBox(
                //   height: 10,
                // ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.grey[200],
                //         border: Border.all(
                //           color: Colors.white,
                //         ),
                //         borderRadius: BorderRadius.circular(12)),
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 20.0, top: 4),
                //       child: TextField(
                //         decoration: InputDecoration(
                //             border: InputBorder.none, hintText: 'Full name'),
                //       ),
                //     ),
                //   ),
                // ),

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
                        controller: _senhaTextController,
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
                      Text(
                        'By signing up, you are agree to our',
                        style: GoogleFonts.montserrat(
                          fontSize: 11,
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              'Terms & Conditions',
                              style: GoogleFonts.montserrat(
                                fontSize: 11,
                              ),
                            ),
                          ),
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
                      onPressed: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _senhaTextController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        }).onError((error, stackTrace) {
                          print('Error ${error.toString()}');
                        });
                      },
                      child: Text(
                        ' Continue',
                        style: GoogleFonts.montserrat(
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
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
        ),
      ),
    );
  }
}
