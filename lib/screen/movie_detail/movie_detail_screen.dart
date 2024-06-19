import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rate_movie/gen/assets.gen.dart';
import 'package:rate_movie/screen/movie_detail/widgets/header_widgets.dart';
import 'package:rate_movie/screen/movie_detail/widgets/info_movie.dart';
import 'package:rate_movie/utils/components/app_constant.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  final ScrollController _scrollController = ScrollController();
  bool _hasScrolledPastAppBar = false;
  final heightSliverAppbar = 220.0;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final double offset = _scrollController.offset;

      if (offset > heightSliverAppbar && !_hasScrolledPastAppBar) {
        setState(() {
          _hasScrolledPastAppBar = true;
        });
      } else if (offset <= heightSliverAppbar && _hasScrolledPastAppBar) {
        setState(() {
          _hasScrolledPastAppBar = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [_appbar(context)],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          HeaderMovie(),
          InfoMovie(),
        ],
      ),
    );
  }

  Container _appbar(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              Assets.icons.iconArrowLeft,
              color: Colors.white,
            ),
          ),
          if (_hasScrolledPastAppBar)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Avatar: The way of the Water',
                  style: AppTextStyles.l3(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          SvgPicture.asset(
            Assets.icons.iconBookmark,
            color: Colors.white,
            height: 22,
          ),
        ],
      ),
    );
  }
}
