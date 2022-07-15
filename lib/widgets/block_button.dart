import 'package:flutter/material.dart';

class BlockButton extends StatelessWidget {
  final String child;
  final Function()? onPressed;

  final buttonStyle = ElevatedButton.styleFrom(
    primary: Color(0xFF291F51),
    side: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),

    textStyle: const TextStyle(
      fontSize: 18,
      //fontWeight: FontWeight.bold,
    ),
    padding: const EdgeInsets.all(18), //padding interno do botão
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  BlockButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width, //largura dinamica
      height: 70,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(child),
      ),
    );
  }
}
