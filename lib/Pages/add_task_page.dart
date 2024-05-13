import 'package:flutter/material.dart';
import '../Helper/uiHelper.dart';

class AddTaskPage extends StatelessWidget{
  final TextEditingController nameController;
  final TextEditingController? questionController;
  final TextEditingController? noteController;
  final DateTime? remindTime;
  final Function()? onSave;
  final Function(BuildContext)? onSaveEdit;

  const AddTaskPage({
    super.key,
    required this.nameController,
    this.questionController,
    this.noteController,
    this.remindTime,
    this.onSave,
    this.onSaveEdit, });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter The Values'),
        backgroundColor: Colors.black26,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () { Navigator.pop(context); } ,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: MaterialButton(
              onPressed: onSave,
              shape: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.white38)),child: const Text('Save', style: TextStyle(fontSize: 18,color: Colors.white70),),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView( // it is for avoid to bottom overflow
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
              const SizedBox(height: 4,),
              MyTextField(hint: 'Enter Habit Name', controller: nameController, ),
              const SizedBox(height: 8,),
              const Text('Note', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
              const SizedBox(height: 4,),
              MyTextField(hint: 'Optional', controller: noteController,),
              const SizedBox(height: 8,),
              const Text('Frequency', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
              const SizedBox(height: 4,),
              const MyTextField(hint: 'Every day',  isReadOnly: true,),
              const SizedBox(height: 8,),
              const Text('Reminder', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
              const SizedBox(height: 4,),
              const MyTextField(hint: 'Pick Time', isReadOnly: true,),
              const SizedBox(height: 8,),
              const Text('Question', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
              const SizedBox(height: 4,),
              MyTextField(hint: 'e.g. Did you walk today?', controller: questionController, ),



            ],
          ),
        ),
      ),
    );
  }
}
