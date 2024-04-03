import 'package:intl/intl.dart';

String dateTimeFormat({required DateTime dateTime}){
  // format => wednesday, April, 03, 2024 6:41 PM
  String formattedDateTime=DateFormat.yMMMMEEEEd()
      .add_jm() // adds hour, minute, and PM || AM
      .format(dateTime);

  // Another format
  // format => wednesday, April, 03, 2024, 06:46:12
  //  String formattedDateTime=DateFormat('EEEE, MMMM, dd, yyyy, hh:mm:ss').format(dateTime);

  return formattedDateTime;
}