class AgentTask {
  final int id;
  final String doctorVisitedReport;
  final int totalSales;
  final int totalCommission;
  final String taskStartDate;
  final String taskEndDate;
  final int visitDone;
  final int targetComplete;
  final int agent;

  AgentTask({
    required this.id,
    required this.doctorVisitedReport,
    required this.totalSales,
    required this.totalCommission,
    required this.taskStartDate,
    required this.taskEndDate,
    required this.visitDone,
    required this.targetComplete,
    required this.agent,
  });

  // Factory constructor to create a TaskReport object from JSON
  factory AgentTask.fromJson(Map<String, dynamic> json) {
    return AgentTask(
      id: json['id'],
      doctorVisitedReport: json['doctor_visited_report'],
      totalSales: json['total_sales'],
      totalCommission: json['total_commision'],
      taskStartDate: json['task_start_date'],
      taskEndDate: json['task_end_date'],
      visitDone: json['visit_done'],
      targetComplete: json['target_complete'],
      agent: json['agent'],
    );
  }
}
