import 'package:get/get.dart';

class CartaoController extends GetxController {
  final unidade = 0.obs;

  get increment => unidade.value++;
  get decrement => unidade.value--;
}
