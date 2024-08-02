import 'package:e_learningplatform/binding/initalbinding.dart';
import 'package:e_learningplatform/core/localization/changelocale.dart';
import 'package:e_learningplatform/core/localization/translation.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/changeThemcontrorller.dart';
import 'core/constant/themDarkandMode.dart';
import 'view/screens/bottom_navigtion_menu/bottom_navigtion_menu.dart';
import 'view/screens/mycourses/video_call/home_page_video_call.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleControllere controller = Get.put(LocaleControllere());
    Changetheme co = Get.put(Changetheme(), permanent: true);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      title: 'Flutter Demo',
      theme: co.myServices.sharedPreferences.getBool("dark") != null
          ? ThemeEdite.dark
          : ThemeEdite.light,
      locale: controller.language,
      initialBinding: InitalBindings(),
        getPages: routes,

      // home: BottomNavigtionMenu(),
      //home: const Language(),
      //const Test(),
      // onGenerateRoute: (settings) {
      //   if (settings.name == RoutesNames.courseDetails) {
      //     final args = settings.arguments as CoursesArgument;
      //     return MaterialPageRoute(
      //       builder: (context) => CourseDetails(course: args.course),
      //     );
      //   } else if (settings.name == RoutesNames.checkout) {
      //     final args = settings.arguments as CheckoutArgument;
      //     return MaterialPageRoute(
      //       builder: (context) => CheckoutScreen(
      //           courseList: args.courseList, totalPrice: args.totalPrice),
      //     );
      //   }

      // },
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     LocaleControllere controller = Get.put(LocaleControllere());
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         // useMaterial3: true,
//       ),
//       translations: MyTranslation(),
//       theme: controller.appTheme,
//       locale: controller.language,
//       initialBinding: InitalBindings(),
//       getPages: routes
//       routes: {
//         RoutesNames.intro: (context) => const IntroScreen(),
//         RoutesNames.homePage: (context) =>  HomePage(),
//         RoutesNames.courseHome: (context) => const CourseHome(),
//         RoutesNames.shoppingCart: (context) => const ShoppingCartScreen(),
//         RoutesNames.myCourseList: (context) => const MyCourseList(),
//         RoutesNames.whishlist:(context) => const WhishListScreen(),
//         RoutesNames.accountPage:(context) => const AccountPage(),

//       }
//       ,
//       onGenerateRoute: (settings) {
//         if (settings.name == RoutesNames.courseDetails) {
//           final args = settings.arguments as CoursesArgument;
//           return MaterialPageRoute(
//             builder: (context) => CourseDetails(course: args.course),
//           );
//         } else if (settings.name == RoutesNames.checkout) {
//           final args = settings.arguments as CheckoutArgument;
//           return MaterialPageRoute(
//             builder: (context) => CheckoutScreen(
//                 courseList: args.courseList, totalPrice: args.totalPrice),
//           );
//         }
//       },
//     );
//   }
// }
