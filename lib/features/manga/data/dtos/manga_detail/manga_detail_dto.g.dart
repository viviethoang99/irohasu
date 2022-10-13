// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_detail_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMangaDetailDtoCollection on Isar {
  IsarCollection<MangaDetailDto> get mangaDetailDtos => this.collection();
}

const MangaDetailDtoSchema = CollectionSchema(
  name: r'MangaDetailDto',
  id: -143768078462174378,
  properties: {
    r'author': PropertySchema(
      id: 0,
      name: r'author',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'dislike': PropertySchema(
      id: 2,
      name: r'dislike',
      type: IsarType.string,
    ),
    r'endpoint': PropertySchema(
      id: 3,
      name: r'endpoint',
      type: IsarType.string,
    ),
    r'like': PropertySchema(
      id: 4,
      name: r'like',
      type: IsarType.string,
    ),
    r'listChapter': PropertySchema(
      id: 5,
      name: r'listChapter',
      type: IsarType.objectList,
      target: r'ChapterItemDto',
    ),
    r'listGenres': PropertySchema(
      id: 6,
      name: r'listGenres',
      type: IsarType.objectList,
      target: r'GenresDto',
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.string,
    ),
    r'thumbnailUrl': PropertySchema(
      id: 8,
      name: r'thumbnailUrl',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 9,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _mangaDetailDtoEstimateSize,
  serialize: _mangaDetailDtoSerialize,
  deserialize: _mangaDetailDtoDeserialize,
  deserializeProp: _mangaDetailDtoDeserializeProp,
  idName: r'idManga',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'ChapterItemDto': ChapterItemDtoSchema,
    r'GenresDto': GenresDtoSchema
  },
  getId: _mangaDetailDtoGetId,
  getLinks: _mangaDetailDtoGetLinks,
  attach: _mangaDetailDtoAttach,
  version: '3.0.2',
);

int _mangaDetailDtoEstimateSize(
  MangaDetailDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.author;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dislike;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.endpoint.length * 3;
  {
    final value = object.like;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.listChapter.length * 3;
  {
    final offsets = allOffsets[ChapterItemDto]!;
    for (var i = 0; i < object.listChapter.length; i++) {
      final value = object.listChapter[i];
      bytesCount +=
          ChapterItemDtoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.listGenres.length * 3;
  {
    final offsets = allOffsets[GenresDto]!;
    for (var i = 0; i < object.listGenres.length; i++) {
      final value = object.listGenres[i];
      bytesCount += GenresDtoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.thumbnailUrl.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _mangaDetailDtoSerialize(
  MangaDetailDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.author);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.dislike);
  writer.writeString(offsets[3], object.endpoint);
  writer.writeString(offsets[4], object.like);
  writer.writeObjectList<ChapterItemDto>(
    offsets[5],
    allOffsets,
    ChapterItemDtoSchema.serialize,
    object.listChapter,
  );
  writer.writeObjectList<GenresDto>(
    offsets[6],
    allOffsets,
    GenresDtoSchema.serialize,
    object.listGenres,
  );
  writer.writeString(offsets[7], object.status);
  writer.writeString(offsets[8], object.thumbnailUrl);
  writer.writeString(offsets[9], object.title);
}

MangaDetailDto _mangaDetailDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MangaDetailDto(
    author: reader.readStringOrNull(offsets[0]),
    description: reader.readStringOrNull(offsets[1]),
    dislike: reader.readStringOrNull(offsets[2]),
    endpoint: reader.readString(offsets[3]),
    idManga: id,
    like: reader.readStringOrNull(offsets[4]),
    listChapter: reader.readObjectList<ChapterItemDto>(
          offsets[5],
          ChapterItemDtoSchema.deserialize,
          allOffsets,
          ChapterItemDto(),
        ) ??
        const [],
    listGenres: reader.readObjectList<GenresDto>(
          offsets[6],
          GenresDtoSchema.deserialize,
          allOffsets,
          GenresDto(),
        ) ??
        const [],
    status: reader.readStringOrNull(offsets[7]),
    thumbnailUrl: reader.readString(offsets[8]),
    title: reader.readString(offsets[9]),
  );
  return object;
}

P _mangaDetailDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<ChapterItemDto>(
            offset,
            ChapterItemDtoSchema.deserialize,
            allOffsets,
            ChapterItemDto(),
          ) ??
          const []) as P;
    case 6:
      return (reader.readObjectList<GenresDto>(
            offset,
            GenresDtoSchema.deserialize,
            allOffsets,
            GenresDto(),
          ) ??
          const []) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mangaDetailDtoGetId(MangaDetailDto object) {
  return object.idManga;
}

List<IsarLinkBase<dynamic>> _mangaDetailDtoGetLinks(MangaDetailDto object) {
  return [];
}

void _mangaDetailDtoAttach(
    IsarCollection<dynamic> col, Id id, MangaDetailDto object) {}

extension MangaDetailDtoQueryWhereSort
    on QueryBuilder<MangaDetailDto, MangaDetailDto, QWhere> {
  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterWhere> anyIdManga() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MangaDetailDtoQueryWhere
    on QueryBuilder<MangaDetailDto, MangaDetailDto, QWhereClause> {
  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterWhereClause>
      idMangaEqualTo(Id idManga) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: idManga,
        upper: idManga,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterWhereClause>
      idMangaNotEqualTo(Id idManga) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: idManga, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: idManga, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: idManga, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: idManga, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterWhereClause>
      idMangaGreaterThan(Id idManga, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: idManga, includeLower: include),
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterWhereClause>
      idMangaLessThan(Id idManga, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: idManga, includeUpper: include),
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterWhereClause>
      idMangaBetween(
    Id lowerIdManga,
    Id upperIdManga, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIdManga,
        includeLower: includeLower,
        upper: upperIdManga,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MangaDetailDtoQueryFilter
    on QueryBuilder<MangaDetailDto, MangaDetailDto, QFilterCondition> {
  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'author',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'author',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'author',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'author',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      authorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'author',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dislike',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dislike',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dislike',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dislike',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dislike',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dislike',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dislike',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dislike',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dislike',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dislike',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dislike',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      dislikeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dislike',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      endpointEqualTo(
    String value, {
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      endpointGreaterThan(
    String value, {
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      endpointLessThan(
    String value, {
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      endpointBetween(
    String lower,
    String upper, {
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      endpointEndsWith(
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      endpointContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'endpoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      endpointMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'endpoint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      endpointIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endpoint',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      endpointIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'endpoint',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      idMangaEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idManga',
        value: value,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      idMangaGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idManga',
        value: value,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      idMangaLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idManga',
        value: value,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      idMangaBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idManga',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'like',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'like',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'like',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'like',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'like',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'like',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'like',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'like',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'like',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'like',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'like',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      likeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'like',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listChapterLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listChapter',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listChapterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listChapter',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listChapterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listChapter',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listChapterLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listChapter',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listChapterLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listChapter',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listChapterLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listChapter',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listGenresLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listGenres',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listGenresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listGenres',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listGenresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listGenres',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listGenresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listGenres',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listGenresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listGenres',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listGenresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listGenres',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      thumbnailUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      thumbnailUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      thumbnailUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      thumbnailUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbnailUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      thumbnailUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      thumbnailUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      thumbnailUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbnailUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      thumbnailUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbnailUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      thumbnailUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      thumbnailUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbnailUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      titleEqualTo(
    String value, {
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      titleLessThan(
    String value, {
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      titleStartsWith(
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      titleEndsWith(
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

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension MangaDetailDtoQueryObject
    on QueryBuilder<MangaDetailDto, MangaDetailDto, QFilterCondition> {
  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listChapterElement(FilterQuery<ChapterItemDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'listChapter');
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterFilterCondition>
      listGenresElement(FilterQuery<GenresDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'listGenres');
    });
  }
}

extension MangaDetailDtoQueryLinks
    on QueryBuilder<MangaDetailDto, MangaDetailDto, QFilterCondition> {}

extension MangaDetailDtoQuerySortBy
    on QueryBuilder<MangaDetailDto, MangaDetailDto, QSortBy> {
  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> sortByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      sortByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> sortByDislike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislike', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      sortByDislikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislike', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> sortByEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      sortByEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> sortByLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'like', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> sortByLikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'like', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      sortByThumbnailUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      sortByThumbnailUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension MangaDetailDtoQuerySortThenBy
    on QueryBuilder<MangaDetailDto, MangaDetailDto, QSortThenBy> {
  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> thenByAuthor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      thenByAuthorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'author', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> thenByDislike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislike', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      thenByDislikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dislike', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> thenByEndpoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      thenByEndpointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endpoint', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> thenByIdManga() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idManga', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      thenByIdMangaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idManga', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> thenByLike() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'like', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> thenByLikeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'like', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      thenByThumbnailUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy>
      thenByThumbnailUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUrl', Sort.desc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension MangaDetailDtoQueryWhereDistinct
    on QueryBuilder<MangaDetailDto, MangaDetailDto, QDistinct> {
  QueryBuilder<MangaDetailDto, MangaDetailDto, QDistinct> distinctByAuthor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'author', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QDistinct> distinctByDislike(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dislike', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QDistinct> distinctByEndpoint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endpoint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QDistinct> distinctByLike(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'like', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QDistinct>
      distinctByThumbnailUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbnailUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MangaDetailDto, MangaDetailDto, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension MangaDetailDtoQueryProperty
    on QueryBuilder<MangaDetailDto, MangaDetailDto, QQueryProperty> {
  QueryBuilder<MangaDetailDto, int, QQueryOperations> idMangaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idManga');
    });
  }

  QueryBuilder<MangaDetailDto, String?, QQueryOperations> authorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'author');
    });
  }

  QueryBuilder<MangaDetailDto, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MangaDetailDto, String?, QQueryOperations> dislikeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dislike');
    });
  }

  QueryBuilder<MangaDetailDto, String, QQueryOperations> endpointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endpoint');
    });
  }

  QueryBuilder<MangaDetailDto, String?, QQueryOperations> likeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'like');
    });
  }

  QueryBuilder<MangaDetailDto, List<ChapterItemDto>, QQueryOperations>
      listChapterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listChapter');
    });
  }

  QueryBuilder<MangaDetailDto, List<GenresDto>, QQueryOperations>
      listGenresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listGenres');
    });
  }

  QueryBuilder<MangaDetailDto, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<MangaDetailDto, String, QQueryOperations>
      thumbnailUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbnailUrl');
    });
  }

  QueryBuilder<MangaDetailDto, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
