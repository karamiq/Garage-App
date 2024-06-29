import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_svg_style.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/config/utils/const_class.dart';
import 'package:Trip/pages/taps_page/components/custom_botton_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GarageRatingPage extends StatelessWidget {
  const GarageRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double ratingFrom = 1;
    double ratingTo = 1;

    void submitRatingTo(double rating) {
      ratingTo = rating;
      print('Rating to: $rating');
    }

    void submitRatingFrom(double rating) {
      ratingFrom = rating;
      print('Rating from: $rating');
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'تقييم الكراج',
      ),
      body: Padding(
        padding: EdgeInsets.all(Insets.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'الخط',
                style: TextStyle(fontSize: CustomFontsTheme.bigSize),
              ),
            ),
            Gap(Insets.exLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'كراج العلاوي',
                      style: TextStyle(fontSize: CustomFontsTheme.bigSize),
                    ),
                    Gap(Insets.small),
                    CustomRatingBar(
                      onRating: submitRatingFrom,
                    )
                  ],
                ),
                Container(
                  height: 100.0,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.secondary,
                    thickness: 1,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'كراج ام قصر',
                      style: TextStyle(fontSize: CustomFontsTheme.bigSize),
                    ),
                    Gap(Insets.small),
                    CustomRatingBar(
                      onRating: submitRatingTo,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomRatingBar extends StatelessWidget {
  CustomRatingBar({super.key, required this.onRating});
  void Function(double) onRating;

  @override
  Widget build(BuildContext context) {
    double rating = 1;

    return RatingBar.builder(
      itemSize: 20,
      unratedColor: Theme.of(context).colorScheme.shadow,
      itemBuilder: (context, index) {
        return SvgPicture.asset(
          index < rating
              ? Assets.assetsIconsFilledStar
              : Assets.assetsIconsStar,
          color: index < rating ? Theme.of(context).colorScheme.primary : null,
        );
      },
      glowColor: Theme.of(context).colorScheme.primary,
      initialRating: rating,
      tapOnlyMode: true,
      direction: Axis.horizontal,
      allowHalfRating: false,
      minRating: 1,
      maxRating: 5,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 3),
      onRatingUpdate: (newRating) {
        rating = newRating;
        onRating(newRating);
      },
    );
  }
}
