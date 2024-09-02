import 'package:flutter/material.dart';

extension ASSET on String {
  String toPNG() {
    return "assets/images/png/$this.png";
  }

  String toSVG() {
    return "assets/images/svg/$this.svg";
  }

  String toJPG() {
    return "assets/images/jpg/$this.tojpg";
  }
}

extension SPACER on num {
  SizedBox get vSpace {
    return SizedBox(
      height: toDouble(),
    );
  }

  SizedBox get hSpace {
    return SizedBox(
      width: toDouble(),
    );
  }
}

// extension StringExtensions on String {
//   String capitalize() {
//     return "${this[0].toUpperCase()}${this.substring(1)}";
//   }
// }

