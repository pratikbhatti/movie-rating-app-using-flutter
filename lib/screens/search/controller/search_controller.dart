import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TextEditingController name = TextEditingController();
  RxString search = "".obs;
}
