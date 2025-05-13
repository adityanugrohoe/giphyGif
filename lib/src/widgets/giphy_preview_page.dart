import 'package:flutter/material.dart';
import 'package:giphyGif/src/model/giphy_client.dart';
import 'package:giphyGif/src/widgets/giphy_context.dart';
import 'package:giphyGif/src/widgets/giphy_image.dart';

/// Presents a Giphy preview image.
class GiphyPreviewPage extends StatelessWidget {
  final GiphyGif gif;
  final Widget? title;
  final Color? appBarColor;
  final AppBarBuilder appBarBuilder;
  final bool showGiphyAttribution;
  final ValueChanged<GiphyGif>? onSelected;

  const GiphyPreviewPage(
      {super.key,
      required this.gif,
      this.title,
      this.appBarColor,
      required this.appBarBuilder,
      this.showGiphyAttribution = true,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    print("appBarColor ${appBarColor}");
    return Scaffold(
        appBar: appBarBuilder(context,
            title: title,
            appBarColor: appBarColor,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () => onSelected?.call(gif))
            ]),
        body: SafeArea(
          bottom: false,
          child: Center(
              child: GiphyImage.original(
            gif: gif,
            width: media.orientation == Orientation.portrait
                ? double.maxFinite
                : null,
            height: media.orientation == Orientation.landscape
                ? double.maxFinite
                : null,
            fit: BoxFit.contain,
            showGiphyAttribution: showGiphyAttribution,
          )),
        ));
  }
}
