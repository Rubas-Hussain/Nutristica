import 'package:get/get.dart';
import 'package:nutritionist_app/screens/home/home_screen.dart';
import 'package:nutritionist_app/screens/explore_more/explore_more_screen.dart';
import 'package:nutritionist_app/screens/progress/progress_screen.dart';
import '../screens/ai/ai_screen.dart';

class NavigationController extends GetxController{
  RxInt selectedIndex=0.obs;
  List screens=[
    HomeScreen(),
    ProgressScreen(),
    AIScreen(),
    MoreScreen()
  ];
}
