import 'package:flutter/material.dart';

class Check extends StatelessWidget {
  const Check({
    Key? key,
    required this.value,
    required this.onChange,
    required this.label,
  }) : super(key: key);

  final bool value;
  final Function(bool) onChange;
  final String label;

  @override
  Widget build(BuildContext context) {
    const size = 24.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              onChange(!value);
            },
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),
                color: value ? Colors.black : null,
              ),
              child: value
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 20,
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              label,
            ),
          )
        ],
      ),
    );
  }
}
