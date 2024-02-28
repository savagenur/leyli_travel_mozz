import 'package:flutter/material.dart';

class PrimaryDropDownButton<T> extends StatelessWidget {
  const PrimaryDropDownButton({
    Key? key,
    required this.items,
    required this.onChanged,
    this.isRequired = true,
    this.value,
    this.hintText,
    this.labelText,
  }) : super(key: key);

  final List<DropdownMenuItem<T>>? items;
  final Function(T?) onChanged;
  final bool isRequired;
  final T? value;
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      menuMaxHeight: MediaQuery.of(context).size.height*.5,
      items: items,
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
