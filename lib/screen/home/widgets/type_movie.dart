import 'package:flutter/material.dart';
import 'package:rate_movie/screen/home/widgets/movie_item.dart';
import 'package:rate_movie/utils/components/app_constant.dart';
import 'package:rate_movie/utils/style/app_color.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';

class TypeMovie extends StatefulWidget {
  const TypeMovie({
    super.key,
  });

  @override
  State<TypeMovie> createState() => _TypeMovieState();
}

class _TypeMovieState extends State<TypeMovie> with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 6, vsync: this);
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
    ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return MovieItem(
          index: index,
        );
      },
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              unselectedLabelStyle: AppTextStyles.textStyle(fontSize: 16),
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
    );
  }
}
