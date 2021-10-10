import 'package:flutter/material.dart';

enum DayType {
  holiday,
  defaultDay,
}

extension RangeTypeExtension on DayType {
  Color toColor() {
    switch (this) {
      case DayType.holiday:
        return Colors.blue;
      case DayType.defaultDay:
        return Colors.transparent;
    }
  }
}
