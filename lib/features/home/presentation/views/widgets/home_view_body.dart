import 'package:Basera/core/widgets/custom_search_field.dart';
import 'package:Basera/features/home/presentation/views/widgets/custom_carouse_slider.dart';
import 'package:Basera/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
            child: CustomSearchField(hintText: 'ابحث..',icon: Container(
             decoration:  const BoxDecoration(
               color: Colors.black,
               shape: BoxShape.circle,
             ),
                child: const Icon(Icons.search ,color: Colors.white,size: 15,)),),
          ),
          const SizedBox(height: 24,),
          const CustomCarouseSlider()

        ],
      ),
    );
  }
}


