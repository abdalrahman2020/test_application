import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.isEmotionSelected, required this.isNotesTextFieldNotEmpty});

  final bool isEmotionSelected;
  final bool isNotesTextFieldNotEmpty;
  @override
  Widget build(BuildContext context) {
    bool isTrue = false;
    isEmotionSelected && !isNotesTextFieldNotEmpty ? isTrue = true : isTrue = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(69),
          ),
          backgroundColor: const Color.fromRGBO(255, 135, 2, 1),
          disabledBackgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        ),
        onPressed: isTrue ? () {} : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
              child: Text('Сохранить',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.5,
                      color: isTrue ? Colors.white : const Color.fromRGBO(188, 188, 191, 1)))),
        ),
      ),
    );
  }
}
