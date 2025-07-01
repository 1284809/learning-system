import 'package:get/get.dart';
import 'package:untitled3/models/product.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isloading = false.obs;
  var products = <Product>[].obs;
  @override
  void onInit() {
    super.onInit();
    getproducts();
  }

  Future getproducts() async {
    try {
      isloading.value = true;
      var url = Uri.parse('https://fakestoreapi.com/products');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        products.value = productFromJson(response.body);
      } else {
        Get.snackbar('error', 'message');
      }
    } catch (e) {
      Get.snackbar('error', '$e');
      print(e);
    } finally {
      isloading.value = false;
    }
  }
}
