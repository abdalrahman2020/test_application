import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisibilityWrap extends StatelessWidget {
  VisibilityWrap({
    super.key,
    required bool isShow,
    required this.currentEmotion,
  }) : _isShow = isShow;

  final bool _isShow;
  final int currentEmotion;
  final Map<int, List<String>> emotionLists = {
    0: [
      'Возбуждение',
      'Восторг',
      " Игривость",
      "Наслаждение",
      "Очарование",
      "Осознанность",
      "Смелость",
      "Удовольствие",
      "Чувственность",
      "Энергичность",
      "Экстравагантность",
    ],
    1: [
      'Тревога',
      'Опасение',
      'Небезопасность',
      'Фобия',
      'Страх темноты',
      'Паника',
      'Тревожность',
      'Сомнение',
      'Испуг',
      'Нервозность',
    ],
    2: [
      'Ярость',
      'Гнев',
      'Раздражение',
      'Злость',
      'Восстание',
      'Взрыв',
      'Волнение',
      'Напряжение',
      'Огненная вспышка',
      'Агрессия',
    ],
    3: [
      'Скорбь',
      'Депрессия',
      'Печаль',
      'Одиночество',
      'Потеря',
      'Тоска',
      'Скука',
      'Тревога',
      'Печаль',
      'Меланхолия',
    ],
    4: [
      'Расслабление',
      'Успокоение',
      'Стабильность',
      'Покой',
      'Тишина',
      'Комфорт',
      'Безмятежность',
      'Гармония',
      'Релакс',
      'Мир',
    ],
    5: [
      'Мощь',
      'Энергия',
      'Власть',
      'Выносливость',
      'Твердая решимость',
      'Поддержка',
      'Смелость',
      'Уверенность',
      'Могущество',
      'Стойкость',
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<String> listEmotions = emotionLists[currentEmotion] ?? [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Visibility(
          visible: _isShow,
          child: Wrap(
            spacing: 8.0,
            children: listEmotions.map((text) => _WrapContainer(text: text)).toList(),
          )),
    );
  }
}

class _WrapContainer extends StatelessWidget {
  const _WrapContainer({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(182, 161, 192, 0.11),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Chip(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.white),
        label: Text(
          text,
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color.fromRGBO(76, 76, 105, 1),
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        labelPadding: const EdgeInsets.only(right: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}