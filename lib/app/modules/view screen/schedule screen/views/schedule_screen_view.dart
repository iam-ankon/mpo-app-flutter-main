import 'package:amin_agent/app/model/daily_task_model.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';
import '../components/schedule_card.dart';

class ScheduleScreenView extends GetView<ScheduleScreenController> {
  ScheduleScreenView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ScheduleScreenController());
List<DailyTask> task = [];
 getTask()async {
task = await controller.fetchTaskData();
}

  @override
  Widget build(BuildContext context) {
    // getTask();
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar: buildSecondaryAppbar('Schedule'),
      body: FutureBuilder(
        future: getTask(),
        builder: (context, snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: task.length,
            itemBuilder: (context, index) => ScheduleCard(
              sendTap: () {
                print("awe");
                controller.fetchTaskData();
                // Get.toNamed(RouteName.mapScreen);
              },
              doneTap: () {
                finisScheduleDialog(context,
                    img: AppImages.doneIcon,
                    title:task[index].taskName ,
                    body: 'This visit is done!', yesTap: () {
                  Get.back();
                  takePhotoDialog(context,
                      img: AppImages.cameraSvg,
                      title: 'Like to take a picture?',
                      yesTap: completedLocationTaskDialog);
                });
              },
              image: scheduleList[index].imageUrl,
              subtitle: task[index].taskDetails,
              title: task[index].taskName,
            ),
          );
        }
      ),
    );
  }
}
