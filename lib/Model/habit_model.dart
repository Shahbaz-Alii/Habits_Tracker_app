// this is still not used
class HabitModel{
  final String name;
  final String? note;
  final String? question;
  final bool? isCompleted;
  final DateTime? reminder;
  final String? repeat;

  const HabitModel({
    required this.name,
    this.note,
    this.question,
    this.isCompleted,
    this.reminder,
    this.repeat
  });
}