import 'package:flutter/material.dart';
import 'package:nike/models/filter.dart';

class Couleur extends Filter {
  final Color value;

  const Couleur({
    required String label,
    required this.value,
  }) : super(label);

  @override
  List<Object?> get props => [label, value];
}

const List<Couleur> colors = [
  Couleur(
    label: 'Pourpre',
    value: Colors.deepPurple,
  ),
  Couleur(
    label: 'Noir',
    value: Colors.black,
  ),
  Couleur(
    label: 'Rouge',
    value: Colors.red,
  ),
  Couleur(
    label: 'Orange',
    value: Colors.orange,
  ),
  Couleur(
    label: 'Blue',
    value: Colors.blue,
  ),
  Couleur(
    label: 'Blanc',
    value: Colors.white,
  ),
  Couleur(
    label: 'Marron',
    value: Colors.brown,
  ),
  Couleur(
    label: 'Vert',
    value: Colors.green,
  ),
  Couleur(
    label: 'Jaune',
    value: Colors.yellowAccent,
  ),
  Couleur(
    label: 'Gris',
    value: Colors.grey,
  ),
];
