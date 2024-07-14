import 'package:cinex/features/cinex/presentation/cubits/cubits.dart';
import 'package:cinex/gen/assets.gen.dart';
import 'package:cinex/features/cinex/presentation/screen/search/tab/search_cast_tab.dart';
import 'package:cinex/features/cinex/presentation/screen/search/tab/search_movie_tab.dart';
import 'package:cinex/utils/common/app_common.dart';
import 'package:cinex/utils/components/app_constant.dart';
import 'package:cinex/core/theme/app_color.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
import 'package:cinex/features/cinex/presentation/widgets/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  final searchController = TextEditingController();
  late TabController controller;
  late SearchCubit _searchCubit;
  int indexSelected = 0;
  @override
  void initState() {
    super.initState();
    _searchCubit = context.read<SearchCubit>();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => AppCommon.unfocus(),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.pHorizontal),
        child: Column(
          children: [
            AppConstants.height10,
            _search(),
            AppConstants.height20,
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return AppLoading();
                  } else if (state is SearchError) {
                    return Text(
                      'Hệ thống bận',
                      style: AppTextStyles.textStyle(),
                    );
                  } else if (state is SearchLoaded) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColor.darkWhite.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                      child: Column(
                        children: [
                          _tabTitle(state),
                          Expanded(
                              child:
                                  TabBarView(controller: controller, children: [
                            SearchMovieTab(
                              movies: state.movies,
                            ),
                            SearchMovieTab(
                              movies: state.tv,
                            ),
                            SearchCastTab(
                              casts: state.casts,
                            ),
                          ]))
                        ],
                      ),
                    );
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text(
                      'Tìm kiếm thông tin của Phim, TV series và diễn viên',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyle(
                          fontSize: 16, color: AppColor.darkWhite),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  TabBar _tabTitle(SearchLoaded state) {
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
                        '${state.movies.length}',
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
                        '${state.tv.length}',
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
                  Text('Cast'),
                  AppConstants.width5,
                  Container(
                    height: 13,
                    width: 13,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: indexSelected == 2
                            ? AppColor.primaryColor
                            : Colors.grey),
                    child: Center(
                      child: Text(
                        '${state.casts.length}',
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

  Row _search() {
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder<TextEditingValue>(
            valueListenable: searchController,
            builder: (context, value, child) {
              bool showCancelButton = value.text.isNotEmpty;
              return Row(
                children: [
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.only(
                          left: 20, right: 3, top: 3, bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.darkWhite.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              style: AppTextStyles.textStyle(
                                  color: Colors.white, fontSize: 14),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(right: 12),
                                  border: InputBorder.none,
                                  hintStyle: AppTextStyles.textStyle(
                                      color: AppColor.darkWhite, fontSize: 14),
                                  hintText:
                                      'Tên phim, diễn viên, tv series...'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              AppCommon.unfocus();
                              _searchCubit.search(query: searchController.text);
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: SvgPicture.asset(
                                Assets.icons.iconSearch,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: showCancelButton ? 45 : 0,
                    child: IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
