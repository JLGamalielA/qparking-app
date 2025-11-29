import 'package:intl/intl.dart';

class TimeFormat {
  static String secondsToTimeFormat({required totalSeconds}) {
    // Calcular horas, minutos y segundos
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    // Formatear como hh:mm:ss
    // Para asegurar formato 2 dígitos
    final timeFormat = NumberFormat("00");
    return "${timeFormat.format(hours)}:${timeFormat.format(minutes)}:${timeFormat.format(seconds)}";
  }
}
