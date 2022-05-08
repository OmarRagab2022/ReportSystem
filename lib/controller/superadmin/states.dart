abstract class SuperAdminGPState {}

class SuperAdminGPInitailState extends SuperAdminGPState{}

class SuperAdminGetYouerDataLoadingState extends SuperAdminGPState{}

class SuperAdminGetYouerDataSuccessState extends SuperAdminGPState{}

class SuperAdminGetYouerDataErrorState extends SuperAdminGPState{
  final String error;

  SuperAdminGetYouerDataErrorState(this.error);
}

class PickImagePorFileGpLoadingState extends SuperAdminGPState{}

class PickImagePorFileGpSuccessState extends SuperAdminGPState{}

class PickImagePorFileGpErrorState extends SuperAdminGPState{
  final String error;

  PickImagePorFileGpErrorState(this.error);
}

class UpdateProfileWithImageLoadingState extends SuperAdminGPState{}

class UpdateProfileWithImageSuccessState extends SuperAdminGPState{}

class UpdateProfileWithImageErrorState extends SuperAdminGPState{
  final String error;

  UpdateProfileWithImageErrorState(this.error);
}

class UpdateProfileWithOutImageLoadingState extends SuperAdminGPState{}

class UpdateProfileWithOutImageSuccessState extends SuperAdminGPState{}

class UpdateProfileWithOutImageErrorState extends SuperAdminGPState{
  final String error;

  UpdateProfileWithOutImageErrorState(this.error);
}

class CreateAdminGpLoadingState extends SuperAdminGPState{}

class CreateAdminGpSuccesState extends SuperAdminGPState{}

class CreateAdminGpErrorState extends SuperAdminGPState{
  final String error;

  CreateAdminGpErrorState(this.error);
}


class CreateUserGpLoadingState extends SuperAdminGPState{}

class CreateUserGpSuccesState extends SuperAdminGPState{}

class CreateUserGpErrorState extends SuperAdminGPState{
  final String error;

  CreateUserGpErrorState(this.error);
}

class  UpdateProfileSuperAdminLoadingState extends SuperAdminGPState{}

class  UpdateProfileSuperAdminSuccessState extends SuperAdminGPState{}


class  UpdateProfileSuperAdminErrorState extends SuperAdminGPState{
  final String error;

  UpdateProfileSuperAdminErrorState(this.error);
}

class ResetEmailAndPasswordGpLoadingState extends SuperAdminGPState{}

class ResetEmailAndPasswordGpSuccessState extends SuperAdminGPState{}

class ResetEmailAndPasswordGpErrorState extends SuperAdminGPState{
  final String error;

  ResetEmailAndPasswordGpErrorState(this.error);
}

class SingOutScreenProfileLoadingState extends SuperAdminGPState{}
class SingOutScreenProfileSuccessState extends SuperAdminGPState{}
class SingOutScreenProfileErrorState extends SuperAdminGPState{
  final String error;

  SingOutScreenProfileErrorState(this.error);
}


class GetUsersFromDbLoadingState extends SuperAdminGPState{}
class GetUsersFromDbSuccessState extends SuperAdminGPState{}
class GetUsersFromDbErrorState extends SuperAdminGPState{
  final String error;

  GetUsersFromDbErrorState(this.error);
}


class GetAdminsFromDbLoadingState extends SuperAdminGPState{}
class GetAdminsFromDbSuccessState extends SuperAdminGPState{}
class GetAdminsFromDbErrorState extends SuperAdminGPState{
  final String error;

  GetAdminsFromDbErrorState(this.error);
}

class ChangeNavBarState extends SuperAdminGPState{}


class RemoveAnyUserLoadingState extends SuperAdminGPState{}
class RemoveAnyUserSuccessState extends SuperAdminGPState{}
class RemoveAnyUserErrorState extends SuperAdminGPState{
  final String error;

  RemoveAnyUserErrorState(this.error);
}

class GetInprogressReportsSuperLoadingState extends SuperAdminGPState{}

class GetInprogressReportsSuperSuccessState extends SuperAdminGPState{}

class GetInprogressReportsSuperErrorState extends SuperAdminGPState{
  late final String error;
}


class GetDoneReportsSuperLoadingState extends SuperAdminGPState{}

class GetDoneReportsSuperSuccessState extends SuperAdminGPState{}

class GetDoneReportsSuperErrorState extends SuperAdminGPState{
  late final String error;
}

class GetDelayReportsSuperLoadingState extends SuperAdminGPState{}

class GetDelayReportsSuperSuccessState extends SuperAdminGPState{}

class GetDelayReportsSuperErrorState extends SuperAdminGPState{
  late final String error;
}


class GetRefueseReportsSuperLoadingState extends SuperAdminGPState{}

class GetRefueseReportsSuperSuccessState extends SuperAdminGPState{}

class GetRefueseReportsSuperErrorState extends SuperAdminGPState{
  late final String error;
}
class ChangeNavBarReportsScreen extends SuperAdminGPState{}

class ChartSeriesLoading extends SuperAdminGPState{}