import 'package:anakonProject/bloc/collapsing_headers/animated_pictures_bloc.dart';
import 'package:anakonProject/constants/text.dart';

class AnimatedTypeToStateMapper {
  static const typeToStateMap = {
    AnimatedTitle.CONS_1: MapEntry("assets/images/experience.jpg",
        MapEntry(AppText.ABOUT_US_1, AppText.ABOUT_US_1_CONTENT)),
    AnimatedTitle.CONS_2: MapEntry("assets/images/unique.jpg",
        MapEntry(AppText.ABOUT_US_2, AppText.ABOUT_US_2_CONTENT)),
    AnimatedTitle.CONS_3: MapEntry("assets/images/effective.jpg",
        MapEntry(AppText.ABOUT_US_3, AppText.ABOUT_US_3_CONTENT)),
    AnimatedTitle.CONS_4: MapEntry("assets/images/individuality.jpg",
        MapEntry(AppText.ABOUT_US_4, AppText.ABOUT_US_4_CONTENT)),
    AnimatedTitle.HOW_WORK_1: MapEntry(
        "assets/images/personal_engineer.jpg",
        MapEntry("ЛИЧНЫЙ ИНЖЕНЕР ",
            "     На каждый объект назначается личный инженер, который возьмет на себя  решение всех вопросов в процессе эксплуатации - ведет учет всех выполняемых работ и необходимую документацию, является представителем в государственных органах и несет личную ответственность за стабильную работу объекта. ")),
    AnimatedTitle.HOW_WORK_2: MapEntry(
        "assets/images/online_support.jpg",
        MapEntry("ОНЛАЙН ПОДДЕРЖКА",
            "     Внедряемся в существующие системы контроля здания. Поддержка онлайн, прием заявок через мессенджеры. Оперативно реагируем на срочные вызовы. Круглосуточная аварийная служба. Отчеты о выполненных работах.")),
    AnimatedTitle.HOW_WORK_3: MapEntry(
        "assets/images/outstaffing.jpg",
        MapEntry("АУТСТАФФИНГ",
            "     Аутстаффинг (outstaffing) - юридический перевод сотрудников из штата компании-заказчика в штат нашей компании с передачей статуса работодателя (нанимателя). Такая услуга необходима для модернизации, улучшения бизнес-развития Вашей организации. Мы официально оформляем трудовые отношения с сотрудниками, выводимыми за штат, не меняя их рабочего места, обязанностей, распорядка дня.")),
  };
  static const consTypes = [
    AnimatedTitle.CONS_1,
    AnimatedTitle.CONS_2,
    AnimatedTitle.CONS_3,
    AnimatedTitle.CONS_4
  ];
}
