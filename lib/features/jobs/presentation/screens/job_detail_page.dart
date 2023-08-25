import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_seeker/constants/app_colors.dart';
import 'package:job_seeker/features/jobs/domain/jobs_model/job_response_model.dart';
import 'package:job_seeker/widgets/common_widgets.dart';

class JobDetailPage extends ConsumerStatefulWidget {
  final JobModel? jobModel;

  const JobDetailPage({super.key,this.jobModel});

  @override
  ConsumerState<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends ConsumerState<JobDetailPage> {
  JobModel? jobModel;

  @override
  void initState() {
    if(widget.jobModel != null){
      jobModel = widget.jobModel;
    }
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: appColor,centerTitle: true,
        elevation: 0,
        title: textWidget(title: 'Job Detail',textColor: whiteColor,fontSize:25,fontWeight: FontWeight.w700),
      ),
      body: bodyView(),
    );
  }

  Widget bodyView(){
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      color: whiteColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
                title: "Title : ${jobModel?.title}", textColor: blackColor,fontWeight: FontWeight.w500,fontSize: 20),
            2.ph,
            textWidget(title: "Location :  ${jobModel?.location}",maxLines: 3, textColor: blackColor,fontWeight: FontWeight.w500,fontSize: 20),
            2.ph,
            textWidget(title: "Job Provider Name : ${jobModel?.jobProviderName}",maxLines: 2,
                textColor: blackColor,fontWeight: FontWeight.w500,fontSize: 20),
            2.ph,
            textWidget(title: jobModel?.jobType == 1 ?
            'Job Typ : Part-Time':'Job Typ : Full-Time',fontSize: 18,fontWeight: FontWeight.w700),
            2.ph,
            textWidget(title:
            '${jobModel?.currency.toString() == 'INR' ? 'Salary : INR' : "Salary : \$"} ${jobModel?.salary}/Month',
                textColor: blackColor,fontWeight: FontWeight.w700,fontSize: 18),
            2.ph,
            textWidget(title: "Job Description : ${jobModel?.description?? 'NA' }",maxLines: 50,
                textColor: blackColor,fontWeight: FontWeight.w500,fontSize: 18),
          ],),
      ),);
  }
}
