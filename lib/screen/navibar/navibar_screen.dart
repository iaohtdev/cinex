import 'package:flutter/material.dart';
import 'package:rate_movie/screen/navibar/widgets/body_cinex.dart';
import 'package:rate_movie/utils/components/app_appbar.dart';

class NavibarCineX extends StatefulWidget {
  const NavibarCineX({super.key});

  @override
  State<NavibarCineX> createState() => _NavibarCineXState();
}

class _NavibarCineXState extends State<NavibarCineX>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: AppAppBar(), body: BodyCineX());
  }
}
