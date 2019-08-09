import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/note_detail.dart';
import 'dart:async';
import 'package:flutter_app1/models/note.dart';
import 'package:flutter_app1/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}
 class NoteListState extends State<NoteList> {
   DatabaseHelper databaseHelper = DatabaseHelper();
   List<Note> noteList;
   int count = 0;

   @override
   Widget build(BuildContext context) {

     if(noteList == null)
       {
         noteList = List<Note>();
         updateLV();
       }

     return Scaffold(
       appBar: AppBar(
         title: Text("Notes"),
       ),
       body: getNoteList(),
       floatingActionButton: FloatingActionButton(
         onPressed: () {
           debugPrint("FAB clicked");
           navigateToDetail(Note('','',2),'Add note');
         },
         tooltip: "Add Note",
         child: Icon(Icons.add),
       ),
     );
   }

   ListView getNoteList() {
     TextStyle titleStyle = Theme
         .of(context)
         .textTheme
         .subhead;
     return ListView.builder(
       itemCount: count,
       itemBuilder: (BuildContext context, int position) {
         return Card(
           color: Colors.white,
           elevation: 2.0,
           child: ListTile(
             leading: CircleAvatar(
               backgroundColor: getPriorityColor(this.noteList[position].priority),
               child: getPriorityIcon(this.noteList[position].priority),
             ),
             title: Text(this.noteList[position].title, style: titleStyle,),
             subtitle: Text(this.noteList[position].description),
             trailing:GestureDetector(
               child: Icon(Icons.delete),
               onTap: () {
                 _delete(context, noteList[position]);
               },
             ),
             onTap: () {
               debugPrint("List item tapped");
               navigateToDetail(this.noteList[position],'Edit note');
             },
           ),
         );
       },
     );
  }


   //function for color
   Color getPriorityColor(int priority) {
     switch (priority) {
       case 1:
         return Colors.red;
         break;
       case 2:
         return Colors.yellow;
         break;
       default:
         return Colors.yellow;
     }
   }

   //function for icon

   Icon getPriorityIcon(int priority) {
     switch (priority) {
       case 1:
         return Icon(Icons.play_arrow);
         break;
       case 2:
         return Icon(Icons.keyboard_arrow_right);
         break;
       default:
         return Icon(Icons.keyboard_arrow_right);
     }
   }

   void _delete(BuildContext context,Note note) async {
     int result = await databaseHelper.deleteNote(note.id);
     if(result != 0)
       _showSnakeBar(context,'Note deleted successfully.');
     updateLV();
   }
   void _showSnakeBar(BuildContext context,String message){

     final snackBar = SnackBar(content: Text(message));
     Scaffold.of(context).showSnackBar(snackBar);

   }


  void navigateToDetail(Note note,String title) async{

    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note,title);
    }));
    if(result == true)
      updateLV();
  }

  void updateLV() {
     final Future<Database> dbfuture = databaseHelper.initializeDatabase();
     dbfuture.then((database) {
       Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
       noteListFuture.then((noteList) {
         setState(() {
           this.noteList = noteList;
           this.count = noteList.length;
         });
       });
     });
  }
}

