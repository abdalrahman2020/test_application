import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_application/pages/home/components/components.dart';

class RowEmotionList extends StatefulWidget {
  const RowEmotionList({super.key});

  @override
  _RowEmotionListState createState() => _RowEmotionListState();
}

class _RowEmotionListState extends State<RowEmotionList> {
  int _selectedIndex = -1;
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 20),
              _buildEmotionContainer(0, 'Радость', 'assets/images/happiness.png'),
              const SizedBox(width: 12),
              _buildEmotionContainer(1, 'Страх', 'assets/images/fear.png'),
              const SizedBox(width: 12),
              _buildEmotionContainer(2, 'Бешенство', 'assets/images/madness.png'),
              const SizedBox(width: 12),
              _buildEmotionContainer(3, 'Грусть', 'assets/images/sadness.png'),
              const SizedBox(width: 12),
              _buildEmotionContainer(4, 'Спокойствие', 'assets/images/calmness.png'),
              const SizedBox(width: 12),
              _buildEmotionContainer(5, 'Сила', 'assets/images/power.png'),
              const SizedBox(width: 20),
            ],
          ),
        ),
        const SizedBox(height: 20),
        VisibilityWrap(isShow: _isShow, currentEmotion: _selectedIndex),
      ],
    );
  }

  void _onEmotionTapped(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = -1;
        _isShow = false;
      } else {
        _selectedIndex = index;
        _isShow = true;
      }
    });
  }

  Widget _buildEmotionContainer(int index, String name, String image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _onEmotionTapped(index);
        });
      },
      child: EmotionContainer(
        name: name,
        image: image,
        isSelected: _selectedIndex == index,
      ),
    );
  }
}
