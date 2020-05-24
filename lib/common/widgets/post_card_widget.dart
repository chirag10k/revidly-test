import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:revidlytest/models/post_model.dart';

Widget postCard(BuildContext context, int index, List list) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.only(top: 5,),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.orange,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:  NetworkImage('https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png'/*list[index].image*/),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: <Widget>[
                        Text(list[index].author,),
                        Icon(Icons.arrow_right, color: Colors.grey,),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Row(
                      children: <Widget>[
                        Text(list[index].topic,),
                        Icon(Icons.arrow_right, color: Colors.grey,),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Text(
                list[index].description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 400,
          color: Colors.grey[300],
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl: 'https://images.unsplash.com/photo-1561409861-0b6a5a1ecb36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',//list[index].image,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_upward, color: Colors.green,),
                    onPressed: (){},
                  ),
                  Text(
                    list[index].upvotes.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5,),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_downward, color: Colors.red,),
                    onPressed: (){},
                  ),
                  Text(
                    list[index].downvotes.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5,),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.insert_comment, color: Colors.red,),
                    onPressed: (){},
                  ),
                  Text(
                    list[index].comments.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.share, size: 20, color: Colors.grey,),
                    onPressed: (){},
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Spacer(),
              Text(
                'Swipe right to comment',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    ),
  );
}