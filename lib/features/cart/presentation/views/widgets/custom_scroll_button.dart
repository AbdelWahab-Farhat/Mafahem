import 'package:Basera/features/cart/presentation/manager/scroll_cubit/scroll_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomScrollButton extends StatelessWidget {
  final ScrollCubit scrollCubit;

  const CustomScrollButton({
    super.key,
    required this.scrollCubit,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollCubit, ScrollState>(
      builder: (context, state) {
        IconData icon;
        VoidCallback onPressed;
        if (state is ScrollAtTop) {
          icon = Icons.arrow_downward_outlined;
          onPressed = scrollCubit.scrollToBottom;
        } else if (state is ScrollAtBottom) {
          icon = Icons.arrow_upward_outlined;
          onPressed = scrollCubit.scrollToTop;
        } else {
          icon = Icons.arrow_upward_outlined;
          onPressed = scrollCubit.scrollToTop;
        }
        return FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.surface,
          ),
        );
      },
    );
  }
}
