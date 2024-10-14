part of 'upload_pdf_cubit.dart';

@immutable
sealed class UploadPdfState {}

final class UploadPdfInitial extends UploadPdfState {}

final class UploadPdfLoading extends UploadPdfState {}
final class UploadPdfFailure extends UploadPdfState {
  final String errMessage;

  UploadPdfFailure({required this.errMessage});
}
final class UploadPdfSuccess extends UploadPdfState {}