// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'city_cubit.freezed.dart';

// class CityCubit extends Cubit<CityState> {
//   // final IMainRepository _repository;

//   CityCubit() : super(const CityState.initialState());

//   // Future<void> getCities({
//   //   required CityDTO? city,
//   // }) async {
//   //   emit(const CityState.loadingState());

//   //   final result = await _repository.getCities();

//   //   result.when(
//   //     success: (cities) {
//   //       // final List<CityDTO> temp = cities.where((element) => city?.id == element.id).toList();
//   //       // if (temp.isEmpty) {
//   //       //   callback.call();
//   //       // }

//   //       // final CityDTO? defaultCity = cities.firstWhereOrNull(
//   //       //   (element) => element.name == 'Астана',
//   //       // );

//   //       emit(CityState.loadedState(cities: cities, defaultCity: cities.isEmpty ? null : cities.first));
//   //     },
//   //     failure: (e) {
//   //       emit(CityState.errorState(message: e.msg ?? "Unknown Error in [CityCubit]"));
//   //     },
//   //   );
//   // }

//   // @override
//   // void onChange(Change<CityState> change) {
//   //   log(change.toString());
//   //   super.onChange(change);
//   // }
// }

// @freezed
// class CityState with _$CityState {
//   const factory CityState.initialState() = _InitialPage;

//   const factory CityState.loadingState() = _LoadingState;

//   const factory CityState.loadedState(
//       //   {
//       // required List<CityDTO> cities,
//       // required CityDTO? defaultCity,
//       // }
//       ) = _LoadedState;

//   const factory CityState.errorState({
//     required String message,
//   }) = _ErrorState;
// }
