import 'package:flutter/widgets.dart';

/// A model representing a single option within the multi-select dropdown.
class MultiSelectOption<T> {
  /// The underlying value of the option.
  final T value;

  /// The text displayed for this option.
  final String label;

  /// An optional icon displayed next to the label.
  final IconData? icon;

  MultiSelectOption({
    required this.value,
    required this.label,
    this.icon,
  });
}
