import 'package:flutter/material.dart';
import 'package:my_first_getx_app/data/model/question_model.dart';
import 'package:my_first_getx_app/utils/extensions.dart';

class QuestionSection extends StatelessWidget {
  const QuestionSection({
    super.key,
    required this.questionModel,
    required this.selectedIndex,
    required this.onPressSelectOption,
  });

  final QuestionModel questionModel;
  final int selectedIndex;
  final void Function(int index) onPressSelectOption;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: questionModel.options.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => onPressSelectOption(index),
          child: Container(
            width: context.width,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Colors.amberAccent.shade700
                        : Colors.transparent,
                    border: Border.all(color: Colors.white),
                    borderRadius:
                        BorderRadius.circular(context.isDesktop ? 200 : 100),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: context.isDesktop ? 2 : 5),
                  child: Text(
                    String.fromCharCode(65 + index),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.isDesktop ? 20 : 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  questionModel.options[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.isDesktop ? 20 : 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
