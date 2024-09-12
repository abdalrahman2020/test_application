import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(69),
          ),
          backgroundColor: const Color.fromRGBO(255, 135, 2, 1),
        ),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
              child: Text('Сохранить',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.5,
                    color: Colors.white,
                  ))),
        ),
      ),
    );
  }
}
