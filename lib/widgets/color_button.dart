import 'package:flutter/material.dart';
import 'package:nike/models/couleur.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    Key? key,
    required this.checked,
    required this.onChange,
    required this.couleur,
  }) : super(key: key);

  final bool checked;
  final Couleur couleur;
  final Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width:
          width > 1080 ? 78 : ((width <= 1080 && width > 780) ? 78 : width / 4),
      height: 78,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
              onTap: () {
                onChange(!checked);
              },
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: couleur.value,
                ),
                child: checked
                    ? Icon(
                        Icons.check,
                        size: 20,
                        color: couleur.value != Colors.white
                            ? Colors.white
                            : Colors.black,
                      )
                    : null,
              ),
            ),
          ),
          Text(
            couleur.label,
          )
        ],
      ),
    );
  }
}
