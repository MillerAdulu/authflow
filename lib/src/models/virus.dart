part of models;


abstract class Virus implements Built<Virus, VirusBuilder> {

  int get id;

  @BuiltValueField(wireName: 'name')
  String get virusName;

  Virus._();

  factory Virus([void Function(VirusBuilder) updates]) = _$Virus;

  String toJson() {
    return json.encode(serializers.serializeWith(Virus.serializer, this));
  }

  static Virus fromResponse(Map<String,dynamic> response) {
    return serializers.deserializeWith(Virus.serializer, response);
  }

  static Serializer<Virus> get serializer => _$virusSerializer;
}