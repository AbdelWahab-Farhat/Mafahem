import 'package:Mafaheem/core/utility/size_config.dart';
import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/core/widgets/custom_empty_state_widget.dart';
import 'package:Mafaheem/features/search/manager/search_cubit/search_cubit.dart';
import 'package:Mafaheem/features/search/views/widgets/search_grid_item.dart';
import 'package:Mafaheem/features/search/views/widgets/search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'البحث'),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(bottom: 5),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const SearchSection(),
              const SizedBox(height: 20),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchSuccess) {
                    return Expanded(
                      child: GridView.builder(

                        padding: const EdgeInsets.only(bottom: 16),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 2 / 4.18,
                        ),
                        itemCount: state.courses.length,
                        itemBuilder: (context, index) {
                          return SearchGridItem(
                            course: state.courses[index],
                          );
                        },
                      ),
                    );
                  } else if (state is SearchFailure) {
                    return CustomEmptyStateWidget(
                        title: 'حدث خطأ',
                        subTitle: state.errMessage,
                        image: Image.asset('lib/assets/images/Box.png')
                    );
                  }
                  else if (state is SearchEmpty) {
                    // TODO :CHANGE THE IMAGE LATER
                    return Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: CustomEmptyStateWidget(
                            title: 'اســف ياعزيزي',
                            subTitle: 'لا توجد نتائج للبحث',
                            image: Image.asset('lib/assets/images/Box.png',)),
                      ),
                    );
                  }
                  else {
                    return loadingSearchShimmer();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget loadingSearchShimmer() {
  return Expanded(
    child: GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2 / 4.18,
      ),
      itemCount: 8, // Show shimmer placeholders
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
        );
      },
    ),
  );
}
