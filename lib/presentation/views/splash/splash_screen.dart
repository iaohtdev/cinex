import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:cinex/gen/assets.gen.dart';
import 'package:cinex/core/router/app_routes.dart';
import 'package:cinex/presentation/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() {
    final moviesCubit = context.read<MoviesCubit>();
    final discoverCubit = context.read<DiscoverCubit>();
    final tvCubit = context.read<TVCubit>();

    Future.wait([
      moviesCubit.fetchMovie(),
      discoverCubit.fetchMovieByQuery(),
      tvCubit.fetchTV()
    ]).then((_) {
      Navigator.pushReplacementNamed(context, Routes.navibarCineX);
    }).catchError((error) {
      AppSnackBar.errorBar(context, title: error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(Assets.images.logoGif.path)),
    );
  }
}
