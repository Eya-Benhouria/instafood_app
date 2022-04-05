extension ImagePathExtension on String {
  String get toIcon => 'assets/icons/$this.svg';
  String get toImgPng => 'assets/$this.png';
}
