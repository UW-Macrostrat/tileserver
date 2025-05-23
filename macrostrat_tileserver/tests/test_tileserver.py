"""
Tests for Macrostrat's tileserver v2
"""

import pytest
from mapbox_vector_tile import decode


@pytest.mark.legacy_raster
def test_mapnik_available():
    import mapnik

    assert mapnik


# x: 1554 y: 3078 z: 13
# x: 194 y: 384 z: 10
# source id: 251
# large

# tile 0, 0, 1
# North america


def test_database(db):
    assert db
    assert db.engine
    assert db.engine.url


@pytest.mark.parametrize(
    "source_id,z,x,y",
    [
        (251, 13, 1554, 3078),
        (251, 10, 194, 384),
        (154, 1, 0, 0),
    ],
)
def test_get_tile(client, source_id, z, x, y):
    res = client.get(f"/carto/{z}/{x}/{y}")
    assert res.status_code == 200
    assert res.headers["Content-Type"] == "application/x-protobuf"
    # Get the tile
    tile = res.content
    # Check that there are features
    assert len(tile) > 0

    res = decode(tile=tile)
    features = res["units"]["features"]
    assert len(features) > 0
    for feature in features:
        assert feature["properties"]["source_id"] == source_id

    if source_id == 154:
        return

    features = res["lines"]["features"]
    assert len(features) > 0
    for feature in features:
        assert feature["properties"]["source_id"] == source_id


def test_get_empty_tile(client):
    res = client.get("/carto/10/321/354")
    assert res.status_code == 200
    assert res.headers["Content-Type"] == "application/x-protobuf"
    # Get the tile
    tile = res.content
    # Check that there are features
    assert len(tile) == 0
