TYPE=VIEW
query=select `tvdatabase`.`episode`.`episodeId` AS `episodeId`,`tvdatabase`.`series`.`seriesId` AS `seriesId`,`tvdatabase`.`episode`.`episodeName` AS `episodeName`,`tvdatabase`.`episode`.`episodeDescription` AS `episodeDescription`,`tvdatabase`.`episode`.`episodeNumber` AS `episodeNumber`,`tvdatabase`.`series`.`seriesName` AS `seriesName`,`tvdatabase`.`series`.`seriesDescription` AS `seriesDescription`,`tvdatabase`.`episode`.`episodeSeason` AS `episodeSeason`,cast(concat(`tvdatabase`.`series`.`seriesName`,_utf8\'. \',`tvdatabase`.`episode`.`episodeName`,_utf8\'. (S\',`tvdatabase`.`episode`.`episodeSeason`,_utf8\'.\',_utf8\'E\',`tvdatabase`.`episode`.`episodeNumber`,_utf8\')\') as char charset utf8) AS `seriesEpisodeSeasonTitle`,cast(concat(_utf8\'S\',`tvdatabase`.`episode`.`episodeSeason`,_utf8\'.\',_utf8\'E\',`tvdatabase`.`episode`.`episodeNumber`) as char charset utf8) AS `seriesEpisodeCode` from (`tvdatabase`.`episode` join `tvdatabase`.`series` on((`tvdatabase`.`episode`.`seriesId` = `tvdatabase`.`series`.`seriesId`)))
md5=bf85cabc092f9803d35228f5b402885f
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=1
with_check_option=0
revision=1
timestamp=2009-07-05 21:59:06
create-version=1
source=select `episode`.`episodeId` AS `episodeId`,`series`.`seriesId` AS `seriesId`,`episode`.`episodeName` AS `episodeName`,`episode`.`episodeDescription` AS `episodeDescription`,`episode`.`episodeNumber` AS `episodeNumber`,`series`.`seriesName` AS `seriesName`,`series`.`seriesDescription` AS `seriesDescription`,`episode`.`episodeSeason` AS `episodeSeason`,cast(concat(`series`.`seriesName`,_utf8\'. \',`episode`.`episodeName`,_utf8\'. (S\',`episode`.`episodeSeason`,_utf8\'.\',_utf8\'E\',`episode`.`episodeNumber`,_utf8\')\') as char charset utf8) AS `seriesEpisodeSeasonTitle`,cast(concat(_utf8\'S\',`episode`.`episodeSeason`,_utf8\'.\',_utf8\'E\',`episode`.`episodeNumber`) as char charset utf8) AS `seriesEpisodeCode` from (`episode` join `series` on((`episode`.`seriesId` = `series`.`seriesId`)))
