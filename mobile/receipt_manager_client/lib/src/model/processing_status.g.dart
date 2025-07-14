// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processing_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProcessingStatus _$pending = const ProcessingStatus._('pending');
const ProcessingStatus _$processing = const ProcessingStatus._('processing');
const ProcessingStatus _$completed = const ProcessingStatus._('completed');
const ProcessingStatus _$failed = const ProcessingStatus._('failed');

ProcessingStatus _$valueOf(String name) {
  switch (name) {
    case 'pending':
      return _$pending;
    case 'processing':
      return _$processing;
    case 'completed':
      return _$completed;
    case 'failed':
      return _$failed;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ProcessingStatus> _$values =
    BuiltSet<ProcessingStatus>(const <ProcessingStatus>[
  _$pending,
  _$processing,
  _$completed,
  _$failed,
]);

class _$ProcessingStatusMeta {
  const _$ProcessingStatusMeta();
  ProcessingStatus get pending => _$pending;
  ProcessingStatus get processing => _$processing;
  ProcessingStatus get completed => _$completed;
  ProcessingStatus get failed => _$failed;
  ProcessingStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<ProcessingStatus> get values => _$values;
}

abstract class _$ProcessingStatusMixin {
  // ignore: non_constant_identifier_names
  _$ProcessingStatusMeta get ProcessingStatus => const _$ProcessingStatusMeta();
}

Serializer<ProcessingStatus> _$processingStatusSerializer =
    _$ProcessingStatusSerializer();

class _$ProcessingStatusSerializer
    implements PrimitiveSerializer<ProcessingStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'processing': 'processing',
    'completed': 'completed',
    'failed': 'failed',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'processing': 'processing',
    'completed': 'completed',
    'failed': 'failed',
  };

  @override
  final Iterable<Type> types = const <Type>[ProcessingStatus];
  @override
  final String wireName = 'ProcessingStatus';

  @override
  Object serialize(Serializers serializers, ProcessingStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProcessingStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProcessingStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
