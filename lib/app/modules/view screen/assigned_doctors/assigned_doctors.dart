
import 'package:amin_agent/app/data/const/export.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../api services/task/assigned_doctors_task_api.dart';
import '../../../model/assigned_doctors.dart';
import '../../widgets/appbar.dart';
import '../schedule screen/components/schedule_card.dart';
import 'dcotor_cart.dart';
import 'doctor_list_screen.dart';
class AssignedDoctorsScreenView extends StatefulWidget {
  @override
  _AssignedDoctorsScreenViewState createState() => _AssignedDoctorsScreenViewState();
}

class _AssignedDoctorsScreenViewState extends State<AssignedDoctorsScreenView> {
  late Future<List<AssignedDoctors>> futureAssignedDoctors;

  @override
  void initState() {
    super.initState();
    // Fetch the assigned doctors when the widget is initialized
    futureAssignedDoctors = fetchAssignedDoctorData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar: buildSecondaryAppbar('Assigned Doctors'),
      body: FutureBuilder<List<AssignedDoctors>>(
        future: futureAssignedDoctors,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<AssignedDoctors>? assignedDocs = snapshot.data;

            if (assignedDocs == null || assignedDocs.isEmpty) {
              return Center(child: Text('No data found'));
            }

            return ListView.builder(
              itemCount: assignedDocs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoctorListScreen(doctorIds: assignedDocs[index].doctors)));                  },
                  child: DcotorCard(
                    sendTap: () {
                      // Handle send tap
                      print("Send Tap");
                    },
                    doneTap: () {
                      // Handle done tap
                      finisScheduleDialog(context,
                          img: AppImages.doneIcon,
                          title: "Assigned Task",
                          body: 'This visit is done!', yesTap: () {
                        Get.back();
                        takePhotoDialog(context,
                            img: AppImages.cameraSvg,
                            title: 'Like to take a picture?',
                            yesTap: completedLocationTaskDialog);
                      });
                    },
                    image: scheduleList[index].imageUrl,  // Use a default image or modify according to your needs
                    subtitle: 'Total Agents: ${assignedDocs[index].agents.length}',
                    title: 'Total Doctors: ${assignedDocs[index].doctors.length}',
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
