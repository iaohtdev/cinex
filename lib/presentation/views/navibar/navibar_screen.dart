import 'package:flutter/material.dart';
import 'package:cinex/presentation/views/navibar/widgets/body_cinex.dart';
import 'package:cinex/presentation/widgets/app_appbar.dart';

class NavibarCineX extends StatefulWidget {
  const NavibarCineX({
    super.key,
  });
  @override
  State<NavibarCineX> createState() => _NavibarCineXState();
}

class _NavibarCineXState extends State<NavibarCineX>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppAppBar(),
        body: BodyCineX());
  }
}
