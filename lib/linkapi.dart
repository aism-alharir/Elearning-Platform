class AppLink {
  static const String server = "http://192.168.12.64:9000";
  // static const String test = "$server/test.php";
  static const String imagesstatic = "http://192.168.12.64:9000/static/";
  //=========Images=============//
  static const String imagesCategories = "$imagesstatic/categories";
  static const String imagesItems = "$imagesstatic/items";

  //===============auth=================//
  static const String signup = "$server/auth/users/";
  static const String login = "$server/accounts/login";

  //===============forgetpassword=================//
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";

  //===============Home=======================//
  static const String hpmePage = "$server/courses/courses/";
  static const String category = "$server/courses/category/";

  //===============items=====================//
  static const String items = "$server/courses/byCategory";
  static const String searchItems = "$server/items/search.php";
  static const String coursesList = "$server/home.php";

  //================checkout==================//
  static const String checkout = "$server/payment/pay/";

  //========= mycourses ==============//
  static const String mycourses = "$server/payment/enrolled";

  //========= video ==============//
  static const String video = "$server/courses/lessons";

  //===============Favorite=================//
  static const String favoriteAdd = "$server/courses/addFavorite/";
  static const String favoriteRemove = "$server/courses/favorites/remove/";
  static const String favoriteView = "$server/courses/Favorite";
  static const String deleteFromeFavorite =
      "$server/courses/favorites/pkremove/";

  //===============Cart=================//
  static const String cartAdd = "$server/cart/add.php";
  static const String cartRemove = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String getCountItems = "$server/cart/getcountitems.php";

  //===============Address=================//
  static const String adressAdd = "$server/address/add.php";
  static const String adressDelete = "$server/address/delete.php";
  static const String adressView = "$server/address/view.php";
  static const String adressEdit = "$server/address/edit.php";
}
