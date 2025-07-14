//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'processing_status.g.dart';

class ProcessingStatus extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const ProcessingStatus pending = _$pending;
  @BuiltValueEnumConst(wireName: r'processing')
  static const ProcessingStatus processing = _$processing;
  @BuiltValueEnumConst(wireName: r'completed')
  static const ProcessingStatus completed = _$completed;
  @BuiltValueEnumConst(wireName: r'failed')
  static const ProcessingStatus failed = _$failed;

  static Serializer<ProcessingStatus> get serializer => _$processingStatusSerializer;

  const ProcessingStatus._(String name): super(name);

  static BuiltSet<ProcessingStatus> get values => _$values;
  static ProcessingStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class ProcessingStatusMixin = Object with _$ProcessingStatusMixin;

