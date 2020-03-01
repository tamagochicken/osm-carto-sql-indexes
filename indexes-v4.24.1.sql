CREATE INDEX ON planet_osm_line USING gist (way)
           WHERE man_made = 'cutline';
-- minzoom 14
CREATE INDEX ON planet_osm_line USING gist (way)
          WHERE waterway IN ('stream', 'drain', 'ditch');
-- minzoom: 13
-- minzoom 14
CREATE INDEX ON planet_osm_line USING gist (way)
          WHERE waterway = 'river';
--      minzoom: 8
--      maxzoom: 11
CREATE INDEX ON planet_osm_line USING gist (way)
          WHERE waterway IN ('river', 'canal', 'stream', 'drain', 'ditch')
            AND (bridge IS NULL OR bridge NOT IN ('yes', 'aqueduct'));

--      minzoom: 12
CREATE INDEX ON planet_osm_polygon USING gist (way)
          WHERE leisure = 'marina';
--      minzoom: 14
CREATE INDEX ON planet_osm_line USING gist (way)
          WHERE waterway IN ('dam', 'weir', 'lock_gate');
--      minzoom: 13
CREATE INDEX ON planet_osm_polygon USING gist (way)
          WHERE waterway IN ('dam', 'weir', 'lock_gate');
--      minzoom: 13
CREATE INDEX ON planet_osm_polygon USING gist (way)
          WHERE man_made IN ('pier', 'breakwater', 'groyne');
--      minzoom: 12
CREATE INDEX ON planet_osm_line USING gist (way)
          WHERE man_made IN ('pier', 'breakwater', 'groyne');
--      minzoom: 12
CREATE INDEX ON planet_osm_point USING gist (way)
          WHERE waterway IN ('dam', 'weir', 'lock_gate');
--      minzoom: 17
CREATE INDEX ON planet_osm_polygon USING gist (way)
          WHERE man_made = 'bridge' ;
--      minzoom: 12
CREATE INDEX ON planet_osm_line USING gist (way)
              WHERE (tunnel = 'yes' OR tunnel = 'building_passage' OR covered = 'yes')
                AND highway IS NOT NULL ; -- end of road select
CREATE INDEX ON planet_osm_line USING gist (way)
              WHERE (tunnel = 'yes' OR tunnel = 'building_passage' OR covered = 'yes')
                AND (railway NOT IN ('platform') AND railway IS NOT NULL) ; -- end of rail select
--      minzoom: 10
CREATE INDEX ON planet_osm_polygon USING gist (way)
          WHERE (landuse = 'military'
            OR military = 'danger_area')
            AND building IS NULL ;
--      minzoom: 8
CREATE INDEX ON planet_osm_polygon USING gist (way)
          WHERE tourism = 'theme_park'
            OR tourism = 'zoo' ;
--      minzoom: 10
CREATE INDEX ON planet_osm_line USING gist (way) -- v4.24.1 && v4.25.0
            WHERE barrier IN ('chain', 'city_wall', 'embankment', 'ditch', 'fence', 'guard_rail',
                  'handrail', 'hedge', 'kerb', 'retaining_wall', 'wall')
              OR historic = 'citywalls'
              AND (waterway IS NULL OR waterway NOT IN ('river', 'canal', 'stream', 'drain', 'ditch'));
--      minzoom: 14              
CREATE INDEX ON planet_osm_polygon USING gist (way) -- v4.25.0
            WHERE barrier IN ('chain', 'city_wall', 'embankment', 'ditch', 'fence', 'guard_rail',
                  'handrail', 'hedge', 'kerb', 'retaining_wall', 'wall')
              OR historic = 'citywalls'
              AND (waterway IS NULL OR waterway NOT IN ('river', 'canal', 'stream', 'drain', 'ditch'));
--      minzoom: 15
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE "natural" = 'cliff' OR man_made = 'embankment';
--      minzoom: 13
CREATE INDEX ON planet_osm_polygon USING GIST(way) -- v4.24.1 only
            WHERE (barrier IN ('chain', 'city_wall', 'embankment', 'ditch', 'fence', 'guard_rail',
                  'handrail', 'hedge', 'kerb', 'retaining_wall', 'wall')
              OR historic = 'citywalls')
              AND building IS NULL ;
--      minzoom: 16
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE route = 'ferry'
            AND osm_id > 0;
