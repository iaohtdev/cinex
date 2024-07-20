import 'dart:async';

import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/gen/assets.gen.dart';
import 'package:cinex/presentation/views/home/home_screen.dart';
import 'package:cinex/presentation/views/save_movie/save_movie_screen.dart';
import 'package:cinex/presentation/views/search/search_screen.dart';
import 'package:cinex/core/theme/app_color.dart';
import 'package:cinex/presentation/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyCineX extends StatefulWidget {
  const BodyCineX({
    super.key,
  });

  @override
  State<BodyCineX> createState() => _BodyCineXState();
}

class _BodyCineXState extends State<BodyCineX> {
  late PageController _pageController;
  late NaviBarCubit _naviBarCubit;
  late StreamSubscription<int> cubitSubscription;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _naviBarCubit = context.read<NaviBarCubit>();

    cubitSubscription = _naviBarCubit.stream.listen((index) {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuad);
    });
  }

  void onButtonPressed(int index) {
    _naviBarCubit.updateIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NaviBarCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              const SizedBox(height: 20),
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
                  Assets.icons.iconSearch,
                  color: Colors.white.withOpacity(0.4),
                ),
                title: 'Tìm kiếm',
              ),
              BarItem(
                customButton: SvgPicture.asset(
                  Assets.icons.iconBookmark,
                  color: Colors.white.withOpacity(0.4),
                ),
                title: 'Đã lưu',
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> lstPage = [
    const HomeScreen(),
    SearchScreen(),
    SaveMovieScreen()
  ];
}
