import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practice/constant.dart';
import 'package:practice/page/components/SideDrawer.dart';
import 'package:practice/page/firstmenupage.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //local methods
    var text = Text(
      "Calendar".toUpperCase(),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
    );
    var boxShadow = BoxShadow(
      color: Colors.grey,
      blurRadius: 2.0,
      spreadRadius: 2.0,
    );
    //scaffold code
    return Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          title: text,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => firstmenupage()),
                );
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 10,
          /*leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    splashColor: Color(0x808080), //can change the effect of pressing it
                    onPressed: () {},
                  )
                ],*/
        ),
        body: Container(
          height: size.height,
          width: size.width,
          decoration: kGradientColor,
          child: Row(
            /*using a Row layout to divide 3 part
                was planning to segegrate it into two rows each with a flex of 5
                and the left side will have the calendar and the right side is the 2 column*/
            children: <Widget>[
              ///calendar
              SizedBox(
                height: size.height * 0.8,
                width: size.width * 0.5,
                child: Expanded(
                    flex: 5, //code the size to fit 0% of the entire page
                    child: Container(
                      height: size.height,
                      width: size.width,
                      decoration: kGradientColor,
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20.0)),
                        //margin: EdgeInsets.all(20.0),
                        child: SfCalendar(
                          view: CalendarView.month, //set view for calendar
                          firstDayOfWeek: 1,
                          monthViewSettings: MonthViewSettings(
                              //showAgenda: true, //to be discussed for implementation
                              appointmentDisplayMode: //feature to show appointment made on that day in a monthly view
                                  MonthAppointmentDisplayMode.appointment),
                          //monthViewSettings: MonthViewSettings(showAgenda: true), //show agenda and date for that date
                          showDatePickerButton: true,
                          showNavigationArrow: true,
                          //for selection border
                          selectionDecoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.red, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            shape: BoxShape.rectangle,
                          ),
                          //for future onTap usage what should be displayed when a date is pressed
                          //look for the method void calendartap as below for more references
                          //references link : https://www.syncfusion.com/kb/10999/how-to-get-appointment-details-from-the-ontap-event-of-the-flutter-calendar
                          onTap: calendartap,
                        ),
                      ),
                    )),
              ),
              //right portion of the UI
              Expanded(
                  flex: 4,
                  child: Container(
                    height: size.height * 0.9,
                    width: size.width * 0.7,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: containertext(size, boxShadow, "Notes")),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child:
                                  containertext(size, boxShadow, "Reminder")),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  Container containertext(Size size, BoxShadow boxShadow, String text) {
    return Container(
        width: size.width,
        height: size.height,
        decoration: buildBoxDecoration(boxShadow, Colors.white),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ));
  }

  BoxDecoration buildBoxDecoration(BoxShadow boxShadow, Color colo) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white,
      boxShadow: [boxShadow],
    );
  }

  //calendar on tap action method
  void calendartap(CalendarTapDetails details) {}
}
