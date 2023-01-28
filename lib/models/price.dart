import 'package:nike/models/filter.dart';

class Price extends Filter {
  final double min;
  final double max;

  const Price({
    required String label,
    required this.min,
    required this.max,
  }) : super(label);

  @override
  List<Object?> get props => [label, min, max];
}

const List<Price> prices = [
  Price(label: 'Moins de €50', min: 0, max: 50),
  Price(label: '€50 - €100', min: 50, max: 100),
  Price(label: '€100 - €150', min: 100, max: 150),
  Price(label: 'Plus de €150', min: 150, max: 10000),
];
