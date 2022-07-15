import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solarsystem/pages/login_page.dart';
import 'package:solarsystem/pages/register_page.dart';
import 'package:solarsystem/widgets/block_button.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background/bg-2.png', 
            ),
            fit: BoxFit.cover,
          ),
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: const [
          //     Color.fromARGB(255, 109, 96, 158),
          //     Color.fromARGB(255, 77, 64, 122),
          //     Color.fromARGB(255, 48, 39, 83),
          //     Color.fromARGB(255, 37, 27, 77),
          //   ],
          //   stops: const [0.1, 0.4, 0.7, 0.9],
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: AnimatedImage(),
              ),
SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Image.asset('assets/background/planeta.png', width: 100, height: 100,),
              ),


              SizedBox(height: 0),
              ListTile(
                title: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Text(
                    '',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    "Let's explore the galaxy ? ",
                   style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    primary: Color.fromARGB(255, 255, 255, 255),
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
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    ' Sign into an account',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ),
              ),
              SizedBox(height: 10),
              BlockButton(
                child: 'Create an account',
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
          ),
        ),
      ),
      //Text('astronauta')
    );
  }
}

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this,
  duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(begin: Offset.zero, end: Offset(0, 0.08),).animate(_controller);

  

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset('assets/background/astronauta.png', width: 300, height: 300,),
    );
    
  }
}
