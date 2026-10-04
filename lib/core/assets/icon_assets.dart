class IconAssets {
  const IconAssets();

  static const String _path = 'assets/icons/';

  String _svg(String name) => '$_path$name.svg';

  String get book => _svg('book');
  String get calendar => _svg('calendar');
  String get chevron => _svg('chevron');
  String get metronome => _svg('metronome');
  String get notes => _svg('notes');
  String get porte => _svg('porte');
  String get profile => _svg('profile');
  String get progress => _svg('progress');
  String get scan => _svg('scan');
  String get settings => _svg('settings');
  String get tuner => _svg('tuner');
}