--      minzoom: 8
CREATE INDEX ON planet_osm_point USING gist (way)
          WHERE highway = 'turning_circle'
            OR highway = 'turning_loop';
--      minzoom: 15
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE highway IN ('residential', 'unclassified', 'pedestrian', 'service', 'footway', 'track', 'path', 'platform')
            OR (railway IN ('platform')
                AND (tags->'location' NOT IN ('underground') OR (tags->'location') IS NULL)
                AND (tunnel NOT IN ('yes', 'building_passage') OR tunnel IS NULL)
                AND (covered NOT IN ('yes') OR covered IS NULL));
--      minzoom: 14
CREATE INDEX ON planet_osm_line USING GIST(way)
              WHERE (tunnel IS NULL OR NOT tunnel IN ('yes', 'building_passage'))
                AND (covered IS NULL OR NOT covered = 'yes')
                AND (bridge IS NULL OR NOT bridge IN ('yes', 'boardwalk', 'cantilever', 'covered', 'low_water_crossing', 'movable', 'trestle', 'viaduct'))
                AND highway IS NOT NULL ; -- end of road select
CREATE INDEX ON planet_osm_line USING GIST(way)
              WHERE (tunnel IS NULL OR NOT tunnel IN ('yes', 'building_passage'))
                AND (covered IS NULL OR NOT covered = 'yes')
                AND (bridge IS NULL OR NOT bridge IN ('yes', 'boardwalk', 'cantilever', 'covered', 'low_water_crossing', 'movable', 'trestle', 'viaduct'))
                AND railway IS NOT NULL ; -- end of rail select
--      minzoom: 10
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE highway IN ('residential', 'unclassified', 'pedestrian', 'service', 'footway', 'living_street', 'track', 'path', 'platform', 'services')
            OR (railway IN ('platform')
                AND (tags->'location' NOT IN ('underground') OR (tags->'location') IS NULL)
                AND (tunnel NOT IN ('yes', 'building_passage') OR tunnel IS NULL)
                AND (covered NOT IN ('yes') OR covered IS NULL))
            OR aeroway IN ('runway', 'taxiway', 'helipad');
--      minzoom: 14
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE aerialway IS NOT NULL ;
--      minzoom: 12
CREATE INDEX ON planet_osm_roads USING GIST(way)
          WHERE highway IS NOT NULL
            OR (railway IS NOT NULL AND railway != 'preserved'
              AND (service IS NULL OR service NOT IN ('spur', 'siding', 'yard')));
--      minzoom: 6
--      maxzoom: 9
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE waterway IN ('river', 'canal', 'stream', 'drain', 'ditch')
            AND bridge IN ('yes', 'aqueduct');
--      minzoom: 12
CREATE INDEX ON planet_osm_line USING GIST(way)
              WHERE bridge IN ('yes', 'boardwalk', 'cantilever', 'covered', 'low_water_crossing', 'movable', 'trestle', 'viaduct')
                AND highway IS NOT NULL ; -- end of road select
CREATE INDEX ON planet_osm_line USING GIST(way)
              WHERE bridge IN ('yes', 'boardwalk', 'cantilever', 'covered', 'low_water_crossing', 'movable', 'trestle', 'viaduct')
                AND railway IS NOT NULL ; -- end of rail select
--      minzoom: 10
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE highway = 'bus_guideway';
--      minzoom: 11
CREATE INDEX ON planet_osm_point USING GIST(way)
          WHERE (tags->'entrance') IS NOT NULL AND
            (tags->'indoor' = 'no'
            OR (tags->'indoor') IS NULL)) ;
--      minzoom: 18
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE aeroway IN ('runway', 'taxiway');
--      minzoom: 11
CREATE INDEX ON planet_osm_roads USING GIST(way)
          WHERE boundary = 'administrative'
            AND admin_level IN ('0', '1', '2', '3', '4')
            AND osm_id < 0 ;
--      minzoom: 4
--      maxzoom: 10
CREATE INDEX ON planet_osm_roads USING GIST(way)
          WHERE boundary = 'administrative'
            AND admin_level IN ('0', '1', '2', '3', '4', '5', '6', '7', '8')
            AND osm_id < 0 ;
--      minzoom: 11
--      maxzoom: 12
CREATE INDEX ON planet_osm_roads USING GIST(way)
          WHERE boundary = 'administrative'
            AND admin_level IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10')
            AND osm_id < 0 ;
