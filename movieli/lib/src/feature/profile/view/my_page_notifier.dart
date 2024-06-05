import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_notifier.freezed.dart';

@freezed
abstract class MyPageState with _$MyPageState {
  const factory MyPageState({
    @Default(0) int count,
    String? comment,
    String? weight,
    @Default([]) List<Map<String, String>> record,
  }) = _MyPageState;
}

class MyPageNotifier extends StateNotifier<MyPageState> with LocatorMixin {
  MyPageNotifier({
    required this.context,
  }) : super(const MyPageState());

  final BuildContext context;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {}

  void pushButton() {
    print('notifier');
    state = state.copyWith(count: state.count + 1);
    print(state.count.toString());
  }

  void saveWeight(String value) {
    state = state.copyWith(weight: value);
    print(value);
  }

  void saveComment(String value) {
    state = state.copyWith(comment: value);
    print(value);
  }

  void register() {
    final dateTime = DateTime.now();
    final day = '${dateTime.year}Year ${dateTime.month}Month ${dateTime.day}';
    final formRecord = {
      'weight': state.weight!,
      'comment': state.comment!,
      'day': day,
    };
    print(formRecord.toString());
    final newRecord = List<Map<String, String>>.from(state.record);
    newRecord.add(formRecord);
    state = state.copyWith(record: newRecord);
    print(state.record.toString());
    Navigator.pop(context);
  }

  void saveEditedRecord(int index, String weight, String comment) {
    final updatedRecord = {
      'weight': weight,
      'comment': comment,
      'day': state.record[index]['day']!,
    };
    final newRecordList = List<Map<String, String>>.from(state.record);
    newRecordList[index] = updatedRecord;
    state = state.copyWith(record: newRecordList);
    Navigator.pop(context);
  }

  void deleteRecord(int index) {
    final newRecordList = List<Map<String, String>>.from(state.record);
    newRecordList.removeAt(index);
    state = state.copyWith(record: newRecordList);
  }
}
