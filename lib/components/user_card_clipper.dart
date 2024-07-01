import 'package:flutter/material.dart';

class UserCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //If i add the moveTo then i would have to use the commented quadraticBezierTo
    // down the class else it does the curvey edge on it's own
    //path.moveTo(0, size.height * .1);
    path.lineTo(0, size.height * .5);
    var firstP1 = Offset(0, size.height * .65);
    var endP1 = Offset(size.width * .07, size.height / 1.5);
    path.quadraticBezierTo(firstP1.dx, firstP1.dy, endP1.dx, endP1.dy);

    var firstP2 = Offset(size.width * .2, size.height * .65);
    var endP2 = Offset(size.width * .2, size.height * 0.9);
    path.quadraticBezierTo(firstP2.dx, firstP2.dy, endP2.dx, endP2.dy);

    var firstP3 = Offset(size.width * .2, size.height);
    var endP3 = Offset(size.width * .3, size.height);
    path.quadraticBezierTo(firstP3.dx, firstP3.dy, endP3.dx, endP3.dy);

    path.lineTo(size.width / .9, size.height);
    var firstP4 = Offset(size.width, size.height);
    var endP4 = Offset(size.width, size.height * .9);
    path.quadraticBezierTo(firstP4.dx, firstP4.dy, endP4.dx, endP4.dy);

    path.lineTo(size.width, size.height * .1);
    var firstP5 = Offset(size.width, 0);
    var endP5 = Offset(size.width - size.height / 8, 0);
    path.quadraticBezierTo(firstP5.dx, firstP5.dy, endP5.dx, endP5.dy);

    path.lineTo(size.width * .05, 0);

    //this is the commented quadraticBezierTo i ment only to use if i did used
    //the moveTo but i did noticed it sooo yeah that it <3
    // var firstP6 = Offset(0, 0);
    // var endP6 = Offset(0, size.height / 8);
    // path.quadraticBezierTo(firstP6.dx, firstP6.dy, endP6.dx, endP6.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

/*
class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from the top left corner
    path.moveTo(0, 0);

    // Top edge
    path.lineTo(size.width, 0);

    // Top right corner to the bottom right corner
    path.lineTo(size.width, size.height);

    // Bottom right corner to the bottom left corner (keep curved)
    var firstP4 = Offset(size.width, size.height);
    var endP4 = Offset(size.width / 1.1, size.height);
    path.quadraticBezierTo(firstP4.dx, firstP4.dy, endP4.dx, endP4.dy);

    path.lineTo(size.width * 0.3, size.height);

    var firstP3 = Offset(size.width * 0.2, size.height);
    var endP3 = Offset(size.width * 0.2, size.height / 1.1);
    path.quadraticBezierTo(firstP3.dx, firstP3.dy, endP3.dx, endP3.dy);

    var firstP2 = Offset(size.width * 0.2, size.height / 1.5);
    var endP2 = Offset(size.width * 0.07, size.height / 1.5);
    path.quadraticBezierTo(firstP2.dx, firstP2.dy, endP2.dx, endP2.dy);

    // Center left curve (bottom left to top left)

    var firstP1 = Offset(0, size.height / 1.5);
    var endP1 = Offset(size.width * 0.07, size.height / 1.5);
    path.quadraticBezierTo(firstP1.dx, firstP1.dy, endP1.dx, endP1.dy);

    var firstP0 = Offset(0, size.height / 1.5);
    var endP0 = Offset(0, size.height / 2);
    path.quadraticBezierTo(firstP0.dx, firstP0.dy, endP0.dx, endP0.dy);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
*/