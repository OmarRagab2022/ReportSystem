abstract class ReportAdminDetailsState {}

class ReportAdminInitailState extends ReportAdminDetailsState{}

class GetReportAdminLoadingFromDb extends ReportAdminDetailsState{}
class GetReportAdminSuccessFromDb extends ReportAdminDetailsState{}
class GetReportAdminErrorFromDb extends ReportAdminDetailsState{
  final String error;

  GetReportAdminErrorFromDb(this.error);
}


class ChangeDropDownAdmin extends ReportAdminDetailsState{}


class UpdateReportAdminLoadingFromDb extends ReportAdminDetailsState{}
class UpdateReportAdminSuccessFromDb extends ReportAdminDetailsState{}
class UpdateReportAdminErrorFromDb extends ReportAdminDetailsState{
  final String error;

  UpdateReportAdminErrorFromDb(this.error);
}