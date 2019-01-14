-- TDB 335.64 characters
UPDATE `updates` SET `state`='ARCHIVED';
--
UPDATE `worldstates` SET `value`=UNIX_TIMESTAMP() WHERE `entry`=20001 AND `value` < UNIX_TIMESTAMP();
ALTER TABLE `character_queststatus`
  ADD `itemcount5` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `itemcount4`,
  ADD `itemcount6` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `itemcount5`;
ALTER TABLE `character_aura`
  DROP PRIMARY KEY,
  ADD `itemGuid` bigint(20) unsigned NOT NULL DEFAULT '0' AFTER `casterGuid`,
  ADD PRIMARY KEY(`guid`,`casterGuid`,`itemGuid`,`spell`,`effectMask`);
