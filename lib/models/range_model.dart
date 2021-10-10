import 'package:school_project/models/range_type.dart';

class RangeModel {
  final DayType dayType;
  final DateTime startTime;
  final DateTime endTime;

  RangeModel({
    required this.dayType,
    required this.startTime,
    required this.endTime,
  });
  RangeModel.oneDay({
    required this.dayType,
    required DateTime dateTime,
  })  : endTime = dateTime,
        startTime = dateTime;
}
