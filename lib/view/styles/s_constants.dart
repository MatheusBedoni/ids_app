

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ColorsApp{
  static final Color backgroundColor = Color(0xFFDBE1E5);
  static final Color secondbackgroundColor = Color(0xFFB0C8F3);
}

class DecorationConstants{
  static final BoxDecoration textFieldDecoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
           color: Color(0xFFd3d3d3).withOpacity(0.5),
           blurRadius: 4.0, // has the effect of softening the shadow
           spreadRadius: 4.0, // has the effect of extending the shadow
        )
      ],
      borderRadius: BorderRadius.all(
          Radius.circular(10)
      ),
      color:  Colors.white,
  );

  static final BoxDecoration buttonDecoration =  BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color(0xFFd3d3d3).withOpacity(0.5),
        blurRadius: 4.0, // has the effect of softening the shadow
        spreadRadius: 4.0, // has the effect of extending the shadow

      )
    ],
    borderRadius: BorderRadius.all(
        Radius.circular(10)
    ),
    color:  Colors.blue,
  );


  static final BoxDecoration decorationBackground = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        ColorsApp.backgroundColor,
        ColorsApp.backgroundColor,
        ColorsApp.backgroundColor,
        ColorsApp.backgroundColor,
        ColorsApp.secondbackgroundColor
      ],
    ),
  );
}