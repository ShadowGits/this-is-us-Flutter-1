import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thisisus/models/LocationModel.dart';

class LocationCard extends StatelessWidget {
  final VolLoc loc;

  //VolLocBrain brain = VolLocBrain();
  LocationCard(this.loc);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              loc.name,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'afasfas',
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'This is a sample Organisation\' sample '
                  'Volunteering Location that would be deleted on '
                  'pretty soon. Apply as soon as possible.\n ${loc.desc}',
                ),
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: DateFormat('EEE, MMM d, ' 'yyyy')
                              .format(loc.dateStart),
                        ),
                        TextSpan(text: ' to '),
                        TextSpan(
                          text: DateFormat('EEE, MMM d, ' 'yyyy').format(
                            loc.dateEnd,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}