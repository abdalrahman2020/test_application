import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_application/pages/home/components/components.dart';

class RowEmotionList extends StatefulWidget {
  const RowEmotionList({super.key});

  @override
  _RowEmotionListState createState() => _RowEmotionListState();
}

class _RowEmotionListState extends State<RowEmotionList> {
  final List<int> _selectedEmotionIndices = [];
  int? _lastSelectedEmotionIndex;
  final Map<int, Set<String>> selectedSubEmotions = {};

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
        if (_lastSelectedEmotionIndex != null)
          VisibilityWrap(
            isShow: true,
            currentEmotion: _lastSelectedEmotionIndex!,
            selectedSubEmotions: selectedSubEmotions[_lastSelectedEmotionIndex] ?? {},
            onSubEmotionSelected: _onSubEmotionSelected,
          ),
      ],
    );
  }

  void _onEmotionTapped(int index) {
    setState(() {
      if (_selectedEmotionIndices.contains(index)) {
        _selectedEmotionIndices.remove(index);
        if (_lastSelectedEmotionIndex == index && _selectedEmotionIndices.isNotEmpty) {
          _lastSelectedEmotionIndex = _selectedEmotionIndices.last;
        } else if (_selectedEmotionIndices.isEmpty) {
          _lastSelectedEmotionIndex = null;
        }
      } else {
        _selectedEmotionIndices.add(index);
        _lastSelectedEmotionIndex = index;
      }
    });
  }

  void _onSubEmotionSelected(int emotionIndex, String subEmotion) {
    setState(() {
      selectedSubEmotions[emotionIndex] ??= {};

      if (selectedSubEmotions[emotionIndex]!.contains(subEmotion)) {
        selectedSubEmotions[emotionIndex]!.remove(subEmotion);
      } else {
        selectedSubEmotions[emotionIndex]!.add(subEmotion);
      }
    });
  }

  Widget _buildEmotionContainer(int index, String name, String image) {
    return GestureDetector(
      onTap: () {
        _onEmotionTapped(index);
      },
      child: EmotionContainer(
        name: name,
        image: image,
        isSelected: _selectedEmotionIndices.contains(index),
      ),
    );
  }
}
