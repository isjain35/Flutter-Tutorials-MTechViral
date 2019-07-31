import 'package:flutter/material.dart';

class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }
}
 class NoteListState extends State<NoteList>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: getNoteList(),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            debugPrint("FAB clicked");
          },
          tooltip: "Add Note",
          child: Icon(Icons.add),        
          ),
    );
  }
  ListView getNoteList() {

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellowAccent,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text("Dummy text",style: titleStyle,),
              subtitle: Text("Dummy date"),
              trailing: Icon(Icons.delete),
              onTap: () {
                debugPrint("List item tapped");
              },
            ),
          );
        },
    );
 }
 }
