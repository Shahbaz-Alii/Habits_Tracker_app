import 'package:intl/intl.dart';


// Global Variables Declarations

DateTime date = DateTime.now();

var showDate = DateFormat(' MMMM d').format(date);

DateTime today = DateTime(date.month, date.day);
DateTime yesterday = DateTime(date.month, date.day - 1);
DateTime tomorrow = DateTime(date.month, date.day + 1);

String todayText = 'TODAY';
String yesterdayText = 'YESTERDAY';
String tomorrowText = 'TOMORROW';

var yesterdaySelected = DateFormat.MMMMd().format(yesterday);
var tomorrowSelected = DateFormat.MMMMd().format(tomorrow);

DateTime selectedDate = date;
bool isDateSelected = false;


