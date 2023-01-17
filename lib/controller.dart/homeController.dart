import 'package:get/get.dart';

import '../model/tacModel.dart';

class HomeController extends GetxController {
  RxList<Model> model = <Model>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fun();
  }

  List<String> items = ['', '', '', '', '', '', '', '', ''];
  RxInt playerXScore = 0.obs;
  RxInt playerOScore = 0.obs;
  //
  void fun() {
    var funResult = [
      Model(
        player1: '',
      ),
      Model(
        player1: '',
      ),
      Model(
        player1: '',
      ),
      Model(
        player1: '',
      ),
      Model(
        player1: '',
      ),
      Model(
        player1: '',
      ),
      Model(
        player1: '',
      ),
      Model(
        player1: '',
      ),
      Model(
        player1: '',
      ),
    ];
    model.value = funResult;
  }
}
