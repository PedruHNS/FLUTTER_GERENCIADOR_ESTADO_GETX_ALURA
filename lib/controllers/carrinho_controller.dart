import 'package:get/get.dart';
import 'package:panucci_delivery/models/item.dart';

class CarrinhoController extends GetxController {
  final carrinho = <Item>[].obs;
  final totalPrice = 0.0.obs;

  void addItem(Item item) {
    carrinho.add(item);
    calcTotalPrice();
  }

  void removeItem(Item item) {
    carrinho.remove(item);
    calcTotalPrice();
  }

  void calcTotalPrice() {
    totalPrice.value = 0.0;
    for (var item in carrinho) {
      totalPrice.value += item.preco;
    }
  }
}
