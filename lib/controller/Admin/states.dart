abstract class AdminState{}
class AdminInitailState extends AdminState{}
class ChangeNavBarAdminState extends AdminState{}

class GetDataProfileAdminLoadingState extends AdminState{}

class GetDataProfileAdminsuccessState extends AdminState{}

class GetDataProfileAdminErrorState extends AdminState{
  final String error;

  GetDataProfileAdminErrorState(this.error);
}

class GetInprogressReportsLoadingState extends AdminState{}

class GetInprogressReportsSuccessState extends AdminState{}

class GetInprogressReportsErrorState extends AdminState{
  final String error;

  GetInprogressReportsErrorState(this.error);
}



class GetDelayReportsLoadingState extends AdminState{}

class GetDelayReportsSuccessState extends AdminState{}

class GetDelayReportsErrorState extends AdminState{
  final String error;

  GetDelayReportsErrorState(this.error);
}


class GetRufeuseReportsLoadingState extends AdminState{}

class GetRufeuseReportsSuccessState extends AdminState{}

class GetRufeuseReportsErrorState extends AdminState{
  final String error;

  GetRufeuseReportsErrorState(this.error);
}


class GetNewReportsLoadingState extends AdminState{}

class GetNewReportsSuccessState extends AdminState{}

class GetNewReportsErrorState extends AdminState{
  final String error;

  GetNewReportsErrorState(this.error);
}

class GetDoneReportsLoadingState extends AdminState{}

class GetDoneReportsSuccessState extends AdminState{}

class GetDoneReportsErrorState extends AdminState{
  final String error;

  GetDoneReportsErrorState(this.error);
}



class GetRefueseReportsLoadingState extends AdminState{}

class GetRefueseReportsSuccessState extends AdminState{}

class GetRefueseReportsErrorState extends AdminState{
  final String error;

  GetRefueseReportsErrorState(this.error);
}

class ChangeDropDownAdmin extends AdminState{}

class UpdateStatusLoadingState extends AdminState{}

class UpdateStatusSuccessState extends AdminState{}

class UpdateStatusErrorState extends AdminState{
  final String error;

  UpdateStatusErrorState(this.error);
}




class PickTicketImageAdminLoadingState extends AdminState{}

class PickTicketImageAdminErrorState extends AdminState{
  final String error;

  PickTicketImageAdminErrorState(this.error);
}
class PickTicketImageAdminSuccessState extends AdminState{}


class SingOutScreenProfileAdminLoadingState extends AdminState{}
class SingOutScreenProfileAdminSuccessState extends AdminState{}
class SingOutScreenProfileAdminErrorState extends AdminState{
  final String error;

  SingOutScreenProfileAdminErrorState(this.error);
}


class ResetEmailAndPasswordAdminGpLoadingState extends AdminState{}

class ResetEmailAndPasswordAdminGpSuccessState extends AdminState{}

class ResetEmailAndPasswordAdminGpErrorState extends AdminState{
  final String error;

  ResetEmailAndPasswordAdminGpErrorState(this.error);
}

class ChangeNavBarState extends AdminState{}

class ResetPasswordAndEmailLoadingState extends AdminState{}
class ResetPasswordAndEmailSuccessState extends AdminState{}
class ResetPasswordAndEmailErrorState extends AdminState{
  final String error;

  ResetPasswordAndEmailErrorState(this.error);
}

class  UpdateProfileWithOutImageAdminLoadingState extends AdminState{}

class  UpdateProfileWithOutImageAdminSuccessState extends AdminState{}

class  UpdateProfileWithOutImageAdminErrorState extends AdminState{
  final String error;

  UpdateProfileWithOutImageAdminErrorState(this.error);
}


class SignOutAdminLoadingState extends AdminState{}

class SignOutAdminSuccessState extends AdminState{}

class SignOutAdminErrorState extends AdminState{
  final String error;

  SignOutAdminErrorState(this.error);
}