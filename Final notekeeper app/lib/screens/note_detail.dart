import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter_app1/models/note.dart';
import 'package:flutter_app1/utils/database_helper.dart';

// ignore: must_be_immutable
class NoteDetail extends StatefulWidget {
  String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  static var _priorities = ['High', 'Low'];
  DatabaseHelper helper = DatabaseHelper();
  var _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final FocusNode _titleNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();
  String appBarTitle;
  Note note;

  NoteDetailState(this.note, this.appBarTitle) {
    titleController.text = note.title;
    descriptionController.text = note.description;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return WillPopScope(
        onWillPop: () {
          moveToLastScreen();
          return null;
        },
        child: Scaffold(
            appBar: AppBar(
                title: Text(appBarTitle),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      moveToLastScreen();
                    })),
            body: Padding(
              padding: EdgeInsets.only(
                  top: 15.0, bottom: 0.0, right: 10.0, left: 10.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: DropdownButton(
                          items: _priorities.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          style: textStyle,
                          value: getPriorityAsString(note.priority),
                          onChanged: (valueSelected) {
                            setState(() {
                              debugPrint("Priority is $valueSelected");
                              updatePriorityToInt(valueSelected);
                            });
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: TextFormField(
                        controller: titleController,
                        style: textStyle,
                        textInputAction: TextInputAction.next,
                        focusNode: _titleNode,
                        onFieldSubmitted: (term) {
                          _titleNode.unfocus();
                          FocusScope.of(context).requestFocus(_descriptionNode);
                        },
                        validator: (String value) {
                          if(value.isNotEmpty) {
                            updateTitle();
                            return null;
                          }
                          else{
                            return 'Please enter title.';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "Title",
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: TextFormField(
                        controller: descriptionController,
                        style: textStyle,textInputAction: TextInputAction.done,
                        focusNode: _descriptionNode,
                        onFieldSubmitted: (value){
                          _descriptionNode.unfocus();
                        },
                        validator: (String value) {
                          if(value.isNotEmpty) {
                            updateDescription();
                            return null;
                          }
                          else{
                            return 'Please enter description.';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "Description",
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: RaisedButton(
                                  color: Theme.of(context).primaryColorDark,
                                  textColor:
                                      Theme.of(context).primaryColorLight,
                                  child: Text(
                                    "Save",
                                    textScaleFactor: 1.5,
                                  ),
                                  onPressed: () {
                                    if(_formKey.currentState.validate()) {
                                      setState(() {
                                        _save();
                                      });
                                    }
                                  })),
                          Container(
                            width: 5.0,
                          ),
                          Expanded(
                              child: RaisedButton(
                                  color: Theme.of(context).primaryColorDark,
                                  textColor:
                                      Theme.of(context).primaryColorLight,
                                  child: Text(
                                    "Delete",
                                    textScaleFactor: 1.5,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      debugPrint("Delete clicked");
                                      _delete();
                                    });
                                  })),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updatePriorityToInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
        break;
    }
    return priority;
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void _delete() async {
    moveToLastScreen();
    if (note.id == null) {
      _showSnakeBar(context, 'New note was note created.');
    } else {
      int result;
      result = await helper.deleteNote(note.id);
      if (result != 0)
        _showSnakeBar(context, 'Note deleted.');
      else
        _showSnakeBar(context, 'Unable to delete the note.');
    }
  }

  void _save() async {
    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());

    int result;
    if (note.id != null) {
      result = await helper.updateNote(note);
    } else {
      result = await helper.insertNote(note);
    }

    if (result != 0) {
      _showSnakeBar(context, 'Note saved successfully.');
    } else {
      _showSnakeBar(context, 'Problem saving note.');
    }
  }

  void _showSnakeBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
