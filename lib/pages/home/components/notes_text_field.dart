import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesTextField extends StatelessWidget {
  const NotesTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Заметки',
            style: GoogleFonts.nunito(
                textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(35, 35, 43, 1),
            )),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(182, 161, 192, 0.11),
                  offset: Offset(2, 4),
                  blurRadius: 10.8,
                ),
              ],
            ),
            child: TextField(
              cursorColor: Colors.black,
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(76, 76, 105, 1),
              )),
              minLines: 4,
              maxLines: 10,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                hintText: 'Введите заметку',
                hintStyle: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(188, 188, 191, 1),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
