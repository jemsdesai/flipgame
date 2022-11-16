import 'package:flipgame/testgame.dart';
import 'package:get/get.dart';

class flipController extends GetxController
{
  List<bool>isOpen=List.filled(16, true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    testgame.imgList.shuffle();
    waiting();
  }
  waiting()async{
    await Future.delayed(Duration(seconds: 5));
    isOpen=List.filled(16, false);
    print("wating called");
  }

}