--      minzoom: 13
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE power = 'minor_line' ;
--      minzoom: 16
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE power = 'line'
            OR (power = 'cable' AND tags->'location' IN ('overground', 'overhead', 'surface', 'outdoor', 'platform'));
--      minzoom: 14
CREATE INDEX ON planet_osm_point USING GIST(way)
          WHERE "natural" = 'tree';
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE "natural" = 'tree_row';
--      minzoom: 16
CREATE INDEX ON planet_osm_point USING GIST(way)
          WHERE place IN ('city', 'town', 'village', 'hamlet')
            AND name IS NOT NULL
            AND tags @> 'capital=>yes' ;
--      minzoom: 3
--      maxzoom: 15
CREATE INDEX ON planet_osm_point USING GIST(way)
              WHERE place IN ('city', 'town')
                AND name IS NOT NULL
                AND NOT (tags @> 'capital=>yes') ;
--      minzoom: 4
--      maxzoom: 15
CREATE INDEX ON planet_osm_point USING GIST(way)
          WHERE place IN ('village', 'hamlet')
             AND name IS NOT NULL
             AND NOT tags @> 'capital=>yes'
             OR (place IN ('suburb', 'quarter', 'neighbourhood', 'isolated_dwelling', 'farm')
                 OR (place IN ('square')
                     AND (leisure is NULL OR NOT leisure IN ('park', 'recreation_ground', 'garden')))
             ) AND name IS NOT NULL ;
--      minzoom: 12
CREATE INDEX ON planet_osm_polygon USING GIST(way)
            WHERE railway IN ('station', 'halt', 'tram_stop')
            OR railway = 'subway_entrance' AND way_area IS NULL
            OR aerialway = 'station';
CREATE INDEX ON planet_osm_point USING GIST(way)
            WHERE railway IN ('station', 'halt', 'tram_stop')
            OR railway = 'subway_entrance'
            OR aerialway = 'station';
--      minzoom: 12
CREATE INDEX ON planet_osm_point USING GIST(way)
          WHERE highway = 'motorway_junction' OR highway = 'traffic_signals' OR junction = 'yes';
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE junction = 'yes';
--      minzoom: 11
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE man_made = 'bridge';
--      minzoom: 11
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE tags @> 'ford=>yes' OR tags @> 'ford=>stepping_stones'
            OR leisure IN ('slipway', 'track')
            OR tags @> 'attraction=>water_slide';
--      minzoom: 16
CREATE INDEX ON planet_osm_point USING GIST(way)
        WHERE power IN ('tower', 'pole');
--      minzoom: 14
CREATE INDEX ON planet_osm_roads USING GIST(way)
                  WHERE highway IN ('motorway', 'trunk', 'primary', 'secondary')
                  AND ref IS NOT NULL ;
--      minzoom: 10
--      maxzoom: 12
CREATE INDEX ON planet_osm_line USING GIST(way)
                  WHERE (highway IN ('motorway', 'trunk', 'primary', 'secondary', 'tertiary') OR aeroway IN ('runway', 'taxiway'))
                    AND ref IS NOT NULL;
--      minzoom: 13
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE highway IN ('residential', 'unclassified', 'pedestrian', 'service', 'footway', 'cycleway', 'living_street', 'track', 'path', 'platform')
            OR (railway IN ('platform')
                AND (tags->'location' NOT IN ('underground') OR (tags->'location') IS NULL)
                AND (tunnel NOT IN ('yes', 'building_passage') OR tunnel IS NULL)
                AND (covered NOT IN ('yes') OR covered IS NULL))
            OR (place IN ('square')
                AND (leisure IS NULL OR NOT leisure IN ('park', 'recreation_ground', 'garden')))
            AND name IS NOT NULL;
--      minzoom: 15
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary',
                            'tertiary_link', 'residential', 'unclassified', 'road', 'service', 'pedestrian', 'raceway', 'living_street', 'construction')
            AND (name IS NOT NULL
              OR oneway IN ('yes', '-1')
              OR junction IN ('roundabout'));
--      minzoom: 13
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE highway IN ('bridleway', 'footway', 'cycleway', 'path', 'track', 'steps', 'construction')
            AND (name IS NOT NULL
              OR oneway IN ('yes', '-1')
              OR junction IN ('roundabout'));
