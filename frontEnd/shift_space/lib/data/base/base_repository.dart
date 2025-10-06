import 'package:flutter/material.dart';
import 'package:shift_space/core/classes/app_exception_class.dart';
import 'package:shift_space/core/classes/error_utils.dart';
import 'package:shift_space/core/classes/result_class.dart';
import 'package:shift_space/core/interfaces/wrapper.dart';
import 'package:shift_space/core/mixins/shared_prefs_mixin.dart';
import 'package:shift_space/data/base/base_service.dart';

abstract class BaseRepository<DTO, M, VO> with SharedPrefsMixin {
  BaseRepository({
    required this.service,
    required this.wrapper,
  });

  @protected
  final Wrapper<DTO, M, VO> wrapper;

  @protected
  final BaseService<DTO, M, VO> service;

  Future<Result<List<M>>> getAll() async {
    return handleResult(() async {
      final result = await service.getAll();
      return await _saveToLocalObjList(result);
    });
  }

  Future<Result<M>> getById(int id) async {
    return handleResult(() async {
      final result = await service.getById(id);
      return _saveToLocalObj(result);
    });
  }

  Future<Result<M>> create(M domain) async {
    return handleResult(() async {
      final vo = wrapper.toVO(domain);
      final result = await service.post(vo);
      return _saveToLocalObj(result);
    });
  }

  Future<Result<M>> update(M domain) async {
    return handleResult(() async {
      final vo = wrapper.toVO(domain);
      final result = await service.put(vo);
      return _saveToLocalObj(result);
    });
  }

  Future<Result<void>> delete(int id) async {
    return handleResult(() async {
      final resultDelete = await service.delete(id);
      _handleError(resultDelete, 'Failed to delete object from remote');
      final resultRemove = await mixinRemove(wrapper.key);
      _handleError(resultRemove, 'Failed to remove object from local');
    });
  }

  //SharedPreferences
  Future<void> mixinSaveObjectLocal(Wrapper wrap) async {
    final result = await mixinSaveObject(wrapper: wrap);
    _handleError(result, 'Failed to save object to local');
  }

  Future<void> mixinSaveListLocal(List<dynamic> list, Wrapper wrap) async {
    final result = await mixinSaveList(wrapper: wrap, list: list);
    _handleError(result, 'Failed to save list to local');
  }

  Future<Map<String, dynamic>?> getObjectLocal() async {
    final result = await mixinGetObject(wrapper.key);
    return switch (result) {
      Ok(value: final value) => value,
      Error(error: final e) => throw AppException(e.toString()),
    };
  }

  Future<List<Map<String, dynamic>>?> getListObject() async {
    final result = await mixinGetList(wrapper.key);
    return switch (result) {
      Ok(value: final value) => value,
      Error(error: final e) => throw AppException(e.toString()),
    };
  }

  Future<void> removeLocal() async {
    final result = await mixinRemove(wrapper.key);
    _handleError(result, 'Failed to remove object from local');
  }

  Future<M> _saveToLocalObj(Result result) async {
    final model = switch (result) {
      Ok(value: final dto) => wrapper.toModel((dto as DTO)),
      Error(error: final e) =>
        throw ErrorUtils.handleAndReturn(
          file: 'BaseRepository',
          method: 'saveToLocalObj',
          error: AppException(e.toString()),
        ),
    };
    await mixinSaveObjectLocal(Wrapper.wrap(model));
    return model;
  }

  Future<List<M>> _saveToLocalObjList(
    Result result,
  ) async {
    final dtos = switch (result) {
      Ok(value: final listDto) => List<DTO>.from(listDto),
      Error(error: final e) => throw AppException(e.toString()),
    };
    final models = wrapper.toModelList(dtos);
    await mixinSaveListLocal(models, wrapper);
    return models;
  }

  void _handleError(Result<void> resultRemove, String message) {
    if (resultRemove case Error(error: final e)) {
      throw AppException('error: $message, status: $e');
    }
  }
}
