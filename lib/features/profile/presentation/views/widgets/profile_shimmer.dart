import 'package:Basera/core/utility/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Placeholder count
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [

                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Placeholder for the title
                      Container(
                        height: 16,
                        width: SizeConfig.screenWidth * 0.6,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Placeholder for the subtitle
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 14,
                        width: SizeConfig.screenWidth * 0.4,
                      ),
                      const SizedBox(height: 8),
                      // Placeholder for the date
                      Container(
                        height: 14,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),                            ),
                    ],
                  ),
                ),
                const SizedBox(width: 16,),
                Container(
                  width: 147,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.yellow[500],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
