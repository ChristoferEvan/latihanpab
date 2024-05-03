import 'package:flutter/material.dart';
import 'package:notes/services/note_service.dart';

class NoteDialog extends StatelessWidget {
  final Map<String,dynamic>? note;
  final TextEditingController _titleController=TextEditingController();
  final TextEditingController _descriptionController=TextEditingController();
  NoteDialog({super.key, this.note }){
    if(note!=null){
      _titleController.text=note!['title'];
      _descriptionController.text=note!['description'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
              title: Text(note == null?'add Notes':'Update Notes'),
              content: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                 
                  Text('Title: '),
                  TextField(
                    controller: _titleController,
                    // decoration: InputDecoration(
                      // hintText: document['title']
                      
                    // ),
                  
                  ),
                  Text('Description: '),
                  TextField(
                    controller: _descriptionController,
                    // decoration: InputDecoration(
                    //   hintText: document['description']
                    // ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                  onPressed: () {
                  Navigator.of(context).pop();  
                  },
                   child: const Text('Cancel')
                   ),
                ),

                 ElevatedButton(
                onPressed: () async{
                //  Map<String, dynamic> newNote = new Map<String,dynamic>();
                //  Map<String, dynamic> updateNote = {};
                //  updateNote['title']=titleController.text;
                //  updateNote['description']=descriptionController.text;

                //  FirebaseFirestore.instance
                //     .collection('notes')
                //     .doc(document.id)
                //     .update(updateNote)
                //     .whenComplete(() {
                //       Navigator.of(context).pop();
                //     },
                //     );
                  if(note==null){
                      NoteService.addNote(
                        _titleController.text, 
                        _descriptionController.text
                        ).whenComplete(() {
                          Navigator.of(context).pop();
                        });
                  }else{
                NoteService.updateNote(note!['id'],_titleController.text, _descriptionController.text)
                 .whenComplete(() {
                  Navigator.of(context).pop();
                    _titleController.clear();
                    _descriptionController.clear();
                 } );
                  }

                   
                },
                 child: Text(note == null?'add':'Update')),
                 
              ],
            );
  }
}