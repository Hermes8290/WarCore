-- TDB 335.64 auth
UPDATE `updates` SET `state`='ARCHIVED';
DELETE FROM `rbac_permissions` WHERE `id`=872;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(872, 'Command: server debug');
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
(196, 872);
DELETE FROM `rbac_permissions` WHERE `id` = 873;
INSERT INTO `rbac_permissions` (`id`,`name`) VALUES
(873, 'Command: reload creature_movement_override');

DELETE FROM `rbac_linked_permissions` WHERE `linkedId` = 873;
INSERT INTO `rbac_linked_permissions` (`id`,`linkedId`) VALUES
(196, 873);
--
DROP TABLE IF EXISTS `ip2nation`;
DROP TABLE IF EXISTS `ip2nationCountries`;
-- 
DELETE FROM `rbac_permissions` WHERE `id`=874;
INSERT INTO `rbac_permissions` (`id`,`name`) VALUES
(874, "Command: go instance");

SET @parent := (SELECT `id` FROM `rbac_linked_permissions` WHERE `linkedId`=852);
DELETE FROM `rbac_linked_permissions` WHERE `linkedId`=874;
INSERT INTO `rbac_linked_permissions` (`id`,`linkedId`) VALUES
(@parent, 874);
-- rbac simplify
DELETE FROM `rbac_linked_permissions` WHERE `linkedid` IN (378,379,380,381,382,383,384,385,386,852,874);
DELETE FROM `rbac_permissions` WHERE `id` IN (378,379,380,381,382,383,384,385,386,852,874);
-- 
DELETE FROM `rbac_permissions` WHERE `id`=852;
INSERT INTO `rbac_permissions` (`id`,`name`) VALUES (852, 'Command: debug dummy');

DELETE FROM `rbac_linked_permissions` WHERE `linkedId`=852;
INSERT INTO `rbac_linked_permissions` (`id`,`linkedId`) VALUES (196,852);
