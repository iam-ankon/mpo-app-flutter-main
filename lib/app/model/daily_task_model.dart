class DailyTask {
  final int id;
  final String taskName;
  final String taskDetails;
  final bool isDone;
  final String proofPicture;
  final bool isTargetMoney;
  final int amount;
  final int agent;
  final int doctor;

  DailyTask({
    required this.id,
    required this.taskName,
    required this.taskDetails,
    required this.isDone,
    required this.proofPicture,
    required this.isTargetMoney,
    required this.amount,
    required this.agent,
    required this.doctor,
  });

  // Factory constructor to create a Task from a JSON object
  factory DailyTask.fromJson(Map<String, dynamic> json) {
    return DailyTask(
      id: json['id'],
      taskName: json['task_name'],
      taskDetails: json['task_details'],
      isDone: json['is_done'],
      proofPicture: json['proof_picture'],
      isTargetMoney: json['is_target_money'],
      amount: int.parse(json['amount']),  // Convert amount to int
      agent: json['agent'],
      doctor: json['doctor'],
    );
  }

  // Function to convert a Task object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task_name': taskName,
      'task_details': taskDetails,
      'is_done': isDone,
      'proof_picture': proofPicture,
      'is_target_money': isTargetMoney,
      'amount': amount.toString(),
      'agent': agent,
      'doctor': doctor,
    };
  }
}
