import 'package:nike/models/filter.dart';

class Gender extends Filter {
  final String value;

  const Gender({
    required String label,
    required this.value,
  }) : super(label);

  @override
  List<Object> get props => [value, label];


}

const List<Gender> genders = [
  Gender(
    label: 'Hommes',
    value: 'homme',
  ),
  Gender(
    label: 'Femmes',
    value: 'femme',
  ),
  Gender(
    label: 'Mixte',
    value: 'mixte',
  ),
];
