part of 'scroll_cubit.dart';

@immutable
sealed class ScrollState {}


final class ScrollAtTop extends ScrollState {}

final class ScrollAtBottom extends ScrollState {}

final class ScrollOnChange extends ScrollState {}