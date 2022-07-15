// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:solarsystem/controllers/login_controller.dart';
// import 'package:solarsystem/pages/loading_page.dart';

// class CustomLoginButtonComponent extends StatelessWidget {
//   final LoginController loginController;

//   const CustomLoginButtonComponent({Key? key, required this.loginController})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool>(
//       valueListenable: loginController.inLoader,
//       builder: (_, inLoader, __) => inLoader
//           ? LoadingPage()
//           : ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 primary: Colors.deepPurple,
//                 onPrimary: Colors.black,
//                 minimumSize: Size(
//                   double.infinity,
//                   50,
//                 ),
//               ),
//               onPressed: () {
//                 loginController.auth().then(
//                   (result) {
//                     //se autenticação: true
//                     if (result) {
//                       //print('sucess');
//                       Navigator.of(context).pushReplacementNamed('/home');
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: const Text('Falha ao realizar login'),
//                           duration: const Duration(seconds: 5),
//                         ),
//                       );
//                     }
//                   },
//                 );
//               },
//               child: Text(
//                 ' Login',
//                 style: GoogleFonts.montserrat(
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//     );
//   }
// }
