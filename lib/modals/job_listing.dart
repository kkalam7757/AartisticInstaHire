class JobListingModal {
  final String jobTitle;
  final String jobDescription;
  final String workPreference;
  final String jobCategory;
  final String userId;
  JobListingModal({this.workPreference, this.jobCategory,this.jobDescription,this.jobTitle,this.userId});
  
  JobListingModal.fromData(Map<String,dynamic> data):
    jobTitle = data['jobTitle'],
    jobDescription = data['jobDescription'],
    workPreference = data['workPreference'],
    userId = data['userId'],
    jobCategory = data['jobCategory'];
   Map<String,dynamic> toJson(){
     return {
       'jobTitle': jobTitle,
       'jobDescription': jobDescription,
       'workPreference': workPreference,
       'jobCategory': jobCategory,
       'userId':userId
     };
   }
}