import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/bloc/collapsing_headers/animated_type_to_state_mapper.dart';
import 'package:flutter/cupertino.dart';

class ImageUtils {
  static buildHeroImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Image( image: AssetImage(image), fit: BoxFit.cover),
    );
  }

  static final heroImagesMap = Map.fromEntries(AnimatedTitle.values.map((e) =>
      MapEntry(
          e, buildHeroImage(AnimatedTypeToStateMapper.typeToStateMap[e].key))));
  static final heroImagesMobileMap = Map.fromEntries(AnimatedTitle.values.map(
          (e) => MapEntry(
          e,
          Image(
              image: AssetImage(AnimatedTypeToStateMapper.typeToStateMap[e].key),
              fit: BoxFit.cover))));

  static final towerLogo = Image.asset(
    "images/logo_on_tower.png",
    fit: BoxFit.fitWidth,
  );

  static final mobileGif = AssetImage("video/tower_horizontal.gif");
}
