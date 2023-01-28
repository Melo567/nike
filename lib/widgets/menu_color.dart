import 'package:flutter/material.dart';

import '../models/couleur.dart';
import 'color_button.dart';

class MenuColor extends StatefulWidget {
  const MenuColor({
    Key? key,
    required this.colors,
    this.initialValues,
    required this.onChange,
  }) : super(key: key);

  final List<Couleur>? initialValues;
  final List<Couleur> colors;
  final Function(List<Couleur>) onChange;

  @override
  State<MenuColor> createState() => _MenuColorState();
}

class _MenuColorState extends State<MenuColor> {
  List<Couleur> couleurs = [];

  @override
  void initState() {
    super.initState();
    couleurs = widget.initialValues ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Couleur ${labelText(couleurs.length)}',
            style: Theme.of(context).textTheme.headline3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: widget.colors
                  .map(
                    (e) => ColorButton(
                      checked: couleurs.contains(e),
                      onChange: (bool value) {
                        setState(() {
                          value ? couleurs.add(e) : couleurs.remove(e);
                        });
                        widget.onChange(couleurs);
                      },
                      couleur: e,
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  String labelText(int number) => number > 0 ? '($number)' : '';
}
