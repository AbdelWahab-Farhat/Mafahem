import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comment_state.dart';


// TODO DO IT COMMENT VIEW LATER
class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());
}
