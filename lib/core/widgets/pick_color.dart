import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_proj/core/helper/my_navigator_app.dart';

class PickColorItems extends StatelessWidget {
  const PickColorItems({super.key, required this.cubit});
  final dynamic cubit;
  @override
  Widget build(BuildContext context){
    Color backgroundColor = cubit.selectedColor;
    Color textColor = ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark
        ? Colors.white
        : Colors.black;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: cubit.selectedColor),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Pick Note Color'),
              content: SingleChildScrollView(
                child: MaterialPicker(
                  portraitOnly: true,
                  pickerColor: cubit.selectedColor,
                  onColorChanged: (color) => cubit.changeColor(color),
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('Done'),
                  onPressed: () {
                    AppNavigator.navigatorPop(context: context);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text(
        'Choose Color',
        style: TextStyle(
          color:textColor,
        ),
      ),
    );
  }
  }

