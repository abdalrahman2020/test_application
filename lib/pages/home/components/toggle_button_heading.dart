import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleButtonHeading extends StatefulWidget {
  const ToggleButtonHeading({super.key});

  @override
  State<ToggleButtonHeading> createState() => _ToggleButtonHeadingState();
}

class _ToggleButtonHeadingState extends State<ToggleButtonHeading> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 242, 242, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                setState(() {
                  isSelected = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? const Color.fromRGBO(255, 135, 2, 1) : const Color.fromRGBO(242, 242, 242, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 17),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/diary.svg',
                      width: 20,
                      height: 20,
                      color:
                          isSelected ? const Color.fromRGBO(255, 255, 255, 1) : const Color.fromRGBO(188, 188, 191, 1),
                    ),
                    const SizedBox(width: 6),
                    Text('Дневник настроения',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: isSelected
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : const Color.fromRGBO(188, 188, 191, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                setState(() {
                  isSelected = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? const Color.fromRGBO(242, 242, 242, 1) : const Color.fromRGBO(255, 135, 2, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 17),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/chart.svg',
                      width: 20,
                      height: 20,
                      color:
                          isSelected ? const Color.fromRGBO(188, 188, 191, 1) : const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    const SizedBox(width: 6),
                    Text('Статистика',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: isSelected
                                ? const Color.fromRGBO(188, 188, 191, 1)
                                : const Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
