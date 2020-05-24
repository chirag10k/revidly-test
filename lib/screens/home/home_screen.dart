import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:revidlytest/common/styles/styles.dart';
import 'package:revidlytest/common/widgets/post_card_widget.dart';
import 'package:revidlytest/models/post_model.dart';
import 'package:revidlytest/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double width;
  double height;
  bool isLoading = false;
  int selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    ApiService apiService = Provider.of<ApiService>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, left: 20.0, right: 20.0, bottom: 10),
            child: Row(
              children: <Widget>[
                Text(
                  'Revidly',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Text(
                  'TRENDING',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: themeGradient),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: (fetchedPostList != null)
                ? FutureBuilder(
                    future: apiService.getPostsFromApi(context),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: fetchedPostList.length,
                          itemBuilder: (context, index) {
                            return postCard(context, index, fetchedPostList);
                          },
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: SpinKitRotatingCircle(
                            color: Colors.orange,
                          )),
                        );
                      }
                    },
                  )
                : Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
          ),
          Container(
            width: width,
            height: 70,
            color: Colors.grey.withOpacity(0.09),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedPage = 1;
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    color: (selectedPage == 1) ? Colors.blueAccent : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedPage = 2;
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: (selectedPage == 2) ? Colors.blueAccent : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedPage = 3;
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    color: (selectedPage == 3) ? Colors.blueAccent : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedPage = 4;
                    });
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: (selectedPage == 4) ? Colors.blueAccent : Colors.grey,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedPage = 5;
                        });
                      },
                      icon: Icon(
                        Icons.person,
                        color: (selectedPage == 5) ? Colors.blueAccent : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
