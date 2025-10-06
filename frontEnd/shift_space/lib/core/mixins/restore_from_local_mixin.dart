import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';


mixin RestoreDataFromLocal {
  Future<void> restoreData(WidgetRef ref) async {
    await Future.wait([
      _restoreFromLocal(ref),
    ]);
    // await _restoreCurrentActivities(ref);
  }

  Future<void> _restoreFromLocal(WidgetRef ref) async {
    // final userAppRep = ref.read(userAppRepository);
    // final speakerRep = ref.read(speakerRepository);

    // final result = await userAppRep.getObjectLocal();

    // final rawUser = result.getOrThrow(
    //   file: 'restore_data_from_local',
    //   method: 'restoreData',
    // );

    // if (rawUser == null) return;

    // final roleStr = rawUser['role'] as String;
    // final role = Roles.fromString(roleStr);

    // if (role == Roles.speaker) {
    //   await _restoreSpeaker(ref, speakerRep, role);
    //   return;
    // }

    // final user = UserAppDTO.fromJson(rawUser).toModel();
    // await _login(ref: ref, userId: user.id!);
  }

  // Future<void> _restoreSpeaker(
  //     WidgetRef ref, SpeakerRepository repo, Roles role) async {
  //   final resultSpeaker = await repo.getObjectLocal();

  //   if (resultSpeaker case Error(error: final e)) throw e;
  //   if (resultSpeaker case Ok(value: final v)) {
  //     final speaker = v != null ? SpeakerDTO.fromJson(v).toModel() : null;
  //     if (speaker != null) await _login(ref: ref, userId: speaker.id!);
  //   }
  // }

  // Future<void> _login({
  //   required WidgetRef ref,
  //   required int userId,
  // }) async {
  //   final commissionRepo = ref.read(commissionRepoProvider);
  //   final userAppRepo = ref.read(userAppRepository);
  //   await ref.watch(eventNotifierProvider.future);
  //   final eventNot = ref.read(eventNotifierProvider.notifier);

  //   await Future.delayed(const Duration(milliseconds: 3000));

  //   final currentEvent = eventNot.currentEvent;

  //   final userResponse = await userAppRepo.findByDataId(userId);

  //   Commission? commission = Commission();
  //   bool isCommission = false;
  //   bool isApprovedCommission = false;

  //   final user = userResponse.getOrThrow(
  //     file: 'restore_data_from_local',
  //     method: 'login',
  //   );

  //   bool isSpeaker = user.role == Roles.speaker;
  //   // final isStudant = user.role == Roles.student;

  //   if (!isSpeaker) {
  //     final speakerRepo = ref.read(speakerRepository);
  //     isSpeaker = await speakerRepo.exists(user.id!);
  //   }

  //   if (currentEvent != null) {
  //     commission = await commissionRepo.getByUserAndEventId(
  //       userId: user.id!,
  //       eventId: currentEvent.id!,
  //     );

  //     isCommission = commission != null;
  //     isApprovedCommission = commission?.isApproved ?? false;
  //   }

  //   ref.read(authProvider.notifier).login(
  //         user: UserWrapper.wrap(user),
  //         isAdmin: user.role == Roles.admin,
  //         isCommission: isCommission,
  //         isSpeaker: isSpeaker,
  //         isApprovedCommission: isApprovedCommission,
  //         isUserApp: user.role == Roles.student,
  //         isStudant: user.role == Roles.student,
  //         relationship: user.role == Roles.speaker
  //             ? user.relationship
  //             : user.relationship,
  //       );
  // }

  // Future<void> _restoreCurrentActivities(WidgetRef ref) async {
  //   ref.read(activityNotProvider.notifier).currentEventActivities;
  // }
}
