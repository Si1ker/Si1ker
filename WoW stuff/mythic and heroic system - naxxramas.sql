-- This SQL will create all triggers for heroic and mythic system --

/* == Aura info ==
Aura mítico: 55086 | on-reset 50657
Aura heroica: 31309 | on-reset 50910

= Heroico =
56257: +20% hp
64036 (x4): +20% dmg

= Mitico =
43833: +100% hp
68335: +50% dmg
25184: +100% speed

- etc:
57086: 50% melee
56259: 20% melee
*/

-- ******** Triggers ********

-- creature _template
DELETE FROM `creature_template` WHERE `entry` IN (500020, 500021);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `VerifiedBuild`) VALUES 
('500020', '0', '0', '0', '0', '0', '10553', '0', '0', '0', 'Esencia heroica', '', 'Attack', '0', '80', '80', '0', '2000', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1', '60000', '60000', '1', '131072', '2048', '0', '0', '0', '0', '0', '0', '1', '1', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'PassiveAI', '0', '1', '1', '1.9', '1', '1', '0', '0', '1', '617299839', '20', '12340'),
('500021', '0', '0', '0', '0', '0', '10553', '0', '0', '0', 'Esencia mítica', '', 'Attack', '0', '80', '80', '0', '2000', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1', '60000', '60000', '1', '131072', '2048', '0', '0', '0', '0', '0', '0', '1', '1', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'PassiveAI', '0', '1', '1', '1.9', '1', '1', '0', '0', '1', '617299839', '20', '12340');

-- creature_temlate_addon
DELETE FROM `creature_template_addon` WHERE `entry` IN (500020, 500021);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`) VALUES 
('500020', '0', '0', '0', '0', '0', '0', '31309'),
('500021', '0', '0', '0', '0', '0', '0', '55086');


/*
 = = Naxxramas = =
 
-- hc = LootMode(3)
-- mt = LootMode(7)

10
nm normal loot
hc normal loot + item adicional
mt heroic loot + item lvl.213 + 25% atiesh

25
nm normal loot
hc normal loot + item adicional
mt heroic loot + item lvl.219 + 50% atiesh
*/

-- Add remastered items
DELETE FROM `item_template` WHERE `entry` IN (22800, 23075, 22816, 23014, 22809, 22799, 22988, 22818, 22807);
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES
(22800, 2, 10, -1, 'Brimstone Staff', 35241, 4, 4104, 0, 1, 528092, 105618, 17, -1, -1, 219, 80, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 5, 7, 79, 5, 78, 32, 110, 31, 72, 45, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 278, 546, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3200, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 120, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 2952, 0, 375, -23.9, 0, 0, 0, '', 69, 0, 0, 0, 0, 12340),
(23075, 4, 6, -1, 'Death\'s Bargain', 35654, 4, 4104, 0, 1, 287014, 57402, 14, -1, -1, 219, 80, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 5, 7, 46, 5, 42, 45, 67, 32, 33, 43, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 6, 4, 0, 0, 214, 0, 120, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 3752, 0, 375, 0, 0, 0, 0, '', 69, 0, 0, 0, 0, 12340),
(22816, 2, 0, -1, 'Hatchet of Sundered Bone', 35258, 4, 528392, 0, 1, 459852, 91970, 13, -1, -1, 219, 80, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 5, 3, 33, 7, 49, 32, 32, 38, 86, 36, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 294, 549, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2600, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 105, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 2952, 0, 375, 0, 0, 0, 0, '', 69, 0, 0, 0, 0, 12340),
(23014, 2, 7, -1, 'Iblis, Blade of the Fallen Seraph', 36376, 4, 528392, 0, 1, 426191, 85238, 13, -1, -1, 219, 80, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 5, 3, 42, 7, 31, 32, 30, 38, 57, 31, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 232, 350, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1800, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 105, 0, 0, 0, 0, 4, 1, 0, 0, 0, 0, 2873, 0, 375, 0, 0, 0, 0, '', 69, 0, 0, 0, 0, 12340),
(22809, 2, 5, -1, 'Maul of the Redeemed Crusader', 36518, 4, 4104, 0, 1, 560738, 112147, 17, -1, -1, 219, 80, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 4, 4, 105, 7, 89, 32, 94, 36, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 609, 914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3600, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 120, 0, 0, 0, 0, 4, 1, 0, 0, 0, 0, 2927, 0, 375, 0, 0, 0, 0, '', 69, 0, 0, 0, 0, 12340),
(22799, 2, 10, -1, 'Soulseeker', 35240, 4, 4104, 0, 1, 559447, 111889, 17, -1, -1, 226, 80, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 5, 7, 85, 5, 85, 32, 96, 45, 520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 318, 582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3200, 0, 0, 45054, 1, 0, 10, 15000, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 120, 0, 0, 0, 0, 2, 1, 8, 1, 0, 0, 3753, 0, 375, -31.5, 0, 0, 0, '', 69, 0, 0, 0, 0, 12340),
(22988, 2, 4, -1, 'The End of Dreams', 35710, 4, 4104, 0, 1, 425804, 85160, 21, 32767, -1, 219, 80, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 4, 5, 43, 7, 43, 43, 20, 45, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80, 254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1900, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 1, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 105, 0, 0, 0, 0, 4, 1, 0, 0, 0, 0, 2952, 0, 375, -21.8, 0, 0, 0, '', 69, 0, 0, 0, 0, 12340),
(22818, 4, 6, -1, 'The Plague Bearer', 35577, 4, 4104, 0, 1, 268280, 53656, 14, -1, -1, 219, 80, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 5, 4, 37, 7, 63, 12, 42, 14, 29, 37, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7892, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 6, 4, 0, 0, 217, 0, 120, 0, 0, 0, 0, 8, 1, 0, 0, 0, 0, 2882, 0, 375, 0, 0, 0, 0, '', 69, 0, 0, 0, 0, 12340),
(22807, 2, 7, -1, 'Wraith Blade', 36371, 4, 4104, 0, 1, 433735, 86747, 21, -1, -1, 219, 80, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 5, 7, 64, 5, 43, 32, 43, 31, 31, 45, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 70, 228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1800, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 105, 0, 0, 0, 0, 4, 1, 0, 0, 0, 0, 3308, 0, 225, -23.9, 0, 0, 0, '', 69, 0, 0, 0, 0, 12340);
-- Create reference for remastered items
DELETE FROM `reference_loot_template` WHERE `Entry`=500000;
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
('500000', '22800', '0', '0', '0', '1', '1', '1', '1', 'Naxx40 remaster'),
('500000', '23075', '0', '0', '0', '1', '1', '1', '1', 'Naxx40 remaster'),
('500000', '22816', '0', '0', '0', '1', '1', '1', '1', 'Naxx40 remaster'),
('500000', '23014', '0', '0', '0', '1', '1', '1', '1', 'Naxx40 remaster'),
('500000', '22809', '0', '0', '0', '1', '1', '1', '1', 'Naxx40 remaster'),
('500000', '22799', '0', '0', '0', '1', '1', '1', '1', 'Naxx40 remaster'),
('500000', '22988', '0', '0', '0', '1', '1', '1', '1', 'Naxx40 remaster'),
('500000', '22818', '0', '0', '0', '1', '1', '1', '1', 'Naxx40 remaster'),
('500000', '22807', '0', '0', '0', '1', '1', '1', '1', 'Naxx40 remaster');

-- creature_loot_template
DELETE FROM `creature_loot_template` WHERE `Comment`='10 heroic';
DELETE FROM `creature_loot_template` WHERE `Comment`='10 mythic';
DELETE FROM `creature_loot_template` WHERE `Comment`='10 atiesh';
DELETE FROM `creature_loot_template` WHERE `Comment`='25 heroic';
DELETE FROM `creature_loot_template` WHERE `Comment`='25 mythic';
DELETE FROM `creature_loot_template` WHERE `Comment`='25 atiesh';
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 

-- Anub'Rehkan 10
('15956', '2', '34098', '100', '0', '2', '0', '1', '1', '10 heroic'),
('15956', '3', '34137', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15956', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Anub'Rehkan 25
('29249', '2', '34137', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29249', '3', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29249', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),

-- Faerlina 10
('15953', '2', '34099', '100', '0', '2', '0', '1', '1', '10 heroic'),
('15953', '3', '34138', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15953', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Faerlina 25
('29268', '2', '34138', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29268', '3', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29268', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),

-- Maexxna 10
('15952', '2', '34040', '100', '0', '2', '0', '1', '1', '10 heroic'),
('15952', '3', '34139', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15952', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Maexxna 25
('29278', '2', '34139', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29278', '3', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29278', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),


-- Noth 10
('15954', '2', '34042', '100', '0', '2', '0', '1', '1', '10 heroic'),
('15954', '3', '34147', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15954', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Noth 25
('29615', '2', '34147', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29615', '3', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29615', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),

-- Heigan 10
('15936', '2', '34041', '100', '0', '2', '0', '1', '1', '10 heroic'),
('15936', '3', '34148', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15936', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Heigan 25
('29701', '2', '34148', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29701', '3', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29701', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),

-- Loatheb 10
('16011', '39472', '0', '100', '0', '2', '0', '1', '1', '10 heroic'),
('16011', '1', '34149', '100', '0', '4', '0', '1', '1', '10 mythic'),
('16011', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Loatheb 25
('29718', '3', '34149', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29718', '4', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29718', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),


-- Razuvious 10
('16061', '2', '34102', '100', '0', '2', '0', '1', '1', '10 heroic'),
('16061', '3', '34144', '100', '0', '4', '0', '1', '1', '10 mythic'),
('16061', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Razuvious 25
('29940', '2', '34144', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29940', '3', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29940', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),

-- Gothik 10
('16060', '2', '34103', '100', '0', '2', '0', '1', '1', '10 heroic'),
('16060', '3', '34145', '100', '0', '4', '0', '1', '1', '10 mythic'),
('16060', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Gothik 25
('29955', '2', '34145', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29955', '3', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29955', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh');




/* Horsemen */
DELETE FROM `gameobject_template` WHERE `entry`=500000;
DELETE FROM `gameobject_template` WHERE `entry`=500001;
DELETE FROM `gameobject_template` WHERE `entry`=500002;
DELETE FROM `gameobject_template` WHERE `entry`=500003;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `VerifiedBuild`) VALUES 
-- Horsemen 10 HC
('500000', '3', '1387', 'Pequeño cofre heroico de los Cuatro Jinetes', '1', '1634', '500000', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
-- Horsemen 10 MT
('500001', '3', '1387', 'Pequeño cofre mítico de los Cuatro Jinetes', '1', '1634', '500001', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
-- Horsemen 25 HC
('500002', '3', '1387', 'Gran cofre heroico de los Cuatro Jinetes', '1', '1634', '500002', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1'),
-- Horsemen 25 MT
('500003', '3', '1387', 'Gran cofre mítico de los Cuatro Jinetes', '1', '1634', '500003', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1');

DELETE FROM `gameobject_loot_template` WHERE `Comment`='10 heroic';
DELETE FROM `gameobject_loot_template` WHERE `Comment`='10 mythic';
DELETE FROM `gameobject_loot_template` WHERE `Comment`='10 atiesh';
DELETE FROM `gameobject_loot_template` WHERE `Comment`='25 heroic';
DELETE FROM `gameobject_loot_template` WHERE `Comment`='25 mythic';
DELETE FROM `gameobject_loot_template` WHERE `Comment`='25 atiesh';
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
-- Horsemen 10 HC
('500000', '39427', '0', '100', '0', '1', '0', '1', '1', '10 heroic'),
-- Horsemen 10 MT
('500001', '1', '34146', '100', '0', '1', '0', '1', '1', '10 mythic'),
('500001', '22726', '0', '25', '0', '1', '0', '1', '1', '10 atiesh'),
-- Horsemen 25 HC
('500002', '1', '34146', '100', '0', '1', '0', '1', '1', '25 heroic'),
-- Horsemen 25 MT
('500003', '1', '500000', '100', '0', '1', '0', '1', '1', '25 mythic'),
('500003', '22726', '0', '50', '0', '1', '0', '1', '1', '25 atiesh');




INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 

-- Patchwerk 10
('16028', '2', '34100', '100', '0', '2', '0', '1', '1', '10 heroic'),
('16028', '3', '34140', '100', '0', '4', '0', '1', '1', '10 mythic'),
('16028', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Patchwerk 25
('29324', '2', '34140', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29324', '3', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29324', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),

-- Grobbulus 10
('15931', '2', '34101', '100', '0', '2', '0', '1', '1', '10 heroic'),
('15931', '3', '34141', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15931', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Grobbulus 25
('29373', '2', '34141', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29373', '3', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29373', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),

-- Gluth 10
('15932', '39473', '0', '100', '0', '2', '0', '1', '1', '10 heroic'),
('15932', '1', '34142', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15932', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Gluth 25
('29417', '3', '34142', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29417', '4', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29417', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),

-- Thaddius 10
('15928', '39467', '0', '100', '0', '2', '0', '1', '1', '10 heroic'),
('15928', '1', '34143', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15928', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Thaddius 25
('29448', '3', '34143', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29448', '4', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29448', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),


-- Sapphiron 10
('15989', '2', '34043', '100', '0', '2', '0', '1', '1', '10 heroic'),
('15989', '3', '34135', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15989', '22726', '0', '25', '0', '4', '0', '1', '1', '10 atiesh'),
-- Sapphiron 25
('29991', '2', '34135', '100', '0', '2', '0', '1', '1', '25 heroic'),
('29991', '3', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('29991', '22726', '0', '50', '0', '4', '0', '1', '1', '25 atiesh'),

-- Kel'Thuzad 10
('15990', '2', '34044', '100', '0', '2', '0', '1', '1', '10 heroic'),
('15990', '3', '34136', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15990', '13335', '0', '100', '0', '4', '0', '1', '1', '10 mythic'),
('15990', '22726', '0', '25', '0', '4', '0', '2', '2', '10 atiesh'),
-- Kel'Thuzad 25
('30061', '3', '34136', '100', '0', '2', '0', '1', '1', '25 heroic'),
('30061', '4', '500000', '100', '0', '4', '0', '1', '1', '25 mythic'),
('30061', '13335', '0', '100', '0', '4', '0', '1', '1', '25 mythic'),
('30061', '22726', '0', '50', '0', '4', '0', '2', '2', '25 atiesh');



