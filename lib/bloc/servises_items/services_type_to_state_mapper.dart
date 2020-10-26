import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/bloc/servises_items/services_items_bloc.dart';
import 'package:anakonProject/fonts_icons/anakon_greek.dart';
class CollapsingTypeToStateMapper{
  static const typeToStateMap={
    ServicesFirstPage.FIRST_PAGE_1: MapEntry("title", "description"),
    };

  static const firstPageTypes = [
    ServicesFirstPage.FIRST_PAGE_1,
  ];
}
