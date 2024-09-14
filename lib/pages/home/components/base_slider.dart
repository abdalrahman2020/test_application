import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BaseSlider extends StatefulWidget {
  const BaseSlider({
    super.key,
    required this.firstValue,
    required this.secondValue,
    required this.title,
    required this.isEmotionSelected,
  });
  final bool isEmotionSelected;
  final String firstValue;
  final String secondValue;
  final String title;
  @override
  State<BaseSlider> createState() => _BaseSliderState();
}

class _BaseSliderState extends State<BaseSlider> {
  double currentSliderValue = 2.5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.nunito(
                textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(35, 35, 43, 1),
            )),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: SfSliderTheme(
                    data: SfSliderThemeData(
                      disabledInactiveTrackColor: widget.isEmotionSelected
                          ? const Color.fromRGBO(255, 135, 2, 1)
                          : const Color.fromRGBO(225, 221, 216, 1),
                      disabledActiveTrackColor: widget.isEmotionSelected
                          ? const Color.fromRGBO(255, 135, 2, 1)
                          : const Color.fromRGBO(225, 221, 216, 1),
                      inactiveTrackHeight: 6,
                      activeTrackHeight: 6,
                      thumbRadius: 12,
                      tickOffset: const Offset(0, -22),
                      tickSize: const Size(2, 8),
                      activeTickColor: widget.isEmotionSelected
                          ? const Color.fromRGBO(255, 135, 2, 1)
                          : const Color.fromRGBO(225, 221, 216, 1),
                    ),
                    child: SfSlider(
                      key: UniqueKey(),
                      min: 0,
                      max: 5.0,
                      stepSize: 1,
                      value: widget.isEmotionSelected ? currentSliderValue : 2.5,
                      interval: 1,
                      showTicks: true,
                      onChanged: widget.isEmotionSelected
                          ? (dynamic value) {
                              setState(() {
                                currentSliderValue = value;
                              });
                            }
                          : null,
                      thumbIcon: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: widget.isEmotionSelected
                                  ? const Color.fromRGBO(255, 135, 2, 1)
                                  : const Color.fromRGBO(225, 221, 216, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      activeColor: widget.isEmotionSelected
                          ? const Color.fromRGBO(255, 135, 2, 1)
                          : const Color.fromRGBO(225, 221, 216, 1),
                      inactiveColor: const Color.fromRGBO(225, 221, 216, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.firstValue,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(145, 158, 171, 1),
                          ),
                        ),
                      ),
                      Text(
                        widget.secondValue,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(145, 158, 171, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
