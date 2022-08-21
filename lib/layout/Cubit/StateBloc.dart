abstract class LayoutState {}

class InitialState extends LayoutState {}

class LoadingGetUserData extends LayoutState {}

class SuccessGetUserData extends LayoutState {}

class ErrorGetUserData extends LayoutState {
  final String error;

  ErrorGetUserData(this.error);
}

class ChangeBottomNavState extends LayoutState {}

class ChangenameState extends LayoutState {}

class ChangeSelectItem extends LayoutState {}

class IncrementSelectItem extends LayoutState {}

class DecrementSelectItem extends LayoutState {}


class LoadingGetServicesState extends LayoutState {}

class SuccessGetServicesState extends LayoutState {}

class ErrorGetServicesState extends LayoutState {
  final String error;

  ErrorGetServicesState(this.error);
}

class LoadingGetServiceState extends LayoutState {}

class SuccessGetServiceState extends LayoutState {}

class ErrorGetServiceState extends LayoutState {
  final String error;

  ErrorGetServiceState(this.error);
}

class CheckFavouriteErrorState extends LayoutState {
  final String error;

  CheckFavouriteErrorState(this.error);
}

class SetFavouriteLoadingState extends LayoutState {}

class SetFavouriteSuccessState extends LayoutState {}

class SetFavouriteErrorState extends LayoutState {
  final String error;

  SetFavouriteErrorState(this.error);
}

class DeleteFavouriteLoadingState extends LayoutState {}

class DeleteFavouriteSuccessState extends LayoutState {}

class DeleteFavouriteErrorState extends LayoutState {
  final String error;

  DeleteFavouriteErrorState(this.error);
}class LoadingLogoutState extends LayoutState {}

class SuccessLogoutState extends LayoutState {}

class ErrorLogoutState extends LayoutState {
  final String error;

  ErrorLogoutState(this.error);
}

class UoloadCoverSuccessState extends LayoutState {}

class UoloadCoverErrorState extends LayoutState {}

class SuccessLocation extends LayoutState {}