import 'package:Mafaheem/core/widgets/custom_app_bar.dart';
import 'package:Mafaheem/features/search/views/widgets/search_grid_item.dart';
import 'package:Mafaheem/features/search/views/widgets/search_section.dart';
import 'package:flutter/material.dart';

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
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2 / 4.18,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return  SearchGridItem(index: index,);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
