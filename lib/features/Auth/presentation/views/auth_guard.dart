import 'dart:async';
import 'package:Mafaheem/features/root/presentation/views/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Mafaheem/features/Auth/presentation/manager/token/token_cubit.dart';
import 'package:Mafaheem/features/Auth/presentation/views/login_view.dart';
import 'package:Mafaheem/features/splash/presentation/views/splash_view.dart';

class AuthGuard extends StatefulWidget {
  const AuthGuard({super.key});

  @override
  State<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends State<AuthGuard> {
  @override
  void initState() {
    super.initState();
    _delaySplashScreen();
  }

  Future<void> _delaySplashScreen() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    context.read<TokenCubit>().userAuthChangeState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokenCubit, TokenState>(
      builder: _buildView,
    );
  }

  Widget _buildView(BuildContext context, TokenState state) {
    if (state is TokenLoading) {
      return const SplashView();
    } else if (state is TokenAuthenticated) {
      return const RootView();
    } else if (state is TokenUnauthenticated) {
      return const LoginView();
    } else {
      return const SplashView();
    }
  }
}
