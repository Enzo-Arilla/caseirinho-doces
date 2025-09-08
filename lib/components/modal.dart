import 'package:flutter/material.dart';

class Modal extends StatelessWidget {

  final String title;
  final List<Widget> widgets;

  const Modal({Key? key, required this.title, required this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Color(0xFFFFF7F7),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(height: 200, child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Título
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown[700],
              ),
              textAlign: TextAlign.center,
            ),
            ...widgets
          ],
        )
      ),
    ));
  }
}
