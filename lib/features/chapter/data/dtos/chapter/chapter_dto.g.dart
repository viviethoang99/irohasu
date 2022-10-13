// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetChapterDtoCollection on Isar {
  IsarCollection<ChapterDto> get chapterDtos => this.collection();
}

const ChapterDtoSchema = CollectionSchema(
  name: r'ChapterDto',
  id: -8486450597838001211,
  properties: {
    r'endpoint': PropertySchema(
      id: 0,
      name: r'endpoint',
      type: IsarType.string,
    ),
    r'idManga': PropertySchema(
      id: 1,
      name: r'idManga',
      type: IsarType.string,
    ),
    r'isDataLocal': PropertySchema(
      id: 2,
      name: r'isDataLocal',
      type: IsarType.bool,
    ),
    r'listImage': PropertySchema(
      id: 3,
      name: r'listImage',
      type: IsarType.objectList,
      target: r'ChapterImageDto',
    ),
    r'mangaEndpoint': PropertySchema(
      id: 4,
      name: r'mangaEndpoint',
      type: IsarType.string,
    ),
    r'nameManga': PropertySchema(
      id: 5,
      name: r'nameManga',
      type: IsarType.string,
    ),
    r'nextChapter': PropertySchema(
      id: 6,
      name: r'nextChapter',
      type: IsarType.string,
    ),
    r'prevChapter': PropertySchema(
      id: 7,
      name: r'prevChapter',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 8,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _chapterDtoEstimateSize,
  serialize: _chapterDtoSerialize,
  deserialize: _chapterDtoDeserialize,
  deserializeProp: _chapterDtoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ChapterImageDto': ChapterImageDtoSchema},
  getId: _chapterDtoGetId,
  getLinks: _chapterDtoGetLinks,
  attach: _chapterDtoAttach,
  version: '3.0.2',
);

int _chapterDtoEstimateSize(
  ChapterDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.endpoint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.idManga.length * 3;
  bytesCount += 3 + object.listImage.length * 3;
  {
    final offsets = allOffsets[ChapterImageDto]!;
    for (var i = 0; i < object.listImage.length; i++) {
      final value = object.listImage[i];
      bytesCount +=
          ChapterImageDtoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.mangaEndpoint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nameManga;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nextChapter;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.prevChapter;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _chapterDtoSerialize(
  ChapterDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.endpoint);
  writer.writeString(offsets[1], object.idManga);
  writer.writeBool(offsets[2], object.isDataLocal);
  writer.writeObjectList<ChapterImageDto>(
    offsets[3],
    allOffsets,
    ChapterImageDtoSchema.serialize,
    object.listImage,
  );
  writer.writeString(offsets[4], object.mangaEndpoint);
  writer.writeString(offsets[5], object.nameManga);
  writer.writeString(offsets[6], object.nextChapter);
  writer.writeString(offsets[7], object.prevChapter);
  writer.writeString(offsets[8], object.title);
}

ChapterDto _chapterDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChapterDto(
    endpoint: reader.readStringOrNull(offsets[0]),
    id: id,
    isDataLocal: reader.readBoolOrNull(offsets[2]) ?? false,
    listImage: reader.readObjectList<ChapterImageDto>(
          offsets[3],
          ChapterImageDtoSchema.deserialize,
          allOffsets,
          ChapterImageDto(),
        ) ??
        const [],
    mangaEndpoint: reader.readStringOrNull(offsets[4]),
    nameManga: reader.readStringOrNull(offsets[5]),
    nextChapter: reader.readStringOrNull(offsets[6]),
    prevChapter: reader.readStringOrNull(offsets[7]),
    title: reader.readStringOrNull(offsets[8]),
  );
  return object;
}

P _chapterDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readObjectList<ChapterImageDto>(
            offset,
            ChapterImageDtoSchema.deserialize,
            allOffsets,
            ChapterImageDto(),
          ) ??
          const []) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chapterDtoGetId(ChapterDto object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chapterDtoGetLinks(ChapterDto object) {
  return [];
}

void _chapterDtoAttach(IsarCollection<dynamic> col, Id id, ChapterDto object) {}

extension ChapterDtoQueryWhereSort
    on QueryBuilder<ChapterDto, ChapterDto, QWhere> {
  QueryBuilder<ChapterDto, ChapterDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChapterDtoQueryWhere
    on QueryBuilder<ChapterDto, ChapterDto, QWhereClause> {
  QueryBuilder<ChapterDto, ChapterDto, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChapterDtoQueryFilter
    on QueryBuilder<ChapterDto, ChapterDto, QFilterCondition> {
  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> endpointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endpoint',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      endpointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endpoint',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> endpointEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      endpointGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> endpointLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> endpointBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endpoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      endpointStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> endpointEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> endpointContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> endpointMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endpoint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      endpointIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endpoint',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      endpointIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endpoint',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idMangaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      idMangaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idMangaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idMangaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idManga',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idMangaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idMangaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idMangaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idMangaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idManga',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> idMangaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idManga',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      idMangaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idManga',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      isDataLocalEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDataLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      listImageLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listImage',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      listImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listImage',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      listImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listImage',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      listImageLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listImage',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      listImageLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listImage',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      listImageLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listImage',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mangaEndpoint',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mangaEndpoint',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mangaEndpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mangaEndpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mangaEndpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mangaEndpoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mangaEndpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mangaEndpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mangaEndpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mangaEndpoint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mangaEndpoint',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      mangaEndpointIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mangaEndpoint',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nameMangaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameManga',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nameMangaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameManga',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> nameMangaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nameMangaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> nameMangaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> nameMangaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameManga',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nameMangaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> nameMangaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> nameMangaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameManga',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> nameMangaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameManga',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nameMangaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameManga',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nameMangaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameManga',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nextChapter',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nextChapter',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextChapter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nextChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nextChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nextChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nextChapter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextChapter',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      nextChapterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nextChapter',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prevChapter',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prevChapter',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prevChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prevChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prevChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prevChapter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prevChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prevChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prevChapter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prevChapter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prevChapter',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      prevChapterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prevChapter',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension ChapterDtoQueryObject
    on QueryBuilder<ChapterDto, ChapterDto, QFilterCondition> {
  QueryBuilder<ChapterDto, ChapterDto, QAfterFilterCondition> listImageElement(
      FilterQuery<ChapterImageDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'listImage');
    });
  }
}

extension ChapterDtoQueryLinks
    on QueryBuilder<ChapterDto, ChapterDto, QFilterCondition> {}

extension ChapterDtoQuerySortBy
    on QueryBuilder<ChapterDto, ChapterDto, QSortBy> {
  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByIdManga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idManga', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByIdMangaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idManga', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByIsDataLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDataLocal', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByIsDataLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDataLocal', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByMangaEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaEndpoint', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByMangaEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaEndpoint', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByNameManga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameManga', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByNameMangaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameManga', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByNextChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextChapter', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByNextChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextChapter', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByPrevChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prevChapter', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByPrevChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prevChapter', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ChapterDtoQuerySortThenBy
    on QueryBuilder<ChapterDto, ChapterDto, QSortThenBy> {
  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByIdManga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idManga', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByIdMangaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idManga', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByIsDataLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDataLocal', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByIsDataLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDataLocal', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByMangaEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaEndpoint', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByMangaEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mangaEndpoint', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByNameManga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameManga', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByNameMangaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameManga', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByNextChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextChapter', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByNextChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextChapter', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByPrevChapter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prevChapter', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByPrevChapterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prevChapter', Sort.desc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ChapterDtoQueryWhereDistinct
    on QueryBuilder<ChapterDto, ChapterDto, QDistinct> {
  QueryBuilder<ChapterDto, ChapterDto, QDistinct> distinctByEndpoint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endpoint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QDistinct> distinctByIdManga(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idManga', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QDistinct> distinctByIsDataLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDataLocal');
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QDistinct> distinctByMangaEndpoint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mangaEndpoint',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QDistinct> distinctByNameManga(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameManga', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QDistinct> distinctByNextChapter(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextChapter', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QDistinct> distinctByPrevChapter(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prevChapter', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDto, ChapterDto, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension ChapterDtoQueryProperty
    on QueryBuilder<ChapterDto, ChapterDto, QQueryProperty> {
  QueryBuilder<ChapterDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChapterDto, String?, QQueryOperations> endpointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endpoint');
    });
  }

  QueryBuilder<ChapterDto, String, QQueryOperations> idMangaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idManga');
    });
  }

  QueryBuilder<ChapterDto, bool, QQueryOperations> isDataLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDataLocal');
    });
  }

  QueryBuilder<ChapterDto, List<ChapterImageDto>, QQueryOperations>
      listImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listImage');
    });
  }

  QueryBuilder<ChapterDto, String?, QQueryOperations> mangaEndpointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mangaEndpoint');
    });
  }

  QueryBuilder<ChapterDto, String?, QQueryOperations> nameMangaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameManga');
    });
  }

  QueryBuilder<ChapterDto, String?, QQueryOperations> nextChapterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextChapter');
    });
  }

  QueryBuilder<ChapterDto, String?, QQueryOperations> prevChapterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prevChapter');
    });
  }

  QueryBuilder<ChapterDto, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
