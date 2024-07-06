import '../../../components/shimmer_container.dart';
import '../../../config/constant.dart';

class MiniCardShimmer extends StatelessWidget {
  const MiniCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShimmerContainer(
        height: 170,
        width: 160,
        child: Padding(
          padding: EdgeInsets.all(Insets.small),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ShimmerContainer(width: 80),
              ),
              Positioned(
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ShimmerContainer(
                          shape: BoxShape.circle,
                          width: 40,
                          height: 40,
                        ),
                        Gap(Insets.exSmall),
                        ShimmerContainer(width: 50),
                      ],
                    ),
                    ShimmerContainer(shape: BoxShape.circle, width: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
