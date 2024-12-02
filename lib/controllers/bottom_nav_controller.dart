import 'package:get/get.dart';

class BottomNavController extends GetxController{

RxInt selectedIndex = 0.obs;


void changePage(int index){
  selectedIndex.value = index;
  update();
}



}