
import 'package:Trip/config/utils/const_class.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'shimmer_container.dart';

class CustomRowSkeleton extends StatelessWidget {
  const CustomRowSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerContainer(
     child: ListTile(
     trailing: ShimmerContainer(width: 40,height: 40,),
     leading: ShimmerContainer(width: 40,height: 40,),
     title: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         ShimmerContainer(width: 90, height: 20,),
         Gap(Insets.medium),
         ShimmerContainer(width: 100, height: 20,),
       ],
     ),
     
    ), width: double.infinity);
  }
}
