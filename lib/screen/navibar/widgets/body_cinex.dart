import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rate_movie/gen/assets.gen.dart';
import 'package:rate_movie/screen/home/home_screen.dart';
import 'package:rate_movie/utils/components/app_constant.dart';
import 'package:rate_movie/utils/style/app_color.dart';
import 'package:rate_movie/utils/widgets/custom_bottom_bar.dart';

class BodyCineX extends StatefulWidget {
  const BodyCineX({
    super.key,
  });

  @override
  State<BodyCineX> createState() => _BodyCineXState();
}

class _BodyCineXState extends State<BodyCineX> {
  late PageController _pageController;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppConstants.height20,
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: lstPage,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.black,
        onButtonPressed: onButtonPressed,
        activeColor: AppColor.primaryColor,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            customButton: SvgPicture.asset(
              Assets.icons.iconHome,
              color: Colors.white.withOpacity(0.4),
            ),
            title: 'Trang chủ',
          ),
          BarItem(
            customButton: SvgPicture.asset(
              Assets.icons.iconBookmark,
              color: Colors.white.withOpacity(0.4),
            ),
            title: 'Đã lưu',
          ),
          BarItem(
            customButton: SvgPicture.asset(
              Assets.icons.iconSettings,
              color: Colors.white.withOpacity(0.4),
            ),
            title: 'Cài đặt',
          ),
        ],
      ),
    );
  }

  List<Widget> lstPage = [
    const HomeScreen(),
    Container(
      alignment: Alignment.center,
      child: const Icon(
        Icons.search,
        size: 56,
        color: Colors.brown,
      ),
    ),
    Container(
      alignment: Alignment.center,
      child: const Icon(
        Icons.bolt,
        size: 56,
        color: Colors.brown,
      ),
    ),
  ];
}
