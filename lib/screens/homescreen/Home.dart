// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:instagram/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Instagram")),
        body: Column(
          children: [
            TopCard(),
            SizedBox(
              height: 10,
            ),
            InstaCard(),
          ],
        ));
  }
}

class TopCard extends StatelessWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70), color: Colors.white),
            child: Icon(Icons.person, color: Colors.black),
          ),
          Icon(Icons.message)
        ],
      ),
    );
  }
}

class InstaCard extends StatelessWidget {
  const InstaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Row(children: [
                Icon(Icons.three_k_plus)
              ],),
             Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/car.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
              ),
              height: 230,
              width: double.infinity,
              child: Column(
                children: [
                  // Text("data")
                ],
              )),
         Icon(Icons.heart_broken,color: Colors.transparent,size: 80.0),
          ],),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Mike Ross"),
                       Icon(
                    Icons.heart_broken,
                    color: Colors.red,
                  ),
                    ],
                  ),
                 Icon(Icons.share)
                  
                ],
              ),
              SizedBox(height: 8,),
              Text(" 300 comments", style: TextStyle(color: Colors.grey[300], fontSize: 10.0),)
            ],
          )
        ],
      ),
    );
  }
}