--      minzoom: 15
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE railway IN ('rail', 'subway', 'narrow_gauge', 'light_rail', 'preserved', 'funicular',
                            'monorail', 'miniature', 'tram', 'disused', 'construction')
            AND (tunnel IS NULL OR NOT tunnel IN ('yes', 'building_passage'))
            AND highway IS NULL -- Prevent duplicate rendering
            AND name IS NOT NULL ;
--      minzoom: 11
CREATE INDEX ON planet_osm_line USING GIST(way)
                  WHERE highway IN ('unclassified', 'residential', 'track')
                    AND ref IS NOT NULL ;
--      minzoom: 15
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE (landuse IN ('forest', 'military', 'farmland')
              OR military IN ('danger_area')
              OR "natural" IN ('wood', 'glacier', 'sand', 'scree', 'shingle', 'bare_rock', 'water', 'bay', 'strait')
              OR "place" IN ('island')
              OR boundary IN ('aboriginal_lands', 'national_park')
              OR (boundary = 'protected_area' AND tags->'protect_class' IN ('1','1a','1b','2','3','4','5','6','7','24','97','98','99'))
              OR leisure IN ('nature_reserve'))
            AND building IS NULL
            AND name IS NOT NULL;
--      minzoom: 0
--      maxzoom: 9
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE (man_made IN ('pier', 'breakwater', 'groyne', 'embankment')
              OR waterway IN ('dam', 'weir')
              OR "natural" IN ('cliff'))
            AND name IS NOT NULL;
--      minzoom: 10
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE building IS NOT NULL
            AND building NOT IN ('no')
            AND name IS NOT NULL;
--      minzoom: 14
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE "addr:interpolation" IS NOT NULL;
--      minzoom: 17
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE (("addr:housenumber" IS NOT NULL) OR ("addr:housename" IS NOT NULL) OR ((tags->'addr:unit') IS NOT NULL))
            AND building IS NOT NULL;
CREATE INDEX ON planet_osm_point USING GIST(way)
          WHERE (("addr:housenumber" IS NOT NULL) OR ("addr:housename" IS NOT NULL) OR ((tags->'addr:unit') IS NOT NULL));
--      minzoom: 17
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE (waterway IN ('river', 'canal', 'stream', 'drain', 'ditch')
                 OR "natural" IN ('bay', 'strait'))
            AND (tunnel IS NULL or tunnel != 'culvert')
            AND name IS NOT NULL;
--      minzoom: 13
CREATE INDEX ON planet_osm_line USING GIST(way)
          WHERE route = 'ferry'
            AND osm_id > 0
            AND name IS NOT NULL;
--      minzoom: 13
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE boundary = 'administrative'
            AND admin_level IN ('1', '2', '3', '4', '5', '6', '7', '8', '9', '10')
            AND name IS NOT NULL
            AND osm_id < 0;
--      minzoom: 11
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE (boundary IN ('aboriginal_lands', 'national_park')
                 OR leisure = 'nature_reserve'
                 OR (boundary = 'protected_area' AND tags->'protect_class' IN ('1','1a','1b','2','3','4','5','6','7','24','97','98','99')))
            AND name IS NOT NULL;
--      minzoom: 13
CREATE INDEX ON planet_osm_polygon USING GIST(way)
            WHERE highway IN ('mini_roundabout')
               OR railway IN ('level_crossing', 'crossing')
               OR amenity IN ('bench', 'waste_basket', 'waste_disposal')
               OR historic IN ('wayside_cross', 'wayside_shrine')
               OR man_made IN ('cross')
               OR barrier IN ('bollard', 'gate', 'lift_gate', 'swing_gate', 'block', 'log', 'cattle_grid', 'stile', 'motorcycle_barrier', 'cycle_barrier', 'full-height_turnstile', 'turnstile', 'kissing_gate');
CREATE INDEX ON planet_osm_point USING GIST(way)
            WHERE highway IN ('mini_roundabout')
               OR railway IN ('level_crossing', 'crossing')
               OR amenity IN ('bench', 'waste_basket', 'waste_disposal')
               OR historic IN ('wayside_cross', 'wayside_shrine')
               OR man_made IN ('cross')
               OR barrier IN ('bollard', 'gate', 'lift_gate', 'swing_gate', 'block', 'log', 'cattle_grid', 'stile', 'motorcycle_barrier', 'cycle_barrier', 'full-height_turnstile', 'turnstile', 'kissing_gate');
--      minzoom: 14