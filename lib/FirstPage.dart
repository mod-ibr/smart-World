import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatefulWidget {
  final double height;
  final double width;

  FirstPage(this.height, this.width);

  @override
  _CenterPageState createState() => _CenterPageState();
}

class _CenterPageState extends State<FirstPage> {
  double containerTop = 0.0;
  double opacityHead = 0.0;
  double opacitySub = 0.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        containerTop = widget.height;
      });
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        opacityHead = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1800), () {
      setState(() {
        opacitySub = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            right: 80.0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: widget.height,
              width: widget.width * 0.6,
              //color: Colors.blue,
              child: Image.asset(
                'assets/images/02_AI.png',
                fit: BoxFit.cover,
                alignment: Alignment(0.0, 0.0),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: containerTop,
            right: 78.0,
            child: AnimatedContainer(
              curve: Curves.ease,
              duration: Duration(milliseconds: 600),
              height: widget.height,
              width: widget.width * 0.62,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: widget.height * 0.240,
            left: 160.0,
            child: Container(
              height: widget.height,
              width: widget.width * 0.53,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 500),
                    opacity: opacityHead,
                    child: Text(
                      'Make Your world smarter With the power of AI !',
                      style: GoogleFonts.ubuntu(
                          fontSize: 100.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.amber[900]),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  AnimatedOpacity(
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 500),
                    opacity: opacitySub,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Drive Safely with smart Car Copilot ',
                          style: GoogleFonts.raleway(
                              fontSize: 25.0, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'Smart Home and controllable world',
                          style: GoogleFonts.raleway(
                              fontSize: 25.0, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'Easy World',
                          style: GoogleFonts.raleway(
                              fontSize: 25.0, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
