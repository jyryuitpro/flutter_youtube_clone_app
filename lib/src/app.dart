import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_youtube_clone_app/controller/app_controller.dart';
import 'package:get/get.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // currentIndex update를 하기 위해서 Obx 사용
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          // currentIndex: 0,
          currentIndex: controller.currentIndex.value,
          // onTap: (index) {
          //   print(index);

          // ===== 첫번째 방법
          // AppController.to.changePageIndex(index);

          // ===== extends GetView<AppController> 설정 후 두번째 방법
          // controller.changePageIndex(index);
          // },

          // 같은 인자 값을 넘겨주기때문에 아래와 같이 처리 가능
          onTap: controller.changePageIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/home_off.svg'),
              activeIcon: SvgPicture.asset('assets/svg/icons/home_on.svg'),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/icons/compass_off.svg',
                width: 22,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/icons/compass_on.svg',
                width: 22,
              ),
              label: '탐색',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  'assets/svg/icons/plus.svg',
                  width: 35,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/subs_off.svg'),
              activeIcon: SvgPicture.asset('assets/svg/icons/subs_on.svg'),
              label: '구독',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/library_off.svg'),
              activeIcon: SvgPicture.asset('assets/svg/icons/library_on.svg'),
              label: '보관함',
            ),
          ],
        ),
      ),
    );
  }
}
