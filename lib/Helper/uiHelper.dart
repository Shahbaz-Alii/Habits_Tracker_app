import 'package:flutter/material.dart';

class UiHelper extends StatelessWidget {
  const UiHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SortingBar extends StatelessWidget{
  final String name;
  final Function()? onPress;
  const SortingBar({
    super.key,
    required this.name,
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
   return RawMaterialButton(fillColor: Colors.white12, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
     onPressed: onPress,
     child: Text(
       name,
       style: TextStyle(
         fontWeight: FontWeight.w600,
           color: Colors.grey.shade300
       ),),);
  }
}

class SideNavigation extends StatelessWidget{
  final String name;
  final IconData icon;
  final Function()? onPress;
  const SideNavigation({super.key, required this.name, required this.icon, this.onPress,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: InkWell(onTap: onPress,
        borderRadius: BorderRadius.circular(29),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black26,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(icon, color: Colors.white,),
            Text(
              name,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),)
          ],
        ),),
      ),
    );
  }
}

class MyTextField extends StatelessWidget{
  final String? hint;
  final TextEditingController? controller;
  final bool? isReadOnly;

  const MyTextField({super.key, this.hint, this.controller, this.isReadOnly,});

  @override
  Widget build(BuildContext context) {
   return Container(
     height: 52,
     width: double.maxFinite,
     decoration: BoxDecoration(
         border: Border.all(width: 1, color: Colors.grey),
       borderRadius: BorderRadius.circular(6)
     ),
     padding: const EdgeInsets.symmetric(horizontal: 16),
     child: TextField(
       // if isReadOnly variable is not null then .. read only true else read only false
       readOnly: isReadOnly??false,
       controller: controller,
       cursorColor: Colors.white70,
       style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
       decoration: InputDecoration(
         hintText: hint,
         hintStyle: const TextStyle(color:Colors.white30),
         // border: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.white70,)),
         enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
         focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),


       ),
     )



   );
  }

}