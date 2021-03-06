import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/Home.dart';
import 'package:mcglynns_food2go/User.dart';
import 'package:mcglynns_food2go/DeliCutomCard.dart';

User loggedInUser = getUser();


final databaseReference = Firestore.instance;
DocumentReference docRef = databaseReference.collection('Cart').document('UID');


class DeliDBA extends StatelessWidget {
  DeliDBA({@required this.collection});
  final collection;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(collection).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:

              snapshot.data.documents.map((DocumentSnapshot document) {
                return new DeliCustomCard(

                  title: document['name'],
                  price: document['price'],
                  inStock: document['inStock'],
                );
              }).toList(),
            );
        }
      },
    );
  }


  void createRecord(
      String userName, List<String> itemName, List itemPrice) async {
    databaseReference
        .collection('Cart')
        .document(userName)
        .updateData({'names': FieldValue.arrayUnion(itemName)});

    databaseReference
        .collection('Cart')
        .document(userName)
        .updateData({'prices': FieldValue.arrayUnion(itemPrice)});
  }
}




class CustomDeliCard extends StatelessWidget {
  CustomDeliCard({@required this.title, this.price, this.uid});

  final uid;
  final title;
  final price;

  User myUser = getUser();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: <Widget>[
                Text(title + "\n Types: " + price.toString()),
              ],
            )));
  }
}

