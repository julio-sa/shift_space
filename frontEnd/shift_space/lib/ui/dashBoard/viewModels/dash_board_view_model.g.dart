// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_board_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashBoardViewModelHash() =>
    r'146be6142bf8499e2d380e031cdaf9794a737984';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DashBoardViewModel
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final String? zipCode;
  late final DateTime? date;

  FutureOr<ApiResponse?> build(String? zipCode, DateTime? date);
}

/// See also [DashBoardViewModel].
@ProviderFor(DashBoardViewModel)
const dashBoardViewModelProvider = DashBoardViewModelFamily();

/// See also [DashBoardViewModel].
class DashBoardViewModelFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [DashBoardViewModel].
  const DashBoardViewModelFamily();

  /// See also [DashBoardViewModel].
  DashBoardViewModelProvider call(String? zipCode, DateTime? date) {
    return DashBoardViewModelProvider(zipCode, date);
  }

  @override
  DashBoardViewModelProvider getProviderOverride(
    covariant DashBoardViewModelProvider provider,
  ) {
    return call(provider.zipCode, provider.date);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dashBoardViewModelProvider';
}

/// See also [DashBoardViewModel].
class DashBoardViewModelProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<DashBoardViewModel, ApiResponse?> {
  /// See also [DashBoardViewModel].
  DashBoardViewModelProvider(String? zipCode, DateTime? date)
    : this._internal(
        () =>
            DashBoardViewModel()
              ..zipCode = zipCode
              ..date = date,
        from: dashBoardViewModelProvider,
        name: r'dashBoardViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$dashBoardViewModelHash,
        dependencies: DashBoardViewModelFamily._dependencies,
        allTransitiveDependencies:
            DashBoardViewModelFamily._allTransitiveDependencies,
        zipCode: zipCode,
        date: date,
      );

  DashBoardViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.zipCode,
    required this.date,
  }) : super.internal();

  final String? zipCode;
  final DateTime? date;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant DashBoardViewModel notifier,
  ) {
    return notifier.build(zipCode, date);
  }

  @override
  Override overrideWith(DashBoardViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: DashBoardViewModelProvider._internal(
        () =>
            create()
              ..zipCode = zipCode
              ..date = date,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        zipCode: zipCode,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DashBoardViewModel, ApiResponse?>
  createElement() {
    return _DashBoardViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DashBoardViewModelProvider &&
        other.zipCode == zipCode &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, zipCode.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DashBoardViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `zipCode` of this provider.
  String? get zipCode;

  /// The parameter `date` of this provider.
  DateTime? get date;
}

class _DashBoardViewModelProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          DashBoardViewModel,
          ApiResponse?
        >
    with DashBoardViewModelRef {
  _DashBoardViewModelProviderElement(super.provider);

  @override
  String? get zipCode => (origin as DashBoardViewModelProvider).zipCode;
  @override
  DateTime? get date => (origin as DashBoardViewModelProvider).date;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
