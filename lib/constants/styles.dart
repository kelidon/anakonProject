import 'dart:ui';

import 'package:anakonProject/constants/colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle DRAWER_TITLE = TextStyle(
      fontSize: 28,
      color: Color(0xFF020E31),
      fontWeight: FontWeight.bold,
      height: 1.3);
  static const TextStyle DRAWER_BUTTON =
      TextStyle(fontSize: 18, height: 1.3, color: Color(0xFF06285A));

  static const TextStyle CONTACTS_APPBAR =
      TextStyle(color: Color(0xFF06285A), fontWeight: FontWeight.w600);

  static const TextStyle TITLE = TextStyle(
      color: Color(0xFF06285A), fontSize: 22, fontWeight: FontWeight.w600);

  static const TextStyle CONTACT_BUTTON =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600);

  static const TextStyle CONTACT_TEXT = TextStyle(
      color: Color(0xFF06285A), fontSize: 22, fontWeight: FontWeight.w600);

  static const TextStyle REGULAR_SERVICES = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.PRIMARY);

  static const TextStyle REGULAR_SERVICES_MOBILE = TextStyle(

      fontSize: 14,



      fontWeight: FontWeight.w600, color: AppColors.PRIMARY);

  static const TextStyle REGULAR = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.PRIMARY);

  static const TextStyle REGULAR_CENTER = TextStyle(

      //color: Color(0xFF06285A),
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFF06285A));
}
