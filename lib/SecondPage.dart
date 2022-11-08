import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List images = [
  'assets/images/1smartHome.jpg',
  'assets/images/2smartHome.jpg',
  'assets/images/3smartHome.jpg',
  'assets/images/smartCar.jpg',
  'assets/images/2smartCar.jpg',
];

class SecondPage extends StatefulWidget {
  final double height;
  final double width;

  SecondPage(this.height, this.width);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  static double titleOpacity = 0.0;
  double containerTop1 = 0.0;
  double sectionOpacity2 = 0.0;
  double sectionTop2 = 0.0;
  double sectionOpacity3 = 0.0;
  double sectionBottom3 = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1600), () {
      setState(() {
        titleOpacity = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 1800), () {
      setState(() {
        containerTop1 = widget.height;
      });
    });
    Future.delayed(Duration(milliseconds: 2200), () {
      setState(() {
        sectionTop2 = widget.height;
      });
    });
    Future.delayed(Duration(milliseconds: 2600), () {
      setState(() {
        sectionOpacity2 = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 3000), () {
      setState(() {
        sectionOpacity3 = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 3400), () {
      setState(() {
        sectionBottom3 = widget.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 160.0, right: 80.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: widget.height,
            width: widget.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  opacity: titleOpacity,
                  text: 'About',
                  fontWeight: FontWeight.w600,
                  fontsize: 55.0,
                ),
                SizedBox(height: 25.0),
                CustomImage(
                  widget: widget,
                  image: images[2],
                  heightFrac: 0.7,
                  widthFrac: 0.35,
                  animatedPositionedValue: containerTop1,
                  topOrBottom: 'top',
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40.0),
            height: widget.height,
            width: widget.width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(
                  widget: widget,
                  heightFrac: 0.65,
                  widthFrac: 0.25,
                  image: images[3],
                  animatedPositionedValue: sectionTop2,
                  topOrBottom: 'bottom',
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomText(
                  opacity: sectionOpacity2,
                  text:
                      'control your own car with smart features of self-driving, safe, and security, and tracking all resources',
                  height: 1.8,
                  fontsize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            height: widget.height,
            width: widget.width * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  opacity: sectionOpacity3,
                  text:
                      'Remotely Controllable House, Handle your own home and make it smart enough',
                  height: 1.8,
                  fontsize: 25.0,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomImage(
                  widget: widget,
                  image: images[1],
                  heightFrac: 0.35,
                  widthFrac: 0.15,
                  animatedPositionedValue: sectionBottom3,
                  topOrBottom: 'top',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    required this.opacity,
    required this.fontWeight,
    required this.fontsize,
    required this.text,
    this.height = 0,
  });

  final double opacity;
  final String text;
  final FontWeight fontWeight;
  final double fontsize;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 500),
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
          height: height,
          fontSize: fontsize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    required this.widget,
    required this.topOrBottom,
    required this.image,
    required this.heightFrac,
    required this.widthFrac,
    required this.animatedPositionedValue,
  });

  final SecondPage widget;
  final String topOrBottom;
  final String image;
  final double heightFrac;
  final double widthFrac;
  final double animatedPositionedValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 2.0, left: 2.0, right: 2.0, bottom: 2.0),
          height: widget.height * heightFrac,
          width: widget.width * widthFrac,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 600),
          bottom: (topOrBottom == 'bottom') ? animatedPositionedValue : null,
          top: (topOrBottom == 'top') ? animatedPositionedValue : null,
          child: Container(
            height: widget.height * heightFrac,
            width: widget.width * widthFrac,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
