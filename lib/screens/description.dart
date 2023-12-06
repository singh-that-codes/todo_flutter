import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Description extends StatelessWidget {
  const Description({super.key, required this.title, required this.description});

  final String title,description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Description',
          style: GoogleFonts.roboto(color: Color(0xffF0ECE5)),
          ),
        backgroundColor: Color(0xff161A30),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        //color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Text(
              title,
              style: GoogleFonts.roboto(fontSize: 24,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10),
            Container(child: Text(
              description,
              style: GoogleFonts.roboto(fontSize: 18,color: Color(0xffF0ECE5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}