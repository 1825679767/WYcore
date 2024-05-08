-- DB update 2021_03_16_00 -> 2021_03_16_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_03_16_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_03_16_00 2021_03_16_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1614780387938120077'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1614780387938120077');

-- Rewrite positions for treasures for zone: Bloodmyst Isle
SET
@POOL            = '11647',
@POOLSIZE        = '10',
@POOLDESC        = 'Treasures - Bloodmyst Isle',
@GUID            = '2134739,2134839,2134840,2134842,2134843,2134844,2134845,2134846,2134847,2134848,2134849,2134850,2134851,2134852,2134853,2134854,2134855,2134856,2134857,2134858,2134859,2134860,2134861,2134862,2134863,2134864,2134865,2134866';

-- Create pool(s)
DELETE FROM `pool_template` WHERE `entry`=@POOL;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES (@POOL,@POOLSIZE,@POOLDESC);

-- Create new gameobjects
DELETE FROM `gameobject` WHERE FIND_IN_SET (`guid`,@GUID);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`ScriptName`,`VerifiedBuild`) VALUES
(2134739,2744,530,0,0,1,1,-1261.38,-11238.6,-13.6449,1.0906,-0,-0,-0.518675,-0.854971,300,0,1,'',0),
(2134839,2744,530,0,0,1,1,-2863.91,-11618.3,-5.93033,2.86749,-0,-0,-0.990623,-0.136623,300,0,1,'',0),
(2134840,2744,530,0,0,1,1,-2798.63,-11141.3,-10.9399,2.21168,-0,-0,-0.893841,-0.448384,300,0,1,'',0),
(2134842,2843,530,0,0,1,1,-2513.17,-12197,27.9889,4.05657,-0,-0,-0.897164,0.441698,300,0,1,'',0),
(2134843,2843,530,0,0,1,1,-1811.29,-11684.2,33.967,0.605613,-0,-0,-0.2982,-0.954503,300,0,1,'',0),
(2134844,2843,530,0,0,1,1,-1842.74,-10865.3,66.6934,4.98414,-0,-0,-0.604807,0.796372,300,0,1,'',0),
(2134845,2843,530,0,0,1,1,-1718.11,-11627.4,33.9657,0.00454903,-0,-0,-0.00227988,-0.999997,300,0,1,'',0),
(2134846,2843,530,0,0,1,1,-1181.16,-11596.2,1.54341,3.76754,-0,-0,-0.951423,0.307888,300,0,1,'',0),
(2134847,2843,530,0,0,1,1,-2079.26,-10763.4,69.2326,4.4909,-0,-0,-0.780922,0.624629,300,0,1,'',0),
(2134848,2744,530,0,0,1,1,-2853.07,-11699.8,-8.80678,3.47562,-0,-0,-0.986086,0.166238,300,0,1,'',0),
(2134849,2744,530,0,0,1,1,-1144.94,-11281.7,-25.0109,0.68078,-0,-0,-0.333855,-0.942625,300,0,1,'',0),
(2134850,2843,530,0,0,1,1,-2395.83,-12166.7,32.9864,2.70113,-0,-0,-0.975847,-0.218454,300,0,1,'',0),
(2134851,2744,530,0,0,1,1,-2870.3,-11438.9,-4.8373,3.30731,-0,-0,-0.996569,0.0827634,300,0,1,'',0),
(2134852,2843,530,0,0,1,1,-1816.84,-11555.3,34.0203,1.18437,-0,-0,-0.558176,-0.829723,300,0,1,'',0),
(2134853,2744,530,0,0,1,1,-2866.03,-11533.4,-4.60974,2.84393,-0,-0,-0.988945,-0.148282,300,0,1,'',0),
(2134854,2744,530,0,0,1,1,-1166.86,-11497.6,-8.0199,5.86472,-0,-0,-0.207709,0.978191,300,0,1,'',0),
(2134855,2843,530,0,0,1,1,-2531.96,-12277.7,14.1798,4.24256,-0,-0,-0.852271,0.5231,300,0,1,'',0),
(2134856,2843,530,0,0,1,1,-2260.09,-12316.7,57.2957,0.0229301,-0,-0,-0.0114662,-0.999934,300,0,1,'',0),
(2134857,2843,530,0,0,1,1,-1184.03,-11408.5,4.52845,2.35492,-0,-0,-0.923636,-0.38327,300,0,1,'',0),
(2134858,2843,530,0,0,1,1,-1534.97,-11343.4,67.9264,4.77946,-0,-0,-0.683002,0.730417,300,0,1,'',0),
(2134859,2843,530,0,0,1,1,-1313.58,-11248.4,-0.0693869,3.93579,-0,-0,-0.922187,0.386745,300,0,1,'',0),
(2134860,2843,530,0,0,1,1,-2410.07,-11215.9,24.3791,3.48748,-0,-0,-0.985082,0.172084,300,0,1,'',0),
(2134861,2843,530,0,0,1,1,-2012.65,-10853.5,62.2806,4.80301,-0,-0,-0.674351,0.738411,300,0,1,'',0),
(2134862,2744,530,0,0,1,1,-2178.61,-12541.6,-2.06022,4.7171,-0,-0,-0.705439,0.70877,300,0,1,'',0),
(2134863,2744,530,0,0,1,1,-1630.51,-12287,-16.0903,6.03923,-0,-0,-0.121674,0.99257,300,0,1,'',0),
(2134864,2744,530,0,0,1,1,-2796.47,-11794.8,-10.1966,4.30453,-0,-0,-0.835658,0.54925,300,0,1,'',0),
(2134865,2843,530,0,0,1,1,-2314.05,-11197.9,13.9445,2.10958,-0,-0,-0.869796,-0.493412,300,0,1,'',0),
(2134866,2843,530,0,0,1,1,-2818.34,-11215.6,1.89567,2.66721,-0,-0,-0.972002,-0.234973,300,0,1,'',0);

