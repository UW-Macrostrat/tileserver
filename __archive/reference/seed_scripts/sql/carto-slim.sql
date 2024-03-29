/* Polygons */
SELECT
    z.map_id,
    z.source_id,
    l.legend_id,
    l.best_age_top :: numeric AS best_age_top,
    l.best_age_bottom :: numeric AS best_age_bottom,
    COALESCE(l.color, '#777777') AS color,
    l.lith_classes [1] AS lith_class1,
    l.lith_classes [2] AS lith_class2,
    l.lith_classes [3] AS lith_class3,
    l.lith_types [1] AS lith_type1,
    l.lith_types [2] AS lith_type2,
    l.lith_types [3] AS lith_type3,
    l.lith_types [4] AS lith_type4,
    l.lith_types [5] AS lith_type5,
    l.lith_types [6] AS lith_type6,
    l.lith_types [7] AS lith_type7,
    l.lith_types [8] AS lith_type8,
    l.lith_types [9] AS lith_type9,
    l.lith_types [10] AS lith_type10,
    l.lith_types [11] AS lith_type11,
    l.lith_types [12] AS lith_type12,
    l.lith_types [13] AS lith_type13,
    l.all_lith_classes [1] AS lith_class1,
    l.all_lith_classes [2] AS lith_class2,
    l.all_lith_classes [3] AS lith_class3,
    l.all_lith_types [1] AS lith_type1,
    l.all_lith_types [2] AS lith_type2,
    l.all_lith_types [3] AS lith_type3,
    l.all_lith_types [4] AS lith_type4,
    l.all_lith_types [5] AS lith_type5,
    l.all_lith_types [6] AS lith_type6,
    l.all_lith_types [7] AS lith_type7,
    l.all_lith_types [8] AS lith_type8,
    l.all_lith_types [9] AS lith_type9,
    l.all_lith_types [10] AS lith_type10,
    l.all_lith_types [11] AS lith_type11,
    l.all_lith_types [12] AS lith_type12,
    l.all_lith_types [13] AS lith_type13,
    z.geom
FROM
    carto_new.large z
    LEFT JOIN maps.map_legend ON z.map_id = map_legend.map_id
    LEFT JOIN maps.legend AS l ON l.legend_id = map_legend.legend_id
    LEFT JOIN maps.sources ON l.source_id = sources.source_id
WHERE
    sources.status_code = 'active';

SELECT
    z.map_id,
    z.source_id,
    l.legend_id,
    l.best_age_top :: numeric AS best_age_top,
    l.best_age_bottom :: numeric AS best_age_bottom,
    COALESCE(l.color, '#777777') AS color,
    l.lith_classes [1] AS lith_class1,
    l.lith_classes [2] AS lith_class2,
    l.lith_classes [3] AS lith_class3,
    l.lith_types [1] AS lith_type1,
    l.lith_types [2] AS lith_type2,
    l.lith_types [3] AS lith_type3,
    l.lith_types [4] AS lith_type4,
    l.lith_types [5] AS lith_type5,
    l.lith_types [6] AS lith_type6,
    l.lith_types [7] AS lith_type7,
    l.lith_types [8] AS lith_type8,
    l.lith_types [9] AS lith_type9,
    l.lith_types [10] AS lith_type10,
    l.lith_types [11] AS lith_type11,
    l.lith_types [12] AS lith_type12,
    l.lith_types [13] AS lith_type13,
    l.all_lith_classes [1] AS lith_class1,
    l.all_lith_classes [2] AS lith_class2,
    l.all_lith_classes [3] AS lith_class3,
    l.all_lith_types [1] AS lith_type1,
    l.all_lith_types [2] AS lith_type2,
    l.all_lith_types [3] AS lith_type3,
    l.all_lith_types [4] AS lith_type4,
    l.all_lith_types [5] AS lith_type5,
    l.all_lith_types [6] AS lith_type6,
    l.all_lith_types [7] AS lith_type7,
    l.all_lith_types [8] AS lith_type8,
    l.all_lith_types [9] AS lith_type9,
    l.all_lith_types [10] AS lith_type10,
    l.all_lith_types [11] AS lith_type11,
    l.all_lith_types [12] AS lith_type12,
    l.all_lith_types [13] AS lith_type13,
    z.geom
FROM
    carto_new.medium z
    LEFT JOIN maps.map_legend ON z.map_id = map_legend.map_id
    LEFT JOIN maps.legend AS l ON l.legend_id = map_legend.legend_id
    LEFT JOIN maps.sources ON l.source_id = sources.source_id
WHERE
    sources.status_code = 'active';

SELECT
    z.map_id,
    z.source_id,
    l.legend_id,
    l.best_age_top :: numeric AS best_age_top,
    l.best_age_bottom :: numeric AS best_age_bottom,
    COALESCE(l.color, '#777777') AS color,
    l.lith_classes [1] AS lith_class1,
    l.lith_classes [2] AS lith_class2,
    l.lith_classes [3] AS lith_class3,
    l.lith_types [1] AS lith_type1,
    l.lith_types [2] AS lith_type2,
    l.lith_types [3] AS lith_type3,
    l.lith_types [4] AS lith_type4,
    l.lith_types [5] AS lith_type5,
    l.lith_types [6] AS lith_type6,
    l.lith_types [7] AS lith_type7,
    l.lith_types [8] AS lith_type8,
    l.lith_types [9] AS lith_type9,
    l.lith_types [10] AS lith_type10,
    l.lith_types [11] AS lith_type11,
    l.lith_types [12] AS lith_type12,
    l.lith_types [13] AS lith_type13,
    l.all_lith_classes [1] AS lith_class1,
    l.all_lith_classes [2] AS lith_class2,
    l.all_lith_classes [3] AS lith_class3,
    l.all_lith_types [1] AS lith_type1,
    l.all_lith_types [2] AS lith_type2,
    l.all_lith_types [3] AS lith_type3,
    l.all_lith_types [4] AS lith_type4,
    l.all_lith_types [5] AS lith_type5,
    l.all_lith_types [6] AS lith_type6,
    l.all_lith_types [7] AS lith_type7,
    l.all_lith_types [8] AS lith_type8,
    l.all_lith_types [9] AS lith_type9,
    l.all_lith_types [10] AS lith_type10,
    l.all_lith_types [11] AS lith_type11,
    l.all_lith_types [12] AS lith_type12,
    l.all_lith_types [13] AS lith_type13,
    z.geom
