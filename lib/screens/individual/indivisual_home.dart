import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thisisus/components/ind_location_card.dart';
import 'package:thisisus/components/individual_drawer.dart';
import 'package:thisisus/models/LocationModel.dart';
import 'package:thisisus/services/user_repository.dart';

class IndHomeScreen extends StatefulWidget {
  final FirebaseUser user;

  const IndHomeScreen({Key key, this.user}) : super(key: key);

  @override
  _IndHomeScreenState createState() => _IndHomeScreenState();
}

class _IndHomeScreenState extends State<IndHomeScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO: Implement Drawer
    return Scaffold(
      drawer: AppDrawer(
        loggedInUser: widget.user,
        enabled: 'Home',
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Home'),
            FlatButton(
              //Temp Button. Remove when Drawer has been implemented.
              child: Text('Sign Out'),
              onPressed: () {
                Provider.of<UserRepository>(context, listen: false).signOut();
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("VolLocs").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                var location = VolLoc(
                  creator: ds.data["creator"],
                  name: ds.data["name"],
                  contactPhone: ds.data["contact_phone"],
                  contactEmail: ds.data["contact_email"],
                  dateStart: DateTime.parse(
                      (ds.data["dateStart"]).toDate().toString()),
                  dateEnd:
                  DateTime.parse((ds.data["dateEnd"]).toDate().toString()),
                  location: ds.data["location"],
                  desc: ds.data["desc"],
                  id: ds.documentID,
                  dateCreated: DateTime.parse(
                      (ds.data["dateCreated"]).toDate().toString()),
                );
                return IndLocationCard(
                  loc: location,
                  user: widget.user,
                  bottomSheet: 'home',
                );
              },
            );
          }
        },
      ),
    );
  }
}
