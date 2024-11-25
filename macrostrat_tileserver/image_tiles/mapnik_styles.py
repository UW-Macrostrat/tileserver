"""
Generate mapnik XML for each map scale.
The stylesheets are regenerated every time the server is restarted.
"""

from os import environ
from pathlib import Path
from subprocess import check_output, CalledProcessError
from json import dumps
from .config import layer_order
from textwrap import dedent
from tempfile import NamedTemporaryFile

__here__ = Path(__file__).parent


def make_carto_stylesheet(scale, db_url):
    pg_credentials = get_credentials(db_url)

    line_sql = " UNION ALL ".join(
        f"SELECT * FROM lines.{s}" for s in layer_order[scale]
    )

    cartoCSS = (__here__ / "style.mss").read_text()

    webmercator_srs = "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over"

    polygon_query = dedent(
        f"""
    SELECT
        z.map_id,
        coalesce(nullif(l.color, ''), '#777777') AS color,
        z.geom FROM carto_new.{scale} z
    LEFT JOIN maps.map_legend
      ON z.map_id = map_legend.map_id
    LEFT JOIN maps.legend AS l
      ON l.legend_id = map_legend.legend_id
    LEFT JOIN maps.sources
      ON l.source_id = sources.source_id
    WHERE sources.status_code = 'active'
    """
    )

    line_query = dedent(
        f"""
        SELECT
            x.line_id,
            x.geom,
            q.direction,
            q.type
        FROM carto_new.lines_{scale} x
        LEFT JOIN ( {line_sql} ) q
          ON q.line_id = x.line_id
        LEFT JOIN maps.sources ON x.source_id = sources.source_id
        WHERE sources.status_code = 'active'
    """
    )

    return {
        "bounds": [-89, -179, 89, 179],
        "center": [0, 0, 1],
        "format": "png8",
        "interactivity": False,
        "minzoom": 0,
        "maxzoom": 16,
        "srs": webmercator_srs,
        "Stylesheet": [{"id": "burwell", "data": cartoCSS}],
        "Layer": [
            {
                "geometry": "polygon",
                "Datasource": {
                    "type": "postgis",
                    "table": f"({polygon_query}) subset",
                    "key_field": "map_id",
                    "geometry_field": "geom",
                    "extent_cache": "auto",
                    "extent": "-179,-89,179,89",
                    **pg_credentials,
                    "srid": "4326",
                },
                "id": f"units_{scale}",
                "class": "units",
                "srs-name": "WGS84",
                "srs": "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs",
                "advanced": {},
                "name": f"units_{scale}",
                "minZoom": "0",
                "maxZoom": "16",
            },
            {
                "geometry": "linestring",
                "Datasource": {
                    "type": "postgis",
                    "table": f"({line_query}) subset",
                    "key_field": "line_id",
                    "geometry_field": "geom",
                    "extent_cache": "auto",
                    "extent": "-179,-89,179,89",
                    **pg_credentials,
                    "srid": "4326",
                },
                "id": f"lines_{scale}",
                "class": "lines",
                "srs-name": "WGS84",
                "srs": "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs",
                "advanced": {},
                "name": f"lines_{scale}",
                "minZoom": "0",
                "maxZoom": "16",
            },
        ],
        "scale": 1,
        "metatile": 2,
        "name": "burwell",
        "description": "burwell",
        "attribution": "Data providers, UW-Macrostrat",
    }


def make_mapnik_xml(scale, db_url=None):
    """Make a mapnik xml file for a given scale"""
    carto = make_carto_stylesheet(scale, db_url)
    # Call out to carto to convert the cartoCSS to mapnik xml
    fn = f"/tmp/carto_{scale}.mml"
    with open(fn, "w") as f:
        f.write(dumps(carto))

    try:
        return check_output(["carto", f.name]).decode("utf-8")
    except CalledProcessError as exc:
        print("Status : FAIL", exc.returncode, exc.output)
        raise exc


def get_credentials(db_url=None):
    if db_url is None:
        # Return template credentials
        return {
            "host": "DATABASE_HOST",
            "port": "DATABASE_PORT",
            "user": "DATABASE_USER",
            "password": "DATABASE_PASSWORD",
            "dbname": "DATABASE_NAME",
        }

    return {
        "host": db_url.host,
        "port": db_url.port,
        "user": db_url.username,
        "password": db_url.password,
        "dbname": db_url.database,
    }
