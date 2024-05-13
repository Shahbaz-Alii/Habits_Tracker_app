import 'package:flutter/material.dart';
import 'package:habits_tracker/Database/habit_database.dart';
import 'home_page.dart';

class AddTaskPageTemplate extends StatefulWidget{
  const AddTaskPageTemplate({super.key,});

  @override
  State<AddTaskPageTemplate> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTaskPageTemplate> {
HabitDatabase hdb = HabitDatabase();

void createHabitByTemplate(String name,){

   setState(() {
     HabitDatabase.habitsData.add([name, false,]);
   });
   hdb.updateData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Habit'),

      ),

      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0 , top: 8.0 , bottom: 8.0),
            child: InkWell(borderRadius: BorderRadius.circular(16),onTap: (){
              createHabitByTemplate( 'Clean Home',);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
            },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    borderRadius: const BorderRadius.all(Radius.circular(16))
                ),
                child: Row(
                  children: [
                    // Transform.scale( scale: 1.9, child: Checkbox(value: true, onChanged: (value) => false, shape: CircleBorder(), activeColor: Colors.blueGrey.shade400,checkColor:Colors.white70,tristate: true, )),
                    FilledButton(
                      onPressed: (){},
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey),shape:MaterialStateProperty.all(const CircleBorder(side: BorderSide(color: Colors.black)))), child: const Icon(Icons.add_rounded, size: 24, color: Colors.white,),),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: CircleAvatar(backgroundColor: Colors.blueGrey.shade900,child: const Icon(Icons.cleaning_services , size: 34,), )
                    ),
                    const Text(
                      'Clean Home',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                    ),

                  ],
                ),

              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0 , top: 8.0 , bottom: 8.0),
            child: InkWell(borderRadius: BorderRadius.circular(16),onTap: (){
              createHabitByTemplate( 'Walk Daily',);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
            },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    borderRadius: const BorderRadius.all(Radius.circular(16))
                ),
                child: Row(
                  children: [
                    // Transform.scale( scale: 1.9, child: Checkbox(value: true, onChanged: (value) => false, shape: CircleBorder(), activeColor: Colors.blueGrey.shade400,checkColor:Colors.white70,tristate: true, )),
                    FilledButton(onPressed: (){}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey),shape:MaterialStateProperty.all(const CircleBorder(side: BorderSide(color: Colors.black)))), child: const Icon(Icons.add_rounded, size: 24, color: Colors.white,),),
                    Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: CircleAvatar(backgroundColor: Colors.blueGrey.shade900,child: const Icon(Icons.directions_run , size: 36,), )
                    ),
                    const Text(
                      'Walk Daily',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                    ),

                  ],
                ),

              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0 , top: 8.0 , bottom: 8.0),
            child: InkWell(borderRadius: BorderRadius.circular(16),onTap: (){
              createHabitByTemplate('Read Books',);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
            },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    borderRadius: const BorderRadius.all(Radius.circular(16))
                ),
                child: Row(
                  children: [
                    // Transform.scale( scale: 1.9, child: Checkbox(value: true, onChanged: (value) => false, shape: CircleBorder(), activeColor: Colors.blueGrey.shade400,checkColor:Colors.white70,tristate: true, )),
                    FilledButton(onPressed: (){},
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey),shape:MaterialStateProperty.all(const CircleBorder(side: BorderSide(color: Colors.black)))), child: const Icon(Icons.add_rounded, size: 24, color: Colors.white,),),
                    Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: CircleAvatar(backgroundColor: Colors.blueGrey.shade900,child: const Icon(Icons.edit , size: 34,), )
                    ),
                    const Text(
                      'Read Books',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                    ),

                  ],
                ),

              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0 , top: 8.0 , bottom: 8.0),
            child: InkWell(borderRadius: BorderRadius.circular(16), onTap: (){
              createHabitByTemplate('Sleep 6 Hours',);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
            },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    borderRadius: const BorderRadius.all(Radius.circular(16))
                ),
                child: Row(
                  children: [
                    // Transform.scale( scale: 1.9, child: Checkbox(value: true, onChanged: (value) => false, shape: CircleBorder(), activeColor: Colors.blueGrey.shade400,checkColor:Colors.white70,tristate: true, )),
                    FilledButton(onPressed: (){}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey),shape:MaterialStateProperty.all(const CircleBorder(side: BorderSide(color: Colors.black)))), child: const Icon(Icons.add_rounded, size: 24, color: Colors.white,),),
                    Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: CircleAvatar(backgroundColor: Colors.blueGrey.shade900,child: const Icon(Icons.alarm , size: 36,), )
                    ),
                    const Text(
                      'Sleep 6 Hours',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                    ),

                  ],
                ),

              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0 , top: 8.0 , bottom: 8.0),
            child: InkWell(borderRadius: BorderRadius.circular(16), onTap: (){
              createHabitByTemplate('Hardwork 2-8h',);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
            },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade900,
                    borderRadius: const BorderRadius.all(Radius.circular(16))
                ),
                child: Row(
                  children: [
                    // Transform.scale( scale: 1.9, child: Checkbox(value: true, onChanged: (value) => false, shape: CircleBorder(), activeColor: Colors.blueGrey.shade400,checkColor:Colors.white70,tristate: true, )),
                    FilledButton(onPressed: (){}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey),shape:MaterialStateProperty.all(const CircleBorder(side: BorderSide(color: Colors.black)))), child: const Icon(Icons.add_rounded, size: 24, color: Colors.white,),),
                    Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: CircleAvatar(backgroundColor: Colors.blueGrey.shade900,child: const Icon(Icons.hardware_rounded , size: 36,), )
                    ),
                    const Text(
                      'Hardwork 2-8h',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                    ),

                  ],
                ),

              ),
            ),
          ),

        ]
      ),
    );
  }
}