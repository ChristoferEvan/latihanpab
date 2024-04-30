


import 'package:flutter/material.dart';
import 'package:notes/services/note_service.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: const NoteList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
          builder:(context){
            return AlertDialog(
              content: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text('Add'),
                  const Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Text('Title: '),
                  ),
                  TextField(controller: _titleController,
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Text('Description: '),
                  ),
                  TextField(controller: _descriptionController,
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
                onPressed: () {
                //  Map<String, dynamic> newNote = new Map<String,dynamic>();
                //  Map<String, dynamic> newNote = {};
                //  newNote['title']=_titleController.text;
                //  newNote['description']=_descriptionController.text;

                 NoteService.addNote(_titleController.text, _descriptionController.text)
                 .whenComplete(() => Navigator.of(context).pop());

                //  FirebaseFirestore.instance
                //     .collection('notes')
                //     .add(newNote)
                //     .whenComplete(() {
                //       Navigator.of(context).pop();
                //     },
                    // );
                    _titleController.clear();
                    _descriptionController.clear();
                },
                 child: const Text('Save')),
                 
              ],
            );
          }
          );
          
        
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoteList extends StatefulWidget {

  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: NoteService.retrieveNotes().asStream(), 
      builder: (context,snapshot){
        if(snapshot.hasError){
          return new Text('Error: ${snapshot.error}');
        }
        switch(snapshot.connectionState){
            case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
        default:
        return ListView(
          padding: const EdgeInsets.only(bottom: 80),
          children: snapshot.data!.docs.map((document){
           
            return Card(

              child: ListTile(
                onTap: () {
                  showDialog(
            context: context,
          builder:(context){
TextEditingController titleController=TextEditingController(text: document['title']);
TextEditingController descriptionController=TextEditingController(text: document['description']);
            return AlertDialog(
              title: const Text('Update Notes'),
              content: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                 
                  Text('Title: '),
                  TextField(
                    controller: titleController,
                    // decoration: InputDecoration(
                      // hintText: document['title']
                      
                    // ),
                  
                  ),
                  Text('Description: '),
                  TextField(
                    controller: descriptionController,
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
                onPressed: () {
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

                NoteService.updateNote(document.id,titleController.text, descriptionController.text)
                 .whenComplete(() => Navigator.of(context).pop());

                    titleController.clear();
                    descriptionController.clear();
                   
                },
                 child: const Text('Update')),
                 
              ],
            );
                },
                  );
                },
                title: Text(document['title']),
                subtitle: Text(document['description']),
                trailing: InkWell(
                  onTap: (){
                   showDialog(
                    context: context,
                    builder: (context){
                      
                     return AlertDialog(
                                   title: const Text('Update Notes'),
                                   content: Text('Apakah anda yakin ingin menghapus data?'),
                                   actions: [
                                     Padding(
                                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                       child: ElevatedButton(
                                       onPressed: () {
                                       Navigator.of(context).pop();  
                                       },
                     child: const Text('No')
                     ),
                                     ),
                     
                                      ElevatedButton(
                                     onPressed: () {
                                     //  Map<String, dynamic> newNote = new Map<String,dynamic>();
                                    
                     
                      // FirebaseFirestore.instance
                      // .collection('notes')
                      // .doc(document.id)
                      // .delete()
                      // .catchError((e){
                      //   print(e);
                      // });
                      //  Navigator.of(context).pop();

                      NoteService.deleteNote(document.id);
                                     
                      
                      
                     
                                     },
                                      child: const Text('Yes')),
                                      
                                   ],
                                 );
                    }
                   );
                  },
                  child:const Padding(
                    padding: EdgeInsets.symmetric(
                     vertical: 10
                    ),
                    child: const Icon(Icons.delete),
                  ) ,
                ),
              )
              );
          }
          ).toList(),
        );
        }
      },
      );
  }
}