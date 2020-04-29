import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thisisus/components/org_drawer.dart';
import 'package:thisisus/components/org_location_card.dart';
import 'package:thisisus/models/LocationModel.dart';
import 'package:thisisus/services/user_repository.dart';

class OrgLandingScreen extends StatefulWidget {
  final FirebaseUser user;

  OrgLandingScreen({this.user});

  @override
  _OrgLandingScreenState createState() => _OrgLandingScreenState();
}

class _OrgLandingScreenState extends State<OrgLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        loggedInUser: widget.user,
        enabled: 'Home',
      ),
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Org Home'),
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
        stream: Firestore.instance.collection('VolLocs').snapshots(),
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
                if (location.creator == widget.user.uid) {
                  return OrgLocationCard(
                    loc: location,
                    user: widget.user,
                    bottomSheet: 'home',
                  );
                } else
                  return null;
              },
            );
          }
        },
      ),
    );
  }
}