class AssignedDoctors {
  final int id;
  final String createdAt;
  final List<int> agents;
  final List<int> doctors;

  AssignedDoctors({
    required this.id,
    required this.createdAt,
    required this.agents,
    required this.doctors,
  });

  // Factory constructor to create TaskData from a JSON object
  factory AssignedDoctors.fromJson(Map<String, dynamic> json) {
    return AssignedDoctors(
      id: json['id'],
      createdAt: json['created_at'],
      agents: List<int>.from(json['agents']),
      doctors: List<int>.from(json['doctors']),
    );
  }

  // Function to convert a TaskData object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'agents': agents,
      'doctors': doctors,
    };
  }
}
