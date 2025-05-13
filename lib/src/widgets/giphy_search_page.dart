import 'package:flutter/material.dart';
import 'package:giphyGif/src/widgets/giphy_context.dart';
import 'package:giphyGif/src/widgets/giphy_search_view.dart';

/// The giphy search page.
class GiphySearchPage extends StatelessWidget {
  final Widget? title;
  final Color? appBarColor;

  const GiphySearchPage({super.key, this.title, this.appBarColor});

  @override
  Widget build(BuildContext context) {
    final giphy = GiphyContext.of(context);

    print("appBarColor search page ${appBarColor}");
    return Scaffold(
      appBar:
          giphy.appBarBuilder(context, title: title, appBarColor: appBarColor),
      body: SafeArea(
        bottom: giphy.showGiphyAttribution,
        child: GiphySearchView(
          appBarColor: appBarColor,
        ),
      ),
    );
  }
}
