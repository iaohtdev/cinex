import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/presentation/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinex/data/models/models.dart';
import 'package:cinex/domain/enum/genres_enum.dart';
import 'package:cinex/presentation/views/home/widgets/movie_item.dart';
import 'package:cinex/utils/constants/app_constant.dart';
import 'package:cinex/core/theme/app_color.dart';
import 'package:cinex/core/theme/app_textstyle.dart';

class TypeMovie extends StatefulWidget {
  const TypeMovie({super.key});

  @override
  State<TypeMovie> createState() => _TypeMovieState();
}

class _TypeMovieState extends State<TypeMovie> with TickerProviderStateMixin {
  late TabController controller;
  Map<GenresType, List<MovieModel>?> movies = {};

  @override
  void initState() {
    super.initState();
    controller = TabController(length: GenresType.values.length, vsync: this);
    controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    controller.removeListener(_handleTabSelection);
    controller.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (controller.indexIsChanging) {
      setState(() {});
    }
  }

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
            tabs: GenresType.values
                .map((e) => Tab(
                      height: 30,
                      text: e.name,
                    ))
                .toList(),
          ),
          AppConstants.height14,
          Expanded(
            child: BlocBuilder<DiscoverCubit, DiscoverState>(
              builder: (context, state) {
                if (state is DiscoverLoading) {
                  return const AppShimmer();
                } else if (state is DiscoverLoaded) {
                  movies = {
                    GenresType.action: state.action,
                    GenresType.anime: state.anime,
                    GenresType.comedy: state.comedy,
                    GenresType.horror: state.horror,
                    GenresType.drama: state.drama,
                    GenresType.thriller: state.thriller,
                  };

                  return TabBarView(
                    controller: controller,
                    children: GenresType.values.map(
                      (e) {
                        return MovieTabItem(
                          lst: movies[e] ?? [],
                        );
                      },
                    ).toList(),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
