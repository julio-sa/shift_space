import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shift_space/core/classes/app_exception_class.dart';
import 'package:shift_space/core/classes/result_class.dart';
import 'package:shift_space/core/interfaces/wrapper.dart';

mixin SharedPrefsMixin {
  Future<Result<void>> mixinSaveObject({
    required Wrapper wrapper,
  }) async {
    return handleResult(
      () async {
        final model = wrapper.model;
        if (model == null) throw AppException("Model não inicializado.");
        final json = model.toJson();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(wrapper.key, jsonEncode(json));
      },
      onError: (e) {
        Logger().e('Erro ao salvar o objeto localmente [${wrapper.key}]: $e');
      },
    );
  }

  Future<Result<void>> mixinSaveString({
    required Wrapper wrapper,
  }) async {
    return handleResult(
      () async {
        final model = wrapper.model;
        if (model == null) throw AppException("Model não inicializado.");
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(wrapper.key, model.toString());
      },
      onError: (e) {
        Logger().e('Erro ao salvar a string localmente [${wrapper.key}]: $e');
      },
    );
  }

  Future<Result<void>> mixinSaveList({
    required Wrapper wrapper,
    required List<dynamic> list,
  }) async {
    return handleResult(
      () async {
        final jsonList = wrapper.toJsonList(list);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(wrapper.key, jsonEncode(jsonList));
      },
      onError: (e) {
        Logger().e('Erro ao salvar a lista localmente [${wrapper.key}]: $e');
      },
    );
  }

  Future<Result<Map<String, dynamic>?>> mixinGetObject(String key) async {
    return handleResult(
      () async {
        final prefs = await SharedPreferences.getInstance();
        final data = prefs.getString(key);
        if (data == null) return null;
        final decoded = jsonDecode(data);
        if (decoded is Map<String, dynamic>) return decoded;
        throw AppException('Objeto local mal formatado');
      },
      onError: (e) {
        Logger().e('Erro ao carregar o objeto localmente [$key]: $e');
      },
    );
  }

  Future<Result<List<Map<String, dynamic>>?>> mixinGetList(String key) async {
    return handleResult(
      () async {
        final prefs = await SharedPreferences.getInstance();
        final data = prefs.getString(key);
        if (data == null) return null;
        final rawList = jsonDecode(data);
        return List<Map<String, dynamic>>.from(rawList);
      },
      onError: (e) {
        Logger().e('Erro ao carregar a lista localmente [$key]: $e');
      },
    );
  }

  Future<Result<void>> mixinRemove(String key) async {
    return handleResult(
      () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove(key);
      },
      onError: (e) {
        Logger().e('Erro ao remover o objeto localmente [$key]: $e');
      },
    );
  }

  Future<Result<void>> mixinClearAll() async {
    return handleResult(
      () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();
      },
      onError: (e) {
        Logger().e('Erro ao limpar os dados locais: $e');
      },
    );
  }


  Future<Result<void>> mixinSaveOnlyString(String key, String value) async {
    return handleResult(
      () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(key, value);
      },
      onError: (e) {
        Logger().e('Erro ao salvar a string localmente [$key]: $e');
      },
    );
  }
}

