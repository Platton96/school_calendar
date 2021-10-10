import 'package:flutter/material.dart';
import 'package:school_project/app/view_models/calendar_view_model.dart';
import 'package:school_project/app/widgets/month_cell.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalendarViewModel>.reactive(
        viewModelBuilder: () => CalendarViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SfCalendar(
              view: CalendarView.month,
              firstDayOfWeek: 1,
              monthViewSettings: const MonthViewSettings(showAgenda: true),
              monthCellBuilder:
                  (BuildContext buildContext, MonthCellDetails details) {
                final Color backgroundColor =
                    viewModel.getBackGroundColor(details.date);

                final Color defaultColor =
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.black54
                        : Colors.white;
                return MonthCell(
                  backgroundColor: backgroundColor,
                  borderColor: defaultColor,
                  text: details.date.day.toString(),
                );
              },
            ),
          );
        });
  }
}
