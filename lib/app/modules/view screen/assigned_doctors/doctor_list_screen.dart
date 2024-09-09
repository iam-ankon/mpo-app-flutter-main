// doctor_list_screen.dart

import 'package:flutter/material.dart';
import 'doctor_api_service.dart';

import 'doctor_models.dart';

class DoctorListScreen extends StatefulWidget {
  final List<int> doctorIds;

  DoctorListScreen({required this.doctorIds});

  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  late Future<List<Doctor>> futureDoctors;

  @override
  void initState() {
    super.initState();
    // Fetch doctors by their IDs
    futureDoctors = fetchDoctorsByIds(widget.doctorIds);

    print(futureDoctors);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
      ),
      body: FutureBuilder<List<Doctor>>(
        future: futureDoctors,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Doctor>? doctors = snapshot.data;
             print(doctors!.length);
            return ListView.builder(
              itemCount: doctors?.length ?? 0,
              itemBuilder: (context, index) {
                Doctor doctor = doctors![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('http://10.0.2.2:8000${doctor.profilePic}'),
                  ),
                  title: Text('${doctor.email} ${doctor.phoneNumber}'),
                  subtitle: Text(doctor.bio ?? 'No bio available'),
                );
              },
            );
          } else {
            return Center(child: Text('No doctors found'));
          }
        },
      ),
    );
  }
}
