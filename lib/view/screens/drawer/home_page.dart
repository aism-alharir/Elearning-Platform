import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/view/screens/drawer/contacts.dart';
import 'package:e_learningplatform/view/screens/drawer/my_drawer_hader.dart';
import 'package:e_learningplatform/view/screens/drawer/notes.dart';
import 'package:e_learningplatform/view/screens/drawer/about_Us.dart';
import 'package:e_learningplatform/view/screens/drawer/setting/screens/account_screen.dart';
import 'package:e_learningplatform/view/screens/home/course_home.dart';
import 'package:e_learningplatform/view/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.courseHome;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.courseHome) {
      container = const CourseHome();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.aboutUs) {
      container = AboutUs();
    } else if (currentPage == DrawerSections.logout) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = const AccountScreen();
    } else if (currentPage == DrawerSections.profile) {
      container = const Profil();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "CourseHome", Icons.home_outlined,
              currentPage == DrawerSections.courseHome ? true : false),
          // menuItem(2, "Contacts", Icons.people_alt_outlined,
          //     currentPage == DrawerSections.contacts ? true : false),
          // menuItem(3, "quiz", Icons.quiz_outlined,
          //     currentPage == DrawerSections.quiz ? true : false),
          // menuItem(4, "Notes", Icons.notes,
          //     currentPage == DrawerSections.notes ? true : false),
          const Divider(),
          menuItem(2, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(3, "Profile", Icons.manage_accounts_outlined,
              currentPage == DrawerSections.profile ? true : false),
          const Divider(),
          menuItem(4, "Contacts", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(5, "About Us", Icons.feedback_outlined,
              currentPage == DrawerSections.aboutUs ? true : false),
          const Divider(
            height: 3,
            color: AppColor.kSecondColor,
          ),
          const SizedBox(
            height: 185,
          ),
          menuItem(6, "Logout", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.courseHome;
            } else if (id == 2) {
              currentPage = DrawerSections.settings;
            } else if (id == 3) {
              currentPage = DrawerSections.profile;
            } else if (id == 4) {
              currentPage = DrawerSections.contacts;
            } else if (id == 5) {
              currentPage = DrawerSections.aboutUs;
            } else if (id == 6) {
              currentPage = DrawerSections.logout;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  courseHome,
  contacts,
  aboutUs,
  logout,
  settings,
  profile,
}
