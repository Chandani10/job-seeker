import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:job_seeker/constants/app_colors.dart';
import 'package:job_seeker/features/jobs/domain/jobs_model/job_response_model.dart';
import 'package:job_seeker/features/jobs/presentation/controllers/my_jobs_controller.dart';
import 'package:job_seeker/features/jobs/presentation/screens/job_detail_page.dart';
import 'package:job_seeker/widgets/common_widgets.dart';

class MyJobsList extends ConsumerStatefulWidget {
  const MyJobsList({Key? key}) : super(key: key);

  @override
  ConsumerState<MyJobsList> createState() => _MyJobsListState();
}

class _MyJobsListState extends ConsumerState<MyJobsList>  {

  @override
  void initState() {
    super.initState();
    ref.read(jobStateController.notifier).getCurrentLocation();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: switchButtonsView(),
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: appColor,centerTitle: true,
      elevation: 0,
        title: textWidget(title: 'Jobs',textColor: whiteColor,fontSize:25,fontWeight: FontWeight.w700),
      ),
      body: ref.watch(jobStateController.select((value) => value.isMapView)) == true ? _jobMapView():_jobListView(),
    );
  }


/*============================================job List View=====================================*/
  Widget _jobListView(){
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final position = ref.watch(jobStateController.select((value) => value.currentLocation));
        return (position == null ) ?loadingWidget():ref.watch(jobListAPIController(position)).when(data: (jobList)=> ListView.builder(
          padding: const EdgeInsets.only(bottom: 70),
          shrinkWrap: true,
          itemCount: jobList.length,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final JobModel jobModel = jobList[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  JobDetailPage(jobModel:jobModel )));
              },
              child: Container(
                decoration:  BoxDecoration(
                    color:whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: greyColor)
                ),
                margin: const EdgeInsets.only(top: 20,left: 10,right: 10,),
                padding: const EdgeInsets.all(18),
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: textWidget(
                            title: jobModel.title, textColor: blackColor,fontWeight: FontWeight.w700,fontSize: 22)),
                        const Icon(Icons.bookmark_border,color: appColor,size: 30,),
                      ],
                    ),
                    2.ph,
                    textWidget(title: jobModel.location, textColor: blackColor,fontWeight: FontWeight.w500,fontSize: 20),
                    2.ph,
                    const Divider(color: greyColor,thickness: 1.5,),
                    2.ph,
                    Row(
                      children: [
                        Expanded(child: textWidget(title: jobModel.jobProviderName, textColor: blackColor,fontWeight: FontWeight.w500,fontSize: 20)),
                        3.pw,
                        ElevatedButton(

                          onPressed: (){},style: ElevatedButton.styleFrom(
                            elevation: 1,
                            shape: const StadiumBorder(),
                            backgroundColor: buttonColor
                        ), child:  textWidget(title: jobModel.jobType == 1 ?'Part-Time':'Full-Time',fontSize: 15,fontWeight: FontWeight.w700),),
                        10.pw,
                        textWidget(title: '${jobModel.currency.toString() == 'INR' ? 'INR' : "\$"} ${jobModel.salary}/Month', textColor: blackColor,fontWeight: FontWeight.w700,fontSize: 18),
                      ],
                    ),
                  ],),
              ),
            );
          },
        ), error: (error,_)=> errorWidget(), loading: ()=> loadingWidget());

      },
    );
  }

  Widget _jobMapView(){
    return  Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      LatLng? position = ref.watch(jobStateController.select((value) => value.currentLocation));

      return  position == null ?loadingWidget() :ref.watch(jobListAPIController(position)).when(
        data: (jobs) {
          return GoogleMap(
            initialCameraPosition:  CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 6,
            ),
            markers: Set<Marker>.from(
              jobs.values.map((job) {
                return Marker(
                  markerId: MarkerId(job.title),
                  position: LatLng(double.parse(job.lat), double.parse(job.lng)),
                  infoWindow: InfoWindow(title: job.title,snippet: job.jobProviderName  ),
                );
              }),
            ),
          );
        },
          error: (error,_)=> errorWidget(), loading: ()=> loadingWidget()

      );
    },);
  }

/*============================================switch Buttons View====================================*/

  Widget switchButtonsView(){
    return Consumer(

      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final controller = ref.watch(jobStateController.notifier);
        final isMapView = ref.watch(jobStateController.select((value) => value.isMapView));
        return Container(
          decoration:  BoxDecoration(
              color:whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: greyColor)
          ),
          width: MediaQuery.of(context).size.width/1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: InkWell(
                onTap: (){
                if  (isMapView == false) {
                  ref.invalidate(jobListAPIController);

                  controller.setDefaultView(true);
                }},
                child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(5),
                    decoration:  BoxDecoration(
                      color: isMapView == true ? appColor : whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: textWidget(title: 'Map View',fontSize: 18, fontWeight: FontWeight.w700,textColor: isMapView == true ?whiteColor : appColor)),
              )),
              Flexible(child: InkWell(
                onTap: (){
                 if( isMapView == true) {
                   ref.invalidate(jobListAPIController);
                   controller.setDefaultView(false);
                 }
                },
                child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(5),
                    decoration:  BoxDecoration(
                      color: isMapView == true ? whiteColor : appColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: textWidget(title: 'List View',fontSize: 18, fontWeight: FontWeight.w700,textColor: isMapView == true ? appColor : whiteColor)),
              )),
            ],
          ),
        );
      },

    );
  }



  @override
  dispose() {
    super.dispose();

}

}
