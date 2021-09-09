import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double defaultMargin = 24;

Color mainColor = Colors.blue;
Color textColor = Colors.black;
Color accentColor = Colors.blueAccent;

TextStyle blackTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle blueTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.blue, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.poppins()
    .copyWith(color: Colors.blueGrey, fontWeight: FontWeight.w500);

TextStyle blackNumberFont = GoogleFonts.poppins().copyWith(color: Colors.black);
TextStyle whiteNumberFont = GoogleFonts.poppins().copyWith(color: Colors.white);
