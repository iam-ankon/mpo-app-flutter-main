class Schedule {
  final int id;
  final String pharmacyName;
  final String visitingName;
  final String locationCoords;
  final bool isDone;
  final String proofPicture;
  final int agent;

  Schedule({
    required this.id,
    required this.pharmacyName,
    required this.visitingName,
    required this.locationCoords,
    required this.isDone,
    required this.proofPicture,
    required this.agent,
  });

  // A factory constructor to create a Task from JSON
  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      pharmacyName: json['pharmacy_name'],
      visitingName: json['visiting_name'],
      locationCoords: json['location_coords'],
      isDone: json['is_done'],
      proofPicture: json['proof_picture'],
      agent: json['agent'],
    );
  }
}
