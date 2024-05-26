import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rate_movie/gen/assets.gen.dart';
import 'package:rate_movie/utils/components/app_constant.dart';
import 'package:rate_movie/utils/style/app_color.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.pHorizontal),
        child: Column(
          children: [
            Text(
              'Xem thông tin mọi bộ phim bạn muốn!',
              style: AppTextStyles.l2(),
            ),
            AppConstants.height20,
            Container(
              padding:
                  const EdgeInsets.only(left: 20, right: 3, top: 3, bottom: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.darkWhite,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tìm kiếm',
                    style: AppTextStyles.textStyle(
                        fontSize: 14, color: Colors.grey),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    padding: const EdgeInsets.all(13),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      Assets.icons.iconSearch,
                      color: AppColor.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            AppConstants.height20,
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 3,
              child: Column(
                children: [
                  TabBar(
                      controller: controller,
                      indicatorColor: AppColor.primaryColor,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      indicatorPadding: const EdgeInsets.only(right: 20),
                      labelPadding: const EdgeInsets.only(right: 30),
                      dividerColor: Colors.transparent,
                      labelColor: AppColor.primaryColor,
                      unselectedLabelStyle:
                          AppTextStyles.textStyle(fontSize: 16),
                      labelStyle: AppTextStyles.textStyleBold(fontSize: 16),
                      tabs: titleTabar
                          .map((e) => Tab(
                                height: 30,
                                text: e,
                              ))
                          .toList()),
                  AppConstants.height10,
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      children: lstTab,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> titleTabar = [
    'Hài hước',
    'Trinh Thám',
    'Viễn tưởng',
    'Hài hước',
    'Trinh Thám',
    'Viễn tưởng',
  ];

  List<Widget> lstTab = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];
}
