import 'package:flutter/material.dart';
import 'package:nike/widgets/check.dart';

class Menu<T> extends StatefulWidget {
  const Menu({
    Key? key,
    required this.answers,
    required this.onChange,
    required this.label,
    this.initialValue,
  }) : super(key: key);

  final List<T> answers;
  final Function(List<T> values) onChange;
  final String label;
  final List<T>? initialValue;

  @override
  State<Menu<T>> createState() => _MenuState<T>();
}

class _MenuState<T> extends State<Menu<T>> {
  List<T> values = [];

  @override
  void initState() {
    super.initState();
    values = widget.initialValue ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 26,
        horizontal: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.label} ${labelText(values.length)}',
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 18,
          ),
          Column(
            children: widget.answers
                .map(
                  (e) => Check(
                    value: values.contains(e),
                    onChange: (bool value) {
                      setState(() {
                        value ? values.add(e) : values.remove(e);
                      });
                      widget.onChange(values);
                    },
                    label: e.toString(),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  String labelText(int number) => number > 0 ? '($number)' : '';
}
