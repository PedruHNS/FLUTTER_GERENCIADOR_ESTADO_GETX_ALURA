import 'package:get/get.dart';
import 'package:panucci_delivery/models/item.dart';

class AppSnackbar {
  static void addItemToCart(Item item) {
    Get.snackbar(
      "Item adicionado ao carrinho",
      item.nome,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void removeItemToCart(Item item) {
    Get.snackbar(
      "Item removido do carrinho",
      item.nome,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void confirmOrder() {
    Get.snackbar(
      "Pedido confirmado",
      "Seu pedido foi confirmado com sucesso!",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
