import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:revidlytest/common/widgets/post_card_widget.dart';
import 'package:revidlytest/models/post_model.dart';
import 'package:revidlytest/services/database_service.dart';

class OfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DatabaseService _db = DatabaseService();
//    _db.getAllPosts();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50,),
          SpinKitRing(
            color: Colors.orange,
            size: 30,
          ),
          SizedBox(height: 20,),
          Text(
            'Waiting for Connectivity...',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rome'
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _db.getAllPosts(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: offlineFetchedList.length,
                    itemBuilder: (context, index) {
                      return postCard(context, index, offlineFetchedList);
                    },
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: SpinKitRing(color: Colors.orange,)),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
