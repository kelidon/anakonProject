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
      TextStyle(color: AppColors.PRIMARY, fontSize: 20, fontWeight: FontWeight.w600);

  static const TextStyle CONTACT_TEXT = TextStyle(
      color: Color(0xFF06285A), fontSize: 22, fontWeight: FontWeight.w600);

  static const TextStyle REGULAR_SERVICES = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.PRIMARY);

  static const TextStyle REGULAR_SERVICES_MOBILE = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.PRIMARY);

  static const TextStyle REGULAR = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.PRIMARY);

  static const TextStyle REGULAR_CENTER = TextStyle(
      //color: Color(0xFF06285A),
      fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF06285A));

//mobile

  static const TextStyle DRAWER_TITLE_M =
  TextStyle(fontSize: 20, color: Color(0xFF020E31), fontWeight: FontWeight.bold, height: 1.3);

  static const TextStyle DRAWER_BUTTON_M =
  TextStyle(fontSize: 10, height: 1.3, color: Color(0xFF06285A));

  static const TextStyle CONTACTS_APPBAR_M =
  TextStyle(color: Color(0xFF06285A), fontWeight: FontWeight.w600);

  static const TextStyle TITLE_M =
  TextStyle(color: Color(0xFF06285A), fontSize: 14, fontWeight: FontWeight.w600);

  static const TextStyle CONTACT_BUTTON_M =
  TextStyle(color: AppColors.PRIMARY, fontSize: 12, fontWeight: FontWeight.w600);

  static const TextStyle CONTACT_TEXT_M =
  TextStyle(color: Color(0xFF06285A), fontSize: 14, fontWeight: FontWeight.w600);

  static const TextStyle REGULAR_SERVICES_M =
  TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.PRIMARY);

  static const TextStyle REGULAR_SERVICES_MOBILE_M =
  TextStyle(fontSize: 6, fontWeight: FontWeight.w600, color: AppColors.PRIMARY);

  static const TextStyle REGULAR_M =
  TextStyle(fontSize: 8, fontWeight: FontWeight.w600, color: AppColors.PRIMARY);

  static const TextStyle REGULAR_CENTER_M =
    //color: Color(0xFF06285A),
  TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF06285A));
}