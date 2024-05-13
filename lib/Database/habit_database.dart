import 'package:habits_tracker/Datetime/date_time.dart';
import 'package:hive/hive.dart';

// create reference instance of Already opened database
final _myBox = Hive.box("Habit_Database");
final _myBox2 = Hive.box("Habit_Database");

class HabitDatabase {
  static List habitsData = [];
  static List checkBoxData = [false, false, false];

  // create initial default data
  void defaultData() {
    // habitsData.add(['Chill Maro' , false,]);

    //if it have the need like for the heatmap still not used
    _myBox.put("START_DATE", todaysDateFormatted());
  }

  // load data if already exists
  void loadData() {
    // if it is new day, then get habit list from database and set all false
    if (_myBox.get(todaysDateFormatted()) == null) {
      habitsData = _myBox.get("CURRENT_HABIT_LIST");
      // set all habits false since it is a new day
      for (int i = 0; i < habitsData.length; i++) {
        habitsData[i][1] = false;
      }
    } else {
      habitsData = _myBox.get(todaysDateFormatted());
    }
  }

  // update database
  void updateData() {
    // update today's entry
    _myBox.put(todaysDateFormatted(), habitsData);
    // update universal habit list in case it changed (new , edit or delete habit)
    _myBox.put("CURRENT_HABIT_LIST", habitsData);
  }



  // for update dropdown menu checkbox
  void updateCheckbox(){
    // save in device storage
    _myBox2.put("DROPDOWN_MENU", checkBoxData);
  }
  // for get or load in memory
  void loadCheckbox(){
    // get from device storage
    if(_myBox2.get("DROPDOWN_MENU") != null)
      {
        checkBoxData = _myBox2.get("DROPDOWN_MENU");
      }

  }

}
