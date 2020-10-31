import 'package:anakonProject/bloc/collapsing_headers/collapsing_headers_bloc.dart';
import 'package:anakonProject/constants/text.dart';
import 'package:anakonProject/fonts_icons/anakon_greek_icons.dart';
class CollapsingTypeToStateMapper{
  static const typeToStateMap={
    CollapsingTitle.CONS_1: MapEntry(AnakonGreek.e , MapEntry(AppText.ABOUT_US_1, AppText.ABOUT_US_1_CONTENT)),
    CollapsingTitle.CONS_2: MapEntry(AnakonGreek.i, MapEntry(AppText.ABOUT_US_2, AppText.ABOUT_US_2_CONTENT)),
    CollapsingTitle.CONS_3: MapEntry(AnakonGreek.a, MapEntry(AppText.ABOUT_US_3, AppText.ABOUT_US_3_CONTENT)),
    CollapsingTitle.CONS_4: MapEntry(AnakonGreek.u, MapEntry(AppText.ABOUT_US_4, AppText.ABOUT_US_4_CONTENT)),
    CollapsingTitle.HOW_WORK_1: MapEntry(AnakonGreek.e, MapEntry("ЛИЧНЫЙ ИНЖЕНЕР ", "     На каждый объект назначается личный инженер, который возьмет на себя  решение всех вопросов в процессе эксплуатации - ведет учет всех выполняемых работ и необходимую документацию, является представителем в государственных органах и несет личную ответственность за стабильную работу объекта. ")),
    CollapsingTitle.HOW_WORK_2: MapEntry(AnakonGreek.e_low, MapEntry("ОНЛАЙН ПОДДЕРЖКА", "     Внедряемся в существующие системы контроля здания. Поддержка онлайн, прием заявок через мессенджеры. Оперативно реагируем на срочные вызовы. Круглосуточная аварийная служба. Отчеты о выполненных работах.")),
    CollapsingTitle.HOW_WORK_3: MapEntry(AnakonGreek.o, MapEntry("АУТСТАФФИНГ", "     Аутстаффинг (outstaffing) - юридический перевод сотрудников из штата компании-заказчика в штат нашей компании с передачей статуса работодателя (нанимателя). Такая услуга необходима для модернизации, улучшения бизнес-развития Вашей организации. Мы официально оформляем трудовые отношения с сотрудниками, выводимыми за штат, не меняя их рабочего места, обязанностей, распорядка дня.")),
};
  static const consTypes = [
    CollapsingTitle.CONS_1,
    CollapsingTitle.CONS_2,
    CollapsingTitle.CONS_3,
    CollapsingTitle.CONS_4
  ];
}
