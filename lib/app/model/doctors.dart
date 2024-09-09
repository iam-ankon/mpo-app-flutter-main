class Doctors {
  final int id;
  final String invoiceNo;
  final String date;
  final double saleAmount;
  final String location;
  final String locationCoords;
  final int agent;
  final int doctorName;

  Doctors({
    required this.id,
    required this.invoiceNo,
    required this.date,
    required this.saleAmount,
    required this.location,
    required this.locationCoords,
    required this.agent,
    required this.doctorName,
  });

  // Factory constructor to create a SaleRecord from a JSON object
  factory Doctors.fromJson(Map<String, dynamic> json) {
    return Doctors(
      id: json['id'],
      invoiceNo: json['invoice_No'],
      date: json['date'],
      saleAmount: json['sale_amount'].toDouble(), // Ensuring it's a double
      location: json['location'],
      locationCoords: json['location_coords'],
      agent: json['agent'],
      doctorName: json['doctor_name'],
    );
  }

  // Function to convert a SaleRecord object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'invoice_No': invoiceNo,
      'date': date,
      'sale_amount': saleAmount,
      'location': location,
      'location_coords': locationCoords,
      'agent': agent,
      'doctor_name': doctorName,
    };
  }
}
