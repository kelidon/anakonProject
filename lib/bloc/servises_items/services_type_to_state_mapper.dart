
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/constants/text_mobile.dart';
import 'package:anakonProject/fonts_icons/anakon_greek_icons.dart';
class ServicesTypeToStateMapper{
  static const typeToStateMap={
    ServicesPageType.FIRST_PAGE_1: MapEntry(AppText.SERVICE1_1_TITLE, AppText.SERVICE1_1),
    ServicesPageType.FIRST_PAGE_2: MapEntry(AppText.SERVICE1_2_TITLE, AppText.SERVICE1_2),
    ServicesPageType.FIRST_PAGE_3: MapEntry(AppText.SERVICE1_3_TITLE, AppText.SERVICE1_3),
    ServicesPageType.FIRST_PAGE_4: MapEntry(AppText.SERVICE1_4_TITLE, AppText.SERVICE1_4),
    ServicesPageType.SECOND_PAGE_1: MapEntry(AppText.SERVICE2_1_TITLE, AppText.SERVICE2_1),
    ServicesPageType.SECOND_PAGE_2: MapEntry(AppText.SERVICE2_2_TITLE, AppText.SERVICE2_2),
    ServicesPageType.SECOND_PAGE_3: MapEntry(AppText.SERVICE2_3_TITLE, AppText.SERVICE2_3),
    ServicesPageType.SECOND_PAGE_4: MapEntry(AppText.SERVICE2_4_TITLE, AppText.SERVICE2_4),
    };
  static const typeToStateMapMobile={
    ServicesPageType.FIRST_PAGE_1: MapEntry(AppTextMobile.SERVICE1_1_TITLE, AppText.SERVICE1_1),
    ServicesPageType.FIRST_PAGE_2: MapEntry(AppTextMobile.SERVICE1_2_TITLE, AppText.SERVICE1_2),
    ServicesPageType.FIRST_PAGE_3: MapEntry(AppTextMobile.SERVICE1_3_TITLE, AppText.SERVICE1_3),
    ServicesPageType.FIRST_PAGE_4: MapEntry(AppTextMobile.SERVICE1_4_TITLE, AppText.SERVICE1_4),
    ServicesPageType.SECOND_PAGE_1: MapEntry(AppTextMobile.SERVICE2_1_TITLE, AppText.SERVICE2_1),
    ServicesPageType.SECOND_PAGE_2: MapEntry(AppTextMobile.SERVICE2_2_TITLE, AppText.SERVICE2_2),
    ServicesPageType.SECOND_PAGE_3: MapEntry(AppTextMobile.SERVICE2_3_TITLE, AppText.SERVICE2_3),
    ServicesPageType.SECOND_PAGE_4: MapEntry(AppTextMobile.SERVICE2_4_TITLE, AppText.SERVICE2_4),
  };
}