FROM
    carto_new.small z
    LEFT JOIN maps.map_legend ON z.map_id = map_legend.map_id
    LEFT JOIN maps.legend AS l ON l.legend_id = map_legend.legend_id
    LEFT JOIN maps.sources ON l.source_id = sources.source_id
WHERE
    sources.status_code = 'active';

SELECT
    z.map_id,
    z.source_id,
    l.legend_id,
    l.best_age_top :: numeric AS best_age_top,
    l.best_age_bottom :: numeric AS best_age_bottom,
    COALESCE(l.color, '#777777') AS color,
    l.lith_classes [1] AS lith_class1,
    l.lith_classes [2] AS lith_class2,
    l.lith_classes [3] AS lith_class3,
    l.lith_types [1] AS lith_type1,
    l.lith_types [2] AS lith_type2,
    l.lith_types [3] AS lith_type3,
    l.lith_types [4] AS lith_type4,
    l.lith_types [5] AS lith_type5,
    l.lith_types [6] AS lith_type6,
    l.lith_types [7] AS lith_type7,
    l.lith_types [8] AS lith_type8,
    l.lith_types [9] AS lith_type9,
    l.lith_types [10] AS lith_type10,
    l.lith_types [11] AS lith_type11,
    l.lith_types [12] AS lith_type12,
    l.lith_types [13] AS lith_type13,
    l.all_lith_classes [1] AS lith_class1,
    l.all_lith_classes [2] AS lith_class2,
    l.all_lith_classes [3] AS lith_class3,
    l.all_lith_types [1] AS lith_type1,
    l.all_lith_types [2] AS lith_type2,
    l.all_lith_types [3] AS lith_type3,
    l.all_lith_types [4] AS lith_type4,
    l.all_lith_types [5] AS lith_type5,
    l.all_lith_types [6] AS lith_type6,
    l.all_lith_types [7] AS lith_type7,
    l.all_lith_types [8] AS lith_type8,
    l.all_lith_types [9] AS lith_type9,
    l.all_lith_types [10] AS lith_type10,
    l.all_lith_types [11] AS lith_type11,
    l.all_lith_types [12] AS lith_type12,
    l.all_lith_types [13] AS lith_type13,
    z.geom
FROM
    carto_new.tiny z
    LEFT JOIN maps.map_legend ON z.map_id = map_legend.map_id
    LEFT JOIN maps.legend AS l ON l.legend_id = map_legend.legend_id
    LEFT JOIN maps.sources ON l.source_id = sources.source_id
WHERE
    sources.status_code = 'active';

/* Lines */
SELECT
    x.line_id,
    x.source_id,
    COALESCE(q.descrip, '') AS descrip,
    COALESCE(q.name, '') AS name,
    COALESCE(q.new_direction, '') AS direction,
    COALESCE(q.new_type, '') AS type,
    x.geom
FROM
    carto_new.lines_large x
    LEFT JOIN (
        SELECT
            *
        FROM
            lines.medium
        UNION
        ALL
        SELECT
            *
        FROM
            lines.large
    ) q on q.line_id = x.line_id
    LEFT JOIN maps.sources ON x.source_id = sources.source_id
WHERE
    sources.status_code = 'active';

SELECT
    x.line_id,
    x.source_id,
    COALESCE(q.descrip, '') AS descrip,
    COALESCE(q.name, '') AS name,
    COALESCE(q.new_direction, '') AS direction,
    COALESCE(q.new_type, '') AS type,
    x.geom
FROM
    carto_new.lines_medium x
    LEFT JOIN (
        SELECT
            *
        FROM
            lines.medium
        UNION
        ALL
        SELECT
            *
        FROM
            lines.small
    ) q on q.line_id = x.line_id
    LEFT JOIN maps.sources ON x.source_id = sources.source_id
WHERE
    sources.status_code = 'active';

SELECT
    x.line_id,
    x.source_id,
    COALESCE(q.descrip, '') AS descrip,
    COALESCE(q.name, '') AS name,
    COALESCE(q.new_direction, '') AS direction,
    COALESCE(q.new_type, '') AS type,
    x.geom
FROM
    carto_new.lines_small x
    LEFT JOIN (
        SELECT
            *
        FROM
            lines.tiny
        UNION
        ALL
        SELECT
            *
        FROM
            lines.small
    ) q on q.line_id = x.line_id
    LEFT JOIN maps.sources ON x.source_id = sources.source_id
WHERE
    sources.status_code = 'active';

SELECT
    x.line_id,
    x.source_id,
    COALESCE(q.descrip, '') AS descrip,
    COALESCE(q.name, '') AS name,
    COALESCE(q.new_direction, '') AS direction,
    COALESCE(q.new_type, '') AS type,
    x.geom
FROM
    carto_new.lines_tiny x
    LEFT JOIN lines.tiny q on q.line_id = x.line_id
    LEFT JOIN maps.sources ON x.source_id = sources.source_id
WHERE
    sources.status_code = 'active';