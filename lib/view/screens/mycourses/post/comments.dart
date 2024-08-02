import 'dart:convert';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../../../core/constant/color.dart';
import '../../../../core/functions/myBack/myBackComment.dart';
import '../../../../util/routes_names.dart';

class Comments extends StatefulWidget {
  final postid;
  const Comments({super.key, this.postid});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  TextEditingController _addcomment = new TextEditingController();
  MyServices myServices = Get.find();
  var id = "";

  Future getcomment() async {
    String url =
        "${AppLink.server}/discussions/comments/?post=${widget.postid}";
    // var data = {"postid": widget.postid};
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    return responsebody;
  }

  Future addComment() async {
    String url = "${AppLink.server}/discussions/ADDcomment/";
    var data = {"text": _addcomment.text, "student": id, "post": widget.postid};
    var response = await http.post(Uri.parse(url), body: data);
    // Get.toNamed(RoutesNames.post);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Comments(postid: widget.postid.toString()),
    ));
  }

  getPref() async {
    setState(() {
      id = myServices.sharedPreferences.getString("id")!;
    });
  }

  @override
  void initState() {
    getPref();
    getcomment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: const Text("Comment")),
      bottomNavigationBar: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: () {
            return myBackComment();
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey))),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_enhance,
                          color: Colors.grey,
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width - 50,
                      child: TextFormField(
                        controller: _addcomment,
                        decoration: InputDecoration(
                          hintText: "  Add Comment Here  ",
                          filled: true,
                          fillColor: Colors.grey[200],
                          suffixIcon: IconButton(
                              onPressed: () {
                                addComment();
                              },
                              icon: const Icon(Icons.send)),
                          contentPadding: const EdgeInsets.all(5),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60),
                              borderSide:
                                  const BorderSide(style: BorderStyle.none)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60),
                              borderSide:
                                  const BorderSide(style: BorderStyle.none)),
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          // CustomTopAppBarCart(
          //   title: 'Comment',
          //   iconBack: () {
          //     Get.back();
          //   },
          // ),
          // Container(
          //   color: Colors.white,
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          // ),

          // Positioned(
          //   bottom: 0,
          //   child: Container(
          //     height: 60,
          //     width: MediaQuery.of(context).size.width,
          //     child: Column(
          //       children: [
          //         Container(
          //           padding: const EdgeInsets.only(top: 5),
          //           decoration: const BoxDecoration(
          //               border: Border(top: BorderSide(color: Colors.grey))),
          //           child: Row(
          //             children: [
          //               IconButton(
          //                   onPressed: () {},
          //                   icon: const Icon(
          //                     Icons.camera_enhance,
          //                     color: Colors.grey,
          //                   )),
          //               Container(
          //                 width: MediaQuery.of(context).size.width - 50,
          //                 child: TextFormField(
          //                   controller: _addcomment,
          //                   decoration: InputDecoration(
          //                     hintText: "  Add Comment Here  ",
          //                     filled: true,
          //                     fillColor: Colors.grey[200],
          //                     suffixIcon: IconButton(
          //                         onPressed: () {
          //                           addComment();
          //                         },
          //                         icon: const Icon(Icons.send)),
          //                     contentPadding: const EdgeInsets.all(5),
          //                     focusedBorder: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(60),
          //                         borderSide: const BorderSide(
          //                             style: BorderStyle.none)),
          //                     enabledBorder: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(60),
          //                         borderSide: const BorderSide(
          //                             style: BorderStyle.none)),
          //                     errorBorder: InputBorder.none,
          //                     disabledBorder: InputBorder.none,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: 50,
          //   child:
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 70),
            height: MediaQuery.of(context).size.height - 70,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: getcomment(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => CommentsList(
                      username: snapshot.data[index]['student']['username'],
                      comment: snapshot.data[index]['text'],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          // ),
        ],
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  final username;
  final comment;
  const CommentsList({super.key, this.username, this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Container(
          margin: const EdgeInsets.only(top: 20), child: Text(username)),
      subtitle: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.grey[100],
          child: Text(comment)),
    );
  }
}
