class IconAssets {
  const IconAssets();

  static const String _path = 'assets/icons/';

  String _svg(String name) => '$_path$name.svg';

  String get book => _svg('book');
  String get calendar => _svg('calendar');
  String get profile => _svg('profile');
  String get progress => _svg('progress');
}
