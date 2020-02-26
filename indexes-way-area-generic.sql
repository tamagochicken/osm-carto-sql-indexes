CREATE INDEX ON  planet_osm_polygon USING gist (way)
            WHERE (landuse IN ('forest', 'farmland', 'residential', 'commercial', 'retail', 'industrial', 'meadow', 'grass', 'village_green', 'vineyard', 'orchard')
              OR "natural" IN ('wood', 'wetland', 'mud', 'sand', 'scree', 'shingle', 'bare_rock', 'heath', 'grassland', 'scrub'))
              AND way_area > 0.01*!pixel_width!::real*!pixel_height!::real
              AND building IS NULL;
--      minzoom: 5
--      maxzoom: 9
CREATE INDEX ON planet_osm_polygon USING gist (way)
            WHERE (landuse IS NOT NULL
              OR leisure IS NOT NULL
              OR aeroway IN ('apron', 'aerodrome')
              OR amenity IN ('parking', 'bicycle_parking', 'motorcycle_parking', 'taxi', 'university', 'college', 'school', 'hospital', 'kindergarten',
                             'grave_yard', 'place_of_worship', 'prison', 'clinic', 'ferry_terminal', 'marketplace', 'community_centre', 'social_facility',
                             'arts_centre', 'parking_space', 'bus_station', 'fire_station', 'police')
              OR man_made IN ('works', 'wastewater_plant','water_works')
              OR "natural" IN ('beach', 'shoal', 'heath', 'mud', 'wetland', 'grassland', 'wood', 'sand', 'scree', 'shingle', 'bare_rock', 'scrub')
              OR power IN ('station', 'sub_station', 'substation', 'generator')
              OR shop IN ('mall')
              OR tourism IN ('camp_site', 'caravan_site', 'picnic_site')
              OR highway IN ('services', 'rest_area')
              OR railway = 'station')
              AND way_area > 1*!pixel_width!::real*!pixel_height!::real ;
--      minzoom: 10
CREATE INDEX ON planet_osm_polygon USING gist (way)
          WHERE
            (waterway IN ('dock', 'riverbank')
              OR landuse IN ('reservoir', 'basin')
              OR "natural" IN ('water', 'glacier'))
            AND building IS NULL
            AND way_area > 1*!pixel_width!::real*!pixel_height!::real ;
--      minzoom: 0
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE ("natural" IN ('mud', 'wetland', 'wood', 'beach', 'shoal', 'reef', 'scrub', 'sand') OR landuse = 'forest')
            AND building IS NULL
            AND way_area > 1*!pixel_width!::real*!pixel_height!::real ;
--      minzoom: 5
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE (boundary IN ('aboriginal_lands', 'national_park')
                 OR leisure = 'nature_reserve'
                 OR (boundary = 'protected_area' AND tags->'protect_class' IN ('1','1a','1b','2','3','4','5','6','7','24','97','98','99')))
            AND building IS NULL
            AND way_area > 1*!pixel_width!::real*!pixel_height!::real ;
--      minzoom: 8
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE boundary = 'administrative'
            AND admin_level = '2'
            AND name IS NOT NULL
            AND way_area > 100*!pixel_width!::real*!pixel_height!::real
            AND osm_id < 0 ;
--      minzoom: 2
CREATE INDEX ON planet_osm_polygon USING GIST(way)
          WHERE boundary = 'administrative'
            AND admin_level = '4'
            AND name IS NOT NULL
            AND way_area > 100*!pixel_width!::real*!pixel_height!::real
            AND osm_id < 0 ;
--      minzoom: 4
