import 'package:e_learningplatform/core/class/crud.dart';
import 'package:e_learningplatform/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  checkout(
    String priceOrders,
    String paymentMethod,
    String id,
    String courseid,
  ) async {
    var response = await crud.postData(AppLink.checkout, {
      "amount": priceOrders.toString(),
      "payment_method": paymentMethod.toString(),
      "student": id.toString(),
      "course": courseid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
