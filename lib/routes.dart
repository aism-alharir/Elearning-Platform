import 'package:e_learningplatform/core/middleawer/mymiddleawer.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:e_learningplatform/view/screens/account/account.dart';
import 'package:e_learningplatform/view/screens/auth/forgetpassword/checkemail.dart';
import 'package:e_learningplatform/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:e_learningplatform/view/screens/auth/forgetpassword/successresetpassword.dart';
import 'package:e_learningplatform/view/screens/auth/forgetpassword/verfiycode.dart';
import 'package:e_learningplatform/view/screens/auth/login.dart';
import 'package:e_learningplatform/view/screens/auth/signup.dart';
import 'package:e_learningplatform/view/screens/auth/successsignup.dart';
import 'package:e_learningplatform/view/screens/auth/verfiycodesignup.dart';
import 'package:e_learningplatform/view/screens/auth1/Screens/Welcome/welcome_screen.dart';
import 'package:e_learningplatform/view/screens/deteails/course_details.dart';
import 'package:e_learningplatform/view/screens/drawer/home_page.dart';
import 'package:e_learningplatform/view/screens/home/course_home.dart';
import 'package:e_learningplatform/view/screens/items/items.dart';
import 'package:e_learningplatform/view/screens/language.dart';
import 'package:e_learningplatform/view/screens/mycourses/post/comments.dart';
import 'package:e_learningplatform/view/screens/mycourses/post/post.dart';
import 'package:e_learningplatform/view/screens/mycourses/ques_assiment/assiment_list.dart';
import 'package:e_learningplatform/view/screens/mycourses/ques_assiment/mvc_ques_assiment/quize_screen2.dart';
import 'package:e_learningplatform/view/screens/myfavorite/myfavorite.dart';
import 'package:e_learningplatform/view/screens/onboarding/onboarding.dart';
import 'package:e_learningplatform/view/screens/productdetails.dart';
import 'package:e_learningplatform/view/screens/profile/profile.dart';
import 'package:e_learningplatform/view/screens/shopping/checkout_screen.dart';
import 'package:e_learningplatform/view/screens/shopping/shopping_cart_screen.dart';
import 'package:get/get.dart';
import 'view/screens/auth1/Screens/Login/login_screen.dart';
import 'view/screens/auth1/Screens/Signup/signup_screen.dart';
import 'view/screens/bottom_navigtion_menu/bottom_navigtion_menu.dart';
import 'view/screens/disable_vido/vidodiplay/video_Playr_7.dart';
import 'view/screens/mycourses/myCourse1.dart';
import 'view/screens/mycourses/video_call/home_page_video_call.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: RoutesNames.language,
      page: () => const Language(),
      middlewares: [MyMiddleawer()]
     ),
  // GetPage(
  // name: RoutesNames.language,
  // page: () => const Language()),
  //GetPage(name: "/", page: () =>const Cart()),
  //onBoarding
  GetPage(name: RoutesNames.onBoarding, page: () => const OnBoarding()),
  GetPage(name: RoutesNames.homePage, page: () => HomePage()),

  // auth
  GetPage(
    name: RoutesNames.welcomeScreen,
    page: () => WelcomeScreen(),
  ),
  GetPage(
    name: RoutesNames.login,
    page: () => Login(),
  ),
  GetPage(
    name: RoutesNames.singUp,
    page: () => const SignUp(),
  ),
  GetPage(name: RoutesNames.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: RoutesNames.verIfyCode, page: () => const VerFiyCode()),
  GetPage(
      name: RoutesNames.verFiyCodeSignUp, page: () => const VerFiyCodeSignUp()),
  GetPage(name: RoutesNames.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: RoutesNames.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: RoutesNames.successSignUp, page: () => const SuccessSignUp()),

  //===================//
  GetPage(
    name: RoutesNames.courseHome,
    page: () => const BottomNavigtionMenu(),
  ),
  GetPage(
    name: RoutesNames.courseHome,
    page: () => const CourseHome(),
  ),
  GetPage(name: RoutesNames.items, page: () => const Items()),
  GetPage(
    name: RoutesNames.courseDetails,
    page: () => const CourseDetails(),
  ),
  GetPage(
    name: RoutesNames.productDetails,
    page: () => const ProductDetails(),
  ),

  GetPage(
    name: RoutesNames.shoppingCart,
    page: () => const ShoppingCartScreen(),
  ),
  GetPage(
    name: RoutesNames.myCourseList,
    page: () => MyCourse1List(),

    //  MyCourseList(),
  ),
  // GetPage(name: RoutesNames.homeVideoCall, page: () =>  HomeVideoCall()),
  // GetPage(name: RoutesNames.myFavorite, page: () => const MyFavorite()),
  GetPage(name: RoutesNames.whishlist, page: () => const MyFavorite()),

  // GetPage(
  //   name: RoutesNames.whishlist,
  //   page: () => const WhishListScreen(),
  // ),
  GetPage(
    name: RoutesNames.accountPage,
    page: () => const AccountPage(),
  ),
  GetPage(
    name: RoutesNames.checkout,
    page: () => const CheckoutScreen(),
  ),
  // GetPage(
  //   name: RoutesNames.video,
  //   page: () => const VideoPlayerPage(),
  // ),
  GetPage(
    name: RoutesNames.video,
    page: () => LessonList(),
  ),

  // post and comment
  GetPage(name: RoutesNames.comment, page: () => const Comments()),
  GetPage(name: RoutesNames.post, page: () => const Post()),

  // quiz and assiment
  GetPage(name: RoutesNames.assimentlist, page: () => const AssimentList()),
  GetPage(name: RoutesNames.quizscrren, page: () => QuizView()),

  // profile
  GetPage(name: RoutesNames.profile, page: () => const Profil()),

//   //HOmePage
//   GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
//   GetPage(name: AppRoutes.items, page: () => const Items()),
//   GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),
//   GetPage(name: AppRoutes.myFavorite, page: () => const MyFavorite()),
//   GetPage(name: AppRoutes.cart, page: () => const Cart()),
//   //Address
//   GetPage(name: AppRoutes.addressView, page: () => const AddressView()),
//   GetPage(name: AppRoutes.addressAdd, page: () => const AddressAdd()),
];
