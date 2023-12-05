import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('New Task'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(child: const TextField(
              decoration: InputDecoration(
                labelText: "Enter Title",
                border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(child: const TextField(
              decoration: InputDecoration(
                labelText: "Enter Description",
                border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              height:50.0,
              child: ElevatedButton(
                onPressed: (){},
                child: Text('Add Task',
                  style: GoogleFonts.roboto(fontSize: 18)
                  ),
                ),
              ),],
            ),

            )
          ,
        );
    
  
  }
}