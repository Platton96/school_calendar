import 'package:flutter/cupertino.dart';
import 'package:school_project/models/range_model.dart';
import 'package:school_project/models/range_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalendarViewModel extends ChangeNotifier {
  final ranges = [
    RangeModel(
      dayType: DayType.holiday,
      startTime: DateTime(2021, 11, 1),
      endTime: DateTime(2021, 11, 10),
    )
  ];

  void initialise() {
    print('11');
    final renges = FirebaseFirestore.instance
        .collection('ranges')
        .withConverter<RangeModel>(
          fromFirestore: (snapshots, _) {
            print(snapshots);
            return RangeModel.oneDay(
                dayType: DayType.defaultDay, dateTime: DateTime(2021));
          },
          toFirestore: (movie, _) => {},
        );
    final b = renges;
    //notifyListeners();
  }

  Color getBackGroundColor(DateTime dateTime) {
    var dayType = DayType.defaultDay;
    for (final range in ranges) {
      if (dateTime == range.startTime ||
          dateTime == range.endTime ||
          (dateTime.isAfter(range.startTime) &&
              dateTime.isBefore(range.endTime))) {
        dayType = range.dayType;
        break;
      }
    }
    return dayType.toColor();
  }
}
