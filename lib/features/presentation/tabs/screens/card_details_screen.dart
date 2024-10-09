import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/helpers/date_formate.dart';
import 'package:news_app/core/utils/widget/color_manger.dart';
import 'package:news_app/core/utils/widget/custom_shimmer.dart';
import 'package:news_app/features/presentation/home/data/models/news_models.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({super.key, required this.article});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(color: theme.primaryColor),
        ),
        forceMaterialTransparency: true,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: theme.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: SizedBox(
                height: 220,
                width: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) => const CustomShimmer(),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/error_image.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: theme.primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  article.source!.name!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorManger.kgrey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.description!,
              style: const TextStyle(fontSize: 15),
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  formatDate(article.publishedAt!),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManger.kgrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
