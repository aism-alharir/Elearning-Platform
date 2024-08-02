import 'dart:convert';

import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/core/functions/myBack/myBackComment.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/linkapi.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:e_learningplatform/view/screens/mycourses/post/comments.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class Post extends StatefulWidget {
  final courseid;
  const Post({super.key, this.courseid});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  List posts = [
    {
      "name": "wael",
      "content":
          "السلام عليكم و رحمة الله و بركاتو اريد ان اشتري جوال نضيف من الشركة المصنعة "
    },
    {
      "name": "aism",
      "content":
          "السلام عليكم و رحمة الله و بركاتو اريد ان اشتري جوال نضيف من الشركة المصنعة "
    }
  ];

  TextEditingController _addpost = new TextEditingController();

  Future getPost() async {
    String url =
        "${AppLink.server}/discussions/posts/?course=${widget.courseid}";
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    return responsebody;
  }

  Future addPost() async {
    String url = "${AppLink.server}/discussions/ADDpost/";
    var data = {
      "text": _addpost.text,
      "student": id,
      "course": widget.courseid.toString()
    };
    var response = await http.post(Uri.parse(url), body: data);
    // Get.toNamed(RoutesNames.post);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Post(courseid: widget.courseid.toString()),
    ));
  }

  MyServices myServices = Get.find();
  var username;
  var email;
  var id = "";

  getPref() async {
    setState(() {
      id = myServices.sharedPreferences.getString("id")!;
      username = myServices.sharedPreferences.getString("username");
      email = myServices.sharedPreferences.getString("email");
    });
  }

  @override
  void initState() {
    getPost();
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: AppColor.kPrimaryColor,
                title: const Text("Post")),
            body: WillPopScope(
              onWillPop: () {
                return myBackPost();
              },
              child: ListView(
                children: [
                  Card(
                      child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: TextFormField(
                          controller: _addpost,
                          minLines: 1,
                          maxLines: 10,
                          maxLength: 255,
                          decoration: InputDecoration(
                              hintText: "  Add Post Here ",
                              contentPadding: const EdgeInsets.only(right: 10),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                addPost();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color:
                                                Colors.grey.withOpacity(0.3)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: const Text(
                                        "اضف منشور",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.grey),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(right: 10)),
                                    const Icon(Icons.add_box,
                                        color: Colors.grey)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
                  FutureBuilder(
                    future: getPost(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            for (int i = snapshot.data.length - 1; i >= 0; i--)
                              PostList(
                                name: snapshot.data[i]["student"]["username"]
                                    .toString(),
                                contentpost:
                                    snapshot.data[i]["text"].toString(),
                                postid: snapshot.data[i]['id'].toString(),
                              ),
                          ],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class PostList extends StatelessWidget {
  final name;
  final contentpost;
  final postid;
  const PostList({super.key, this.name, this.contentpost, this.postid});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Container(
                margin: const EdgeInsets.only(top: 14),
                child: Text(
                  name,
                  style: const TextStyle(color: Colors.blue),
                )),
            trailing: const Icon(Icons.more_vert),
            isThreeLine: true,
            subtitle: Text(contentpost),
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: Colors.grey))),
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: InkWell(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "اعجاب",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.thumb_up, color: Colors.grey)
                    ],
                  ),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Comments(postid: postid),
                    ));
                    // Get.to(Comments(postid: postid,));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("تعليق", textAlign: TextAlign.center),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 5))
        ],
      ),
    );
  }
}
