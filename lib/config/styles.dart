import 'package:epilepsy/config/config.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static const appBarTitle = TextStyle(
    fontFamily: 'SF-UI-Display',
    color: Palette.darkBlue,
    fontSize: 30.0,
  );

  static const cardData = TextStyle(
    fontFamily: 'SF-UI-Display',
    fontWeight: FontWeight.w300,
    color: Palette.grey,
    fontSize: 12.0,
  );

  static const drugSubTitle = TextStyle(
    fontFamily: 'SF-UI-Display',
    fontWeight: FontWeight.bold,
    color: Palette.drugSubtitle,
    fontSize: 12.0,
  );

  static const trainerCardTitle = TextStyle(
    fontFamily: 'SF-UI-Display',
    color: Palette.darkBlue,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  static const accordionTitle = TextStyle(
    fontFamily: 'SF-UI-Display',
    color: Palette.darkBlue,
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );

  static const accordionText = TextStyle(
    fontFamily: 'SF-UI-Display',
    color: Palette.darkBlue,
    fontWeight: FontWeight.w400,
    height: 1.8,
    fontSize: 14.0,
  );

  static const trainerCardText = TextStyle(
    fontFamily: 'SF-UI-Display',
    fontSize: 14.0,
    color: Palette.trainerCardText,
  );

  static const drugText = TextStyle(
    fontFamily: 'SF-UI-Display',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Palette.trainerCardText,
  );

  static const drugCalendar = TextStyle(
    fontFamily: 'SF-UI-Display',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Palette.darkBlue,
  );

  static const drugButton = TextStyle(
    fontFamily: 'SF-UI-Display',
    color: Palette.purple,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  static const drawerText = TextStyle(
    fontFamily: 'SF-UI-Display',
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: Palette.drawerText,
  );
}