-- Add gameobjects to pools
DELETE FROM `pool_gameobject` WHERE FIND_IN_SET (`guid`,@GUID);
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES
(2134739,@POOL,0,@POOLDESC),
(2134839,@POOL,0,@POOLDESC),
(2134840,@POOL,0,@POOLDESC),
(2134842,@POOL,0,@POOLDESC),
(2134843,@POOL,0,@POOLDESC),
(2134844,@POOL,0,@POOLDESC),
(2134845,@POOL,0,@POOLDESC),
(2134846,@POOL,0,@POOLDESC),
(2134847,@POOL,0,@POOLDESC),
(2134848,@POOL,0,@POOLDESC),
(2134849,@POOL,0,@POOLDESC),
(2134850,@POOL,0,@POOLDESC),
(2134851,@POOL,0,@POOLDESC),
(2134852,@POOL,0,@POOLDESC),
(2134853,@POOL,0,@POOLDESC),
(2134854,@POOL,0,@POOLDESC),
(2134855,@POOL,0,@POOLDESC),
(2134856,@POOL,0,@POOLDESC),
(2134857,@POOL,0,@POOLDESC),
(2134858,@POOL,0,@POOLDESC),
(2134859,@POOL,0,@POOLDESC),
(2134860,@POOL,0,@POOLDESC),
(2134861,@POOL,0,@POOLDESC),
(2134862,@POOL,0,@POOLDESC),
(2134863,@POOL,0,@POOLDESC),
(2134864,@POOL,0,@POOLDESC),
(2134865,@POOL,0,@POOLDESC),
(2134866,@POOL,0,@POOLDESC);

-- Respawn rates of gameobjects is 5 minutes
UPDATE `gameobject` SET `spawntimesecs`=300 WHERE FIND_IN_SET (`guid`,@GUID);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
