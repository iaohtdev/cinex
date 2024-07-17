import 'package:cinex/core/model/movie_model.dart';
import 'package:cinex/core/model/tv_model.dart';
import 'package:cinex/utils/helper/image_helper.dart';
import 'package:flutter/material.dart';

class SimilarWidget extends StatefulWidget {
  final List<TVModel>? tv;
  final List<MovieModel>? movies;

  const SimilarWidget({super.key, this.tv, this.movies});

  @override
  State<SimilarWidget> createState() => _SimilarWidgetState();
}

class _SimilarWidgetState extends State<SimilarWidget> {
  List<dynamic> data = [];

  @override
  void initState() {
    if (widget.tv != null && widget.tv!.isNotEmpty) {
      data = widget.tv ?? [];
    } else if (widget.movies != null && widget.movies!.isNotEmpty) {
      data = widget.movies ?? [];
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Wrap(
        children: List.generate(
          data.length,
          (index) {
            final item = data[index];
            return Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                width: width / 3.5,
                child: Center(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          height: 170,
                          child: ImageHelper.getNetworkImg(
                              imageUrl: item.posterPath),
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ).toList(),
      ),
    );
  }
}
