abstract class UserState {}

class UserInitailState extends UserState{}

class ChangeNaveBarState extends UserState{}

class getProfileDataLoadingState extends UserState{}
class getProfileDataSuccesState extends UserState{}
class getProfileDataErrorState extends UserState{
  final String error;

  getProfileDataErrorState(this.error);
}

class ChangeDropDownState extends UserState{}

class PickTicketImageLoadingState extends UserState{}

class PickTicketImageErrorState extends UserState{
  final String error;

  PickTicketImageErrorState(this.error);
}
class PickTicketImageSuccessState extends UserState{}

class RemoveImagPickState extends UserState{}

class SendReportGpImageLoadingState extends UserState{}

class SendReportGpImageSuccessState extends UserState{}

class SendReportGpImageErrorState extends UserState{
  final String  error;

  SendReportGpImageErrorState(this.error);
}

class GetReportFormDbLaodingState extends UserState{}

class GetReportFormDbSuccessState extends UserState{}

class GetReportFormDbErrorState extends UserState{
  final String error;

  GetReportFormDbErrorState(this.error);
}


class GetReportDelayLoadingState extends UserState{}

class GetReportDelaySuccessState extends UserState{}

class GetReportDelayErrorState extends UserState{
  final String error;

  GetReportDelayErrorState(this.error);
}


class GetReportInprogressLoadingState extends UserState{}

class GetReportInprogressSuccessState extends UserState{}

class GetReportInprogressErrorState extends UserState{
  final String error;

  GetReportInprogressErrorState(this.error);
}



class GetReportDoneLoadingState extends UserState{}

class GetReportDoneSuccessState extends UserState{}

class GetReportDoneErrorState extends UserState{
  final String error;

  GetReportDoneErrorState(this.error);
}

class GetReportRufueseLoadingState extends UserState{}

class GetReportRefueseSuccessState extends UserState{}

class GetReportReufeseErrorState extends UserState{
  final String error;

  GetReportReufeseErrorState(this.error);
}


class  UpdateProfileUserLoadingState extends UserState{}

class  UpdateProfileUserSuccessState extends UserState{}


class  UpdateProfileUserErrorState extends UserState{
  final String error;

  UpdateProfileUserErrorState(this.error);
}

class ResetEmailAndPasswordUserGpLoadingState extends UserState{}

class ResetEmailAndPasswordUserGpSuccessState extends UserState{}

class ResetEmailAndPasswordUserGpErrorState extends UserState{
  final String error;

  ResetEmailAndPasswordUserGpErrorState(this.error);
}

class SingOutScreenProfileUserLoadingState extends UserState{}
class SingOutScreenProfileUserSuccessState extends UserState{}
class SingOutScreenProfileUserErrorState extends UserState{
  final String error;

  SingOutScreenProfileUserErrorState(this.error);
}



class PickImagePorFileGpLoadingState extends UserState{}

class PickImagePorFileGpSuccessState extends UserState{}

class PickImagePorFileGpErrorState extends UserState{
  final String error;

  PickImagePorFileGpErrorState(this.error);
}