double secondsForPrice(double price, double hourlyWage) {
  return price * 3600.0 / hourlyWage;
}

Map<String, int> breakdownSeconds(int totalSeconds) {
  final days = totalSeconds ~/ (8 * 3600);
  var rem = totalSeconds % (8 * 3600);
  final hours = rem ~/ 3600;
  rem = rem % 3600;
  final minutes = rem ~/ 60;
  final seconds = rem % 60;
  return {
    'days': days,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds,
  };
}

String humanReadableFromSeconds(double seconds) {
  final total = seconds.round();
  final b = breakdownSeconds(total);
  final parts = <String>[];
  if (b['days']! > 0) parts.add('${b['days']}d');
  if (b['hours']! > 0) parts.add('${b['hours']}h');
  if (b['minutes']! > 0) parts.add('${b['minutes']}m');
  if (b['seconds']! > 0 || parts.isEmpty) parts.add('${b['seconds']}s');
  return parts.join(' ');
}
