import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tomyapp/screens/add_task.dart';
import 'package:tomyapp/screens/description.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = '';

  void initState() {
    getUid();
  }

  getUid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = await auth.currentUser;
    setState(() {
      uid = user!.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaskForge'),
        backgroundColor: Color(0xff31304D),
        actions: [
          IconButton(
            onPressed: ()async{
              await FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.logout_outlined)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff161A30),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('tasks')
              .doc(uid)
              .collection('mytasks')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: 10.0,
                width: 10.0,
                child: CircularProgressIndicator(),
              );
            } else {
              final docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (BuildContext context, int index) {
                  var time = (docs[index]['timestamp'] as Timestamp)
                      .toDate();
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>Description(
                          title:docs[index]['title'],description: docs[index]['description'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Color(0xff31304D),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  docs[index]['title'],
                                  style: GoogleFonts.roboto(fontSize: 18,color: Color(0xffF0ECE5)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  DateFormat.yMd().add_jm().format(time),
                                  style: GoogleFonts.roboto(color: Color(0xffF0ECE5)),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () async {
                                print('Deleting document with ID: ${docs[index].id}');
                                await FirebaseFirestore.instance
                                    .collection('tasks')
                                    .doc(uid)
                                    .collection('mytasks')
                                    .doc(docs[index].id)
                                    .delete();
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Color(0xffF0ECE5),
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask()));
        },
        backgroundColor: Color(0xffF0ECE5),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
