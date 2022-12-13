import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kinoapp/resources/resources.dart';

class MovieDetailsInfoWidget extends StatelessWidget {
  const MovieDetailsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPosters(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
      ],
    );
  }
}

class _TopPosters extends StatelessWidget {
  const _TopPosters({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Image(
          image: AssetImage(AppImages.horizontalAnimeGirls),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: TextSpan(children: [
        TextSpan(
            text: 'Gentle bite+',
            style: TextStyle(fontSize: 20.85, fontWeight: FontWeight.w600)),
        TextSpan(
            text: ' (2012)',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 15.85,
                fontWeight: FontWeight.w600)),
      ]),
    );
  }
}
