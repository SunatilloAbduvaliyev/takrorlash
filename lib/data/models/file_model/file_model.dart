class FileModel {
  final String title;
  final String url;
  final bool isLoading;
  final bool isDownload;
  final String saveUrl;

  FileModel({
    required this.title,
    required this.url,
    this.isLoading = false,
    this.isDownload = false,
    this.saveUrl = '',
  });
}
