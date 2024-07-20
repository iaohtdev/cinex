import 'package:cinex/core/theme/app_color.dart';
import 'package:cinex/core/theme/app_textstyle.dart';
import 'package:cinex/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';

class SaveMovieScreen extends StatefulWidget {
  const SaveMovieScreen({super.key});

  @override
  State<SaveMovieScreen> createState() => _SaveMovieScreenState();
}

class _SaveMovieScreenState extends State<SaveMovieScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int indexSelected = 0;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: AppColor.darkWhite.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Column(
              children: [
                _tabTitle(),
                Expanded(
                    child: TabBarView(controller: controller, children: [
                  Container(),
                  Container(),
                ]))
              ],
            ),
          ))
        ],
      ),
    );
  }

  TabBar _tabTitle() {
    return TabBar(
        padding: EdgeInsets.only(top: 5),
        controller: controller,
        indicatorColor: AppColor.primaryColor,
        dividerColor: AppColor.darkWhite,
        labelColor: AppColor.primaryColor,
        unselectedLabelStyle: AppTextStyles.textStyle(fontSize: 14),
        labelStyle: AppTextStyles.textStyleBold(fontSize: 14),
        onTap: (index) {
          setState(() {
            indexSelected = index;
          });
        },
        tabs: [
          Tab(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Phim'),
                  AppConstants.width5,
                  Container(
                    height: 13,
                    width: 13,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: indexSelected == 0
                            ? AppColor.primaryColor
                            : Colors.grey),
                    child: Center(
                      child: Text(
                        '${0}',
                        style: AppTextStyles.textStyle(fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Tab(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TV Series',
                  ),
                  AppConstants.width5,
                  Container(
                    height: 13,
                    width: 13,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: indexSelected == 1
                            ? AppColor.primaryColor
                            : Colors.grey),
                    child: Center(
                      child: Text(
                        '${0}',
                        style: AppTextStyles.textStyle(fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]);
  }
}
