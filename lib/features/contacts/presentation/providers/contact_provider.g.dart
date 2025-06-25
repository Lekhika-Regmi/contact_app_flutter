// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************
//
String _$contactByIdHash() => r'e0854c352f1b2d640d04c22703cd1df38b773fd4';

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

/// See also [contactById].
@ProviderFor(contactById)
const contactByIdProvider = ContactByIdFamily();

/// See also [contactById].
class ContactByIdFamily extends Family<AsyncValue<Contact?>> {
  /// See also [contactById].
  const ContactByIdFamily();

  /// See also [contactById].
  ContactByIdProvider call(int id) {
    return ContactByIdProvider(id);
  }

  @override
  ContactByIdProvider getProviderOverride(
    covariant ContactByIdProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'contactByIdProvider';
}

/// See also [contactById].
class ContactByIdProvider extends AutoDisposeFutureProvider<Contact?> {
  /// See also [contactById].
  ContactByIdProvider(int id)
    : this._internal(
        (ref) => contactById(ref as ContactByIdRef, id),
        from: contactByIdProvider,
        name: r'contactByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$contactByIdHash,
        dependencies: ContactByIdFamily._dependencies,
        allTransitiveDependencies: ContactByIdFamily._allTransitiveDependencies,
        id: id,
      );

  ContactByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Contact?> Function(ContactByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ContactByIdProvider._internal(
        (ref) => create(ref as ContactByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Contact?> createElement() {
    return _ContactByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContactByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContactByIdRef on AutoDisposeFutureProviderRef<Contact?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ContactByIdProviderElement
    extends AutoDisposeFutureProviderElement<Contact?>
    with ContactByIdRef {
  _ContactByIdProviderElement(super.provider);

  @override
  int get id => (origin as ContactByIdProvider).id;
}

String _$contactNotifierHash() => r'df69331362573a02c9e9b44e611e74a52f27d802';

/// See also [ContactNotifier].
@ProviderFor(ContactNotifier)
final contactNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ContactNotifier, List<Contact>>.internal(
      ContactNotifier.new,
      name: r'contactNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$contactNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ContactNotifier = AutoDisposeAsyncNotifier<List<Contact>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
