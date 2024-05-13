import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habits_tracker/Pages/progress.dart';
import 'package:habits_tracker/Pages/report.dart';
import 'package:habits_tracker/Pages/settings.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'add_task_by_template.dart';
import 'add_task_page.dart';
import 'challenge.dart';
import 'journal.dart';
import '../Database/habit_database.dart';
import '../Helper/habit_tile.dart';
import '../Helper/uiHelper.dart';
import '../Helper/global_variables.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }

}
class HomePageState extends State<HomePage> {
  HabitDatabase hdb =  HabitDatabase();
  final _myBox = Hive.box('Habit_Database');
  TextEditingController nameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController questionController = TextEditingController();

  // static final List habitsData = [];
  // final List checkBoxData = [false, false, false];



  @override
  void initState() {
    // if there is no current habit list, then it is the 1st time ever open the app
    // then create default data
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      hdb.defaultData();
    }
    else
    {
      // there already exists data, this is not the first time
      hdb.loadData();
      hdb.loadCheckbox();

    }

    // update the database
    hdb.updateData();

    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8,),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Show the date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isDateSelected? DateFormat.MMMd().format(selectedDate) : todayText,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26,),),
                      Text(
                        isDateSelected? 'Review' : showDate,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // add habit button
                      IconButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddTaskPage(
                                  nameController: nameController,
                                  noteController: noteController,
                                  questionController: questionController,
                                  onSave: saveNewHabit,
                                ),));
                        },
                        icon: const Icon(Icons.add_rounded, color: Colors.blue, size: 28,),
                      ),
                      // add habit by template button
                      IconButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AddTaskPageTemplate(),));},
                        icon: const Icon(Icons.expand_more_outlined, color: Colors.white, size: 28,),
                      ),
                      // button for pick a date
                      IconButton(
                        onPressed: () async {
                          DateTime? datePicked = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if(datePicked!=null){
                            // do something
                            setState(() {
                              selectedDate = datePicked;
                              isDateSelected = true;

                              // compare
                              var cd = DateFormat.yMd().format(DateTime.now());
                              var sd = DateFormat.yMd().format(datePicked);
                              if(cd == sd)
                              { isDateSelected = false;
                              }

                            });

                          }

                        },
                        icon: const Icon(Icons.calendar_month_outlined,),
                      ),
                      // button for more options
                      PopupMenuButton(
                          shape: Border.all() ,
                          tooltip: 'More',
                          color: Colors.black,
                          elevation: 1 ,
                          surfaceTintColor: Colors.white,
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                   const Text('Hide Archived'),
                                  Checkbox(value: HabitDatabase.checkBoxData[0], onChanged:(value) {checkBoxTap(value, 0);
                                  Navigator.of(context).pop();},
                                    checkColor: Colors.white, activeColor: Colors.lightBlue,) ],)
                            ),
                            PopupMenuItem(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  const Text('Hide Completed'),
                                  Checkbox(value:HabitDatabase.checkBoxData[1], onChanged:(value) {checkBoxTap(value, 1);
                                  Navigator.of(context).pop();},
                                    checkColor: Colors.white, activeColor: Colors.lightBlue,) ],
                            )),
                            PopupMenuItem(child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  const Text('Light theme',),
                                  Checkbox(value: HabitDatabase.checkBoxData[2], onChanged:(value) { checkBoxTap(value, 2);
                                  Navigator.of(context).pop();},
                                    checkColor: Colors.white, activeColor: Colors.lightBlue,)
                              ],
                            ), onTap: (){},),
                            PopupMenuItem(child: const Text('Help & FAQ'),onTap: (){},),
                            PopupMenuItem(child: const Text('About'), onTap: (){},),
                            PopupMenuItem(
                              child: const Text('Exit'),
                              onTap: (){
                                if (Platform.isAndroid) {
                                  Future.delayed(const Duration(seconds: 1), () {
                                    SystemNavigator.pop();
                                  },);
                                }else if (Platform.isIOS){
                                  Future.delayed(const Duration(seconds: 1), () {
                                    exit(0);
                                  },);
                                }
                              },),

                          ]),

                    ],)
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row( mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sorting
                    SortingBar(name: 'All', onPress: (){},),
                    const SizedBox(width: 3,),
                    SortingBar(name: 'Morning', onPress: (){},),
                    const SizedBox(width: 3,),
                    SortingBar(name: 'Afternoon', onPress: (){},),
                    const SizedBox(width: 3,),
                    SortingBar(name: 'Evening', onPress: (){},),
                    const SizedBox(width: 3,),
                    SortingBar(name: 'Night', onPress: (){},),
                  ],
                ),
              ),
              Expanded(
                child: Row(mainAxisAlignment:MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10,),
                            const Text('TASKS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                            Expanded(child: ListView.builder(
                              itemCount: HabitDatabase.habitsData.length,
                              itemBuilder: (context, int index) {
                                return HabitTile(
                                  habitName: HabitDatabase.habitsData[index][0],
                                  habitCompleted: HabitDatabase.habitsData[index][1],
                                  onChanged: (value) {checkBoxTapped(value, index);},
                                  manage: (context){manageHabitSettings(index);},
                                  remove: (context){deleteHabit(index);},
                                );
                              },
                            ),
                            ),
                          ]
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Tabs
                          const SizedBox(height: 60,),
                          SideNavigation(name: 'Home', icon: Icons.home, onPress: (){},),
                          SideNavigation(
                            name: 'Journal', icon: Icons.table_rows_sharp,
                            onPress: () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const Journal(),)),),
                          SideNavigation(
                            name: 'Progress', icon: Icons.timelapse_rounded,
                            onPress: () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const Progress(),)),),
                          SideNavigation(
                            name: 'Challenge', icon: Icons.run_circle_outlined,
                            onPress: () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const Challenge(),)),),
                          SideNavigation(
                            name: 'Reports', icon: Icons.stacked_line_chart_rounded,
                            onPress: () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const Reports(),)),),
                          SideNavigation(
                            name: 'Settings', icon: Icons.settings,
                            onPress: () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const Settings(),)),),
                          const SizedBox(height: 30,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

      ),

    );
  }




  // Methods for UI
  void saveNewHabit(){
    // Too Add Habit Data
    if (nameController.text.isNotEmpty) {
      setState(() {
        HabitDatabase.habitsData.add([
          nameController.text,
          false,
          noteController.text,
          questionController.text,
        ]);
      });

      // Clear the Text Field
      nameController.clear();
      noteController.clear();
      questionController.clear();
      //  Close the Dialog Box
      Navigator.of(context).pop();
      hdb.updateData();

    }
  }
  void editHabit(int index){

    if (nameController.text.isNotEmpty)
      {
        setState(() {
          HabitDatabase.habitsData[index][0] = nameController.text;
        });
        nameController.clear();
        Navigator.of(context).pop();
        hdb.updateData();
      }
  }
  void deleteHabit(int index){
    setState(() {
      // delete a specific habit
      HabitDatabase.habitsData.removeAt(index);
    });
    hdb.updateData();
  }

  void cancelDialogBox(){
    // Clear the Text Field
    nameController.clear();
    //  Close the Dialog Box
    Navigator.of(context).pop();
  }

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      // ture or false values are assign to arrayList
      HabitDatabase.habitsData[index][1] = value;
    });
    hdb.updateData();
  }
  // dropdown button check box tap data changing
  void checkBoxTap(bool? value, int index){
    setState(() {
      HabitDatabase.checkBoxData[index] = value;
    });
    hdb.updateCheckbox();
  }

  void manageHabitSettings(int index){

    showDialog(
      // Hold Alert Box whenever key is not pressed
      barrierDismissible: false,
      // Dialog background color with shade
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      builder: (context) {
        return Stack(
            children: [
              Positioned(
                top: 100,
                child: AlertDialog(
                  content: TextField(maxLength: 26,
                    controller: nameController,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: 'Enter New Habit .....',
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white24)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70)
                      ),

                    ),
                  ),
                  actions: [ Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          editHabit(index);
                        },
                        color: Colors.green.shade600,
                        child: const Text('Update', style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(width: 5,),
                      MaterialButton(
                        onPressed: () {
                          cancelDialogBox();
                        },
                        color: Colors.green.shade600,
                        child: const Text('Cancel', style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  )

                  ],

                ),
              ),
            ]
        );
      },
    );

  }


}
