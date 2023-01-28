import 'package:equatable/equatable.dart';

abstract class Filter extends Equatable {
  final String label;

  const Filter(
    this.label,
  );

  @override
  String toString() => label;
}
