object DataModuleMain: TDataModuleMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 901
  Width = 1086
  object ADOConnectionMain: TADOConnection
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 40
    Top = 8
  end
  object AQSelectChannels: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM channel'
      'ORDER BY channelOrder ASC;')
    Left = 16
    Top = 640
  end
  object AQSelectTypes: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM type'
      'ORDER BY typeName ASC;')
    Left = 752
    Top = 752
  end
  object AQSelectUsersByVisible: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'userShowInList'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT userId,'
      '    userName'
      'FROM USER'
      'WHERE userShowInList = :userShowInList;')
    Left = 872
    Top = 24
  end
  object AQUserLogin: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'userName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 40
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userPassword'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 40
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM user'
      'WHERE userName = :userName AND userPassword = MD5(:userPassword)')
    Left = 872
    Top = 120
  end
  object AQGetUserByName: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'userName'
        DataType = ftWideString
        Size = 400
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM USER'
      '    JOIN `group`'
      '    ON  user.groupId = group.groupId'
      'WHERE userName       = :userName')
    Left = 872
    Top = 72
  end
  object AQMainSchedule: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from schedulehuman order by channelOrder ASC')
    Left = 304
    Top = 56
  end
  object DSMainSchedule: TDataSource
    DataSet = AQMainSchedule
    Left = 304
    Top = 8
  end
  object AQSelectTables: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM `table`'
      'ORDER BY `tableAlias` ASC;')
    Left = 816
    Top = 744
  end
  object DSSelectTables: TDataSource
    DataSet = AQSelectTables
    Left = 816
    Top = 688
  end
  object DSSelectChannels: TDataSource
    DataSet = AQSelectChannels
    Left = 16
    Top = 600
  end
  object AQUpdateChannel: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'channelName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'channelDescription'
        Attributes = [paNullable]
        DataType = ftWideMemo
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'channelOrder'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'channelImage'
        Attributes = [paNullable]
        DataType = ftBlob
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'channelUrl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'channelBroadcastStart'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'channelId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 80
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE channel'
      'SET    channelName           = :channelName       ,'
      '       channelDescription    = :channelDescription,'
      '       channelOrder          = :channelOrder      ,'
      '       channelImage          = :channelImage      ,'
      '       channelUrl            = :channelUrl        ,'
      '       channelBroadcastStart =:channelBroadcastStart'
      'WHERE  channelId             = :channelId')
    Left = 16
    Top = 688
  end
  object AQDeleteChannel: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'channelId'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'DELETE'
      'FROM channel'
      'WHERE channelId = :channelId')
    Left = 16
    Top = 736
  end
  object AQInsertChannel: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'channelName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 48
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'channelDescription'
        Attributes = [paNullable]
        DataType = ftWideMemo
        NumericScale = 48
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'channelImage'
        Attributes = [paNullable]
        DataType = ftBlob
        NumericScale = 48
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'channelOrder'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 48
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'channelUrl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'channelBroadcastStart'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT'
      'INTO   channel'
      '       ('
      '              channelName       ,'
      '              channelDescription,'
      '              channelImage      ,'
      '              channelOrder      ,'
      '              channelUrl        ,'
      '              channelBroadcastStart'
      '       )'
      '       VALUES'
      '       ('
      '              :channelName       ,'
      '              :channelDescription,'
      '              :channelImage      ,'
      '              :channelOrder      ,'
      '              :channelUrl        ,'
      '              :channelBroadcastStart'
      '       )')
    Left = 16
    Top = 784
  end
  object DSSelectGenres: TDataSource
    DataSet = AQSelectGenres
    Left = 688
    Top = 688
  end
  object AQSelectGenres: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM genre'
      'ORDER BY genreName ASC;')
    Left = 688
    Top = 728
  end
  object DSSelectTypes: TDataSource
    DataSet = AQSelectTypes
    Left = 752
    Top = 704
  end
  object DSSelectPersons: TDataSource
    DataSet = AQSelectPersons
    Left = 72
    Top = 584
  end
  object AQSelectPersons: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT *                                                        ' +
        '             ,'
      
        '    IF(personDeathdate = '#39'0000-00-00'#39', NULL, personDeathdate) AS' +
        ' personDeathdate,'
      '    CASE'
      '        WHEN (personDeathdate IS NOT NULL'
      '        AND personDeathdate != '#39'0000-00-00'#39')'
      '            THEN (YEAR(personDeathdate) - YEAR(personBirthdate))'
      '        ELSE (YEAR(NOW())              - YEAR(personBirthdate))'
      '    END AS `personYears`'
      'FROM person'
      'ORDER BY personName ASC')
    Left = 72
    Top = 624
  end
  object AQInsertPerson: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'personName'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'personBio'
        DataType = ftWideMemo
        Size = -1
        Value = Null
      end
      item
        Name = 'personPhoto'
        Attributes = [paNullable]
        DataType = ftBlob
        Size = -1
        Value = Null
      end
      item
        Name = 'personBirthdate'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'personDeathdate'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'personSex'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'personHeight'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT'
      'INTO   person'
      '       ('
      '              personName     ,'
      '              personBio      ,'
      '              personPhoto    ,'
      '              personBirthdate,'
      '              personDeathdate,'
      '              personSex      ,'
      '              personHeight'
      '       )'
      '       VALUES'
      '       ('
      '              :personName     ,'
      '              :personBio      ,'
      '              :personPhoto    ,'
      '              :personBirthdate,'
      '              :personDeathdate,'
      '              :personSex      ,'
      '              :personHeight'
      '       )')
    Left = 72
    Top = 768
  end
  object AQUpdatePerson: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'personName'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'personBio'
        DataType = ftWideMemo
        Size = -1
        Value = Null
      end
      item
        Name = 'personPhoto'
        DataType = ftBlob
        Size = -1
        Value = Null
      end
      item
        Name = 'personBirthdate'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'personDeathdate'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'personSex'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'personHeight'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'personId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE person'
      'SET personName      = :personName     ,'
      '    personBio       = :personBio      ,'
      '    personPhoto     = :personPhoto    ,'
      '    personBirthdate = :personBirthdate,'
      '    personDeathdate = :personDeathdate,'
      '    personSex       = :personSex,'
      '    personHeight   = :personHeight'
      'WHERE personId      = :personId')
    Left = 72
    Top = 672
  end
  object AQSelectSchedule: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT scheduleId,'
      '       typeId ,'
      '       ('
      '       CASE'
      '              WHEN (schedule.movieid IS NOT NULL)'
      '              THEN movie.moviename'
      '              WHEN (schedule.episodeid IS NOT NULL)'
      
        '              THEN Concat(seriesepisode.seriesname,'#39'. '#39',seriesep' +
        'isode.episodename)'
      '              WHEN (schedule.broadcastid IS NOT NULL)'
      '              THEN broadcast.broadcastname'
      '       END) AS scheduletitle,'
      '       ('
      '       CASE'
      '              WHEN (schedule.movieid IS NOT NULL)'
      '              THEN '#39#1092#1080#1083#1100#1084#39
      '              WHEN (schedule.episodeid IS NOT NULL)'
      '              THEN '#39#1089#1077#1088#1080#1072#1083#39
      '              WHEN (schedule.broadcastid IS NOT NULL)'
      '              THEN '#39#1087#1077#1088#1077#1076#1072#1095#1072#39
      '       END) AS scheduletype,'
      '       ('
      '       CASE'
      '              WHEN (schedule.movieid IS NOT NULL)'
      '              THEN schedule.movieId'
      '              WHEN (schedule.episodeid IS NOT NULL)'
      '              THEN schedule.episodeId'
      '              WHEN (schedule.broadcastid IS NOT NULL)'
      '              THEN schedule.broadcastId'
      
        '       END)                                                     ' +
        '                                           AS objectId ,'
      
        '       CAST(CONCAT(TIME_FORMAT(scheduleStart, '#39'%H:%i'#39'), '#39' - '#39', T' +
        'IME_FORMAT(scheduleEnd, '#39'%H:%i'#39')) AS CHAR) AS scheduleTime,'
      
        '       CAST(CONCAT(channelOrder, '#39'. '#39', channelName) AS          ' +
        '                                     CHAR) AS channelOrderName,'
      '       channelname ,'
      '       scheduledate ,'
      '       schedulestart ,'
      '       scheduleend ,'
      '       scheduleisnextday,'
      '       schedule.channelId,'
      '       channelOrder'
      'FROM   SCHEDULE'
      '       LEFT JOIN broadcast'
      '       ON     schedule.broadcastid = broadcast.broadcastid'
      '       LEFT JOIN movie'
      '       ON     schedule.movieid = movie.movieid'
      '       LEFT JOIN seriesepisode'
      '       ON     schedule.episodeid = seriesepisode.episodeid'
      '       JOIN channel'
      '       ON     schedule.channelid = channel.channelid')
    Left = 256
    Top = 648
  end
  object DSSelectSchedule: TDataSource
    DataSet = AQSelectSchedule
    Left = 256
    Top = 600
  end
  object DSSelectObjects: TDataSource
    DataSet = AQSelectBroadcasts
    Left = 712
    Top = 576
  end
  object AQSelectBroadcasts: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *                       ,'
      '    broadcastName AS objectName,'
      '    broadcastId   AS objectId'
      'FROM broadcast'
      'ORDER BY broadcastName ASC;')
    Left = 456
    Top = 632
  end
  object AQSelectMovies: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *                   ,'
      '    movieName AS objectName,'
      '    movieId   AS objectId'
      'FROM movie'
      'ORDER BY movieName ASC;')
    Left = 128
    Top = 648
  end
  object AQSelectUsers: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM `user`'
      'ORDER BY userName ASC')
    Left = 320
    Top = 624
  end
  object DSSelectUsers: TDataSource
    DataSet = AQSelectUsers
    Left = 320
    Top = 584
  end
  object DSSelectGroups: TDataSource
    DataSet = AQSelectGroups
    Left = 632
    Top = 704
  end
  object AQSelectGroups: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM `group`'
      'ORDER BY `groupName` ASC')
    Left = 632
    Top = 752
  end
  object AQUpdateUser: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'userName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userAbout'
        Attributes = [paNullable]
        DataType = ftWideMemo
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userImage'
        Attributes = [paNullable]
        DataType = ftBlob
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userContact'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'groupId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userShowInList'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE `user`'
      'SET userName       = :userName   ,'
      '    userAbout      = :userAbout  ,'
      '    userImage      = :userImage  ,'
      '    userContact    = :userContact,'
      '    groupId        = :groupId    ,'
      '    userShowInList = :userShowInList'
      'WHERE userId       = :userId')
    Left = 320
    Top = 672
  end
  object AQDeleteUser: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'userId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 8
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'DELETE'
      'FROM `user`'
      'WHERE `userId` = :userId')
    Left = 320
    Top = 712
  end
  object AQInsertUser: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'userName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 88
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userPassword'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 88
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userContact'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 88
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userImage'
        Attributes = [paNullable]
        DataType = ftBlob
        NumericScale = 88
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userAbout'
        Attributes = [paNullable]
        DataType = ftWideMemo
        NumericScale = 88
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'groupId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 88
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userShowInList'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 88
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'INSERT'
      'INTO `user`'
      '    ('
      '        userName    ,'
      '        userPassword,'
      '        userContact ,'
      '        userImage   ,'
      '        userAbout   ,'
      '        groupId     ,'
      '        userShowInList'
      '    )'
      '    VALUES'
      '    ('
      '        :userName         ,'
      '        md5(:userPassword),'
      '        :userContact      ,'
      '        :userImage        ,'
      '        :userAbout        ,'
      '        :groupId          ,'
      '        :userShowInList'
      '    )')
    Left = 320
    Top = 760
  end
  object AQUpdateUserPassword: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'userPassword'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 240
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'userId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 240
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE `user`'
      'SET userPassword = md5(:userPassword)'
      'WHERE userId     = :userId')
    Left = 384
    Top = 688
  end
  object DSSelectAcl: TDataSource
    DataSet = AQSelectAcl
    Left = 944
    Top = 688
  end
  object AQSelectAcl: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM `acl`')
    Left = 952
    Top = 744
  end
  object DSSelectMovies: TDataSource
    DataSet = AQSelectMovies
    Left = 128
    Top = 600
  end
  object DSSelectBroadcasts: TDataSource
    DataSet = AQSelectBroadcasts
    Left = 456
    Top = 584
  end
  object DSSelectMoviePersons: TDataSource
    DataSet = AQSelectMoviePersons
    Left = 256
    Top = 216
  end
  object AQSelectMoviePersons: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    BeforePost = AQSelectMoviePersonsBeforePost
    Parameters = <
      item
        Name = 'movieId'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 136
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM   person_has_movie'
      'WHERE  movieId                        = :movieId')
    Left = 256
    Top = 264
  end
  object DSSelectSeries: TDataSource
    DataSet = AQSelectSeries
    Left = 192
    Top = 584
  end
  object AQSelectSeries: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM series'
      'ORDER BY seriesName ASC')
    Left = 192
    Top = 632
  end
  object DSSelectMovieGenres: TDataSource
    DataSet = AQSelectMovieGenres
    Left = 152
    Top = 216
  end
  object AQSelectMovieGenres: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    BeforePost = AQSelectMovieGenresBeforePost
    Parameters = <
      item
        Name = 'movieId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM movie_has_genre'
      'WHERE movieId = :movieId')
    Left = 152
    Top = 264
  end
  object DSSelectSeriesGenres: TDataSource
    DataSet = AQSelectSeriesGenres
    Left = 424
    Top = 416
  end
  object AQSelectSeriesGenres: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    BeforePost = AQSelectSeriesGenresBeforePost
    Parameters = <
      item
        Name = 'seriesId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 200
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM series_has_genre'
      'WHERE seriesId = :seriesId')
    Left = 496
    Top = 408
  end
  object DSSelectSeriesEpisodes: TDataSource
    DataSet = AQSelectSeriesEpisodes
    Left = 376
    Top = 376
  end
  object AQSelectSeriesEpisodes: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    BeforePost = AQSelectSeriesEpisodesBeforePost
    Parameters = <
      item
        Name = 'seriesId'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 112
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT   *'
      'FROM     episode'
      'WHERE    seriesId = :seriesId'
      'ORDER BY episodeSeason DESC,'
      '         episodeNumber DESC;')
    Left = 496
    Top = 368
  end
  object DSSelectSeriesActors: TDataSource
    DataSet = AQSelectSeriesActors
    Left = 424
    Top = 336
  end
  object AQSelectSeriesActors: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'seriesId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 248
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM   actor_has_series'
      'WHERE  seriesId = :seriesId')
    Left = 496
    Top = 320
  end
  object AQEmptyQuery: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    Left = 88
    Top = 72
  end
  object AQUpdateSchedule: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'channelId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'episodeId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'broadcastId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'typeId'
        DataType = ftInteger
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'scheduleDate'
        DataType = ftWideString
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'scheduleStart'
        DataType = ftWideString
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'scheduleEnd'
        DataType = ftWideString
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'scheduleIsNextDay'
        DataType = ftWideString
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'scheduleId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE SCHEDULE'
      'SET`channelId`          = :channelId    ,'
      '    `movieId`           = :movieId      ,'
      '    `episodeId`         = :episodeId    ,'
      '    `broadcastId`       = :broadcastId  ,'
      '    `typeId`            = :typeId       ,'
      '    `scheduleDate`      = :scheduleDate ,'
      '    `scheduleStart`     = :scheduleStart,'
      '    `scheduleEnd`       = :scheduleEnd  ,'
      '    `scheduleIsNextDay` = :scheduleIsNextDay'
      'WHERE `scheduleId`      = :scheduleId')
    Left = 256
    Top = 696
  end
  object AQDeleteSchedule: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'scheduleId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 168
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'DELETE'
      'FROM SCHEDULE'
      'WHERE scheduleId = :scheduleId')
    Left = 256
    Top = 744
  end
  object AQInsertSchedule: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'channelId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'movieId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'broadcastId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'episodeId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'typeId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'scheduleDate'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'scheduleStart'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'scheduleEnd'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'scheduleIsNextDay'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT'
      'INTO SCHEDULE'
      '    ('
      '        `channelId`    ,'
      '        `movieId`      ,'
      '        `broadcastId`  ,'
      '        `episodeId`    ,'
      '        `typeId`       ,'
      '        `scheduleDate` ,'
      '        `scheduleStart`,'
      '        `scheduleEnd`  ,'
      '        `scheduleIsNextDay`'
      '    )'
      '    VALUES'
      '    ('
      '        :channelId    ,'
      '        :movieId      ,'
      '        :broadcastId  ,'
      '        :episodeId    ,'
      '        :typeId       ,'
      '        :scheduleDate ,'
      '        :scheduleStart,'
      '        :scheduleEnd  ,'
      '        :scheduleIsNextDay'
      '    )')
    Left = 256
    Top = 800
  end
  object AQSelectUserTables: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'userName'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT * FROM `table` JOIN acl ON table.tableId = acl.tableId JO' +
        'IN `group` ON acl.groupId = group.groupId JOIN `user` ON `group`' +
        '.groupId = user.groupId WHERE user.userName = :userName;')
    Left = 648
    Top = 144
  end
  object AQSelectUserRightsForTable: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'userName'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'tableName'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT * FROM `table` JOIN acl ON table.tableId = acl.tableId JO' +
        'IN `group` ON acl.groupId = group.groupId JOIN `user` ON `group`' +
        '.groupId = user.groupId WHERE user.userName = :userName AND `tab' +
        'le`.tableName = :tableName;')
    Left = 648
    Top = 200
  end
  object AQIDDQD: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'tableName'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'REPAIR TABLE :tableName')
    Left = 32
    Top = 72
  end
  object AQOptimize: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'tableName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 72
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'OPTIMIZE TABLE :tableName')
    Left = 32
    Top = 120
  end
  object AQUpdateMovie: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'movieName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 216
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieDate'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 216
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'countryId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 216
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieBudget'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 216
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieReturns'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 216
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieLength'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 216
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieDescription'
        Attributes = [paNullable]
        DataType = ftWideMemo
        NumericScale = 216
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 216
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE movie'
      'SET    movieName        = :movieName      ,'
      '       movieDate        = :movieDate      ,'
      '       countryId        = :countryId      ,'
      '       movieBudget      = :movieBudget    ,'
      '       movieReturns     = :movieReturns   ,'
      '       movieLength      = :movieLength    ,'
      '       movieDescription = :movieDescription'
      'WHERE  movieId          = :movieId')
    Left = 128
    Top = 688
  end
  object AQDeleteMovie: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'movieId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 72
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'DELETE'
      'FROM movie'
      'WHERE movieId = :movieId')
    Left = 128
    Top = 736
  end
  object AQInsertMovie: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'movieName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 200
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieDescription'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 200
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 200
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'countryId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 200
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieBudget'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 200
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieReturns'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 200
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'movieLength'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 200
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'INSERT'
      'INTO   movie'
      '       ('
      '              movieName       ,'
      '              movieDescription,'
      '              movieDate       ,'
      '              countryId       ,'
      '              movieBudget     ,'
      '              movieReturns    ,'
      '              movieLength'
      '       )'
      '       VALUES'
      '       ('
      '              :movieName       ,'
      '              :movieDescription,'
      '              :movieDate       ,'
      '              :countryId       ,'
      '              :movieBudget     ,'
      '              :movieReturns    ,'
      '              :movieLength'
      '       )')
    Left = 128
    Top = 784
  end
  object AQUpdateSeries: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'seriesName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'seriesDescription'
        Attributes = [paNullable]
        DataType = ftWideMemo
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'seriesStatus'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'countryId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'seriesLength'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'seriesId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 16
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE series'
      'SET    seriesName        = :seriesName       ,'
      '       seriesDescription = :seriesDescription,'
      '       seriesStatus      = :seriesStatus     ,'
      '       countryId         = :countryId        ,'
      '       seriesLength      = :seriesLength'
      'WHERE  seriesId          = :seriesId')
    Left = 192
    Top = 664
  end
  object AQDeleteSeries: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'seriesId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 8
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'DELETE'
      'FROM series'
      'WHERE seriesId = :seriesId')
    Left = 192
    Top = 712
  end
  object AQInsertSeries: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'seriesName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'seriesDescription'
        Attributes = [paNullable]
        DataType = ftWideMemo
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'seriesStatus'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'countryId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'seriesLength'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'INSERT'
      'INTO   series'
      '       ('
      '              seriesName       ,'
      '              seriesDescription,'
      '              seriesStatus     ,'
      '              countryId         ,'
      '              seriesLength'
      '       )'
      '       VALUES'
      '       ('
      '              :seriesName       ,'
      '              :seriesDescription,'
      '              :seriesStatus     ,'
      '              :countryId        ,'
      '              :seriesLength'
      '       )')
    Left = 192
    Top = 760
  end
  object AQDeletePerson: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'personId'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DELETE'
      'FROM person'
      'WHERE personId = :personId')
    Left = 72
    Top = 720
  end
  object AQGetMovieById: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'movieId'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM   movie'
      '       JOIN country'
      '       ON     movie.countryId = country.countryId'
      'WHERE  movieId                = :movieId')
    Left = 960
    Top = 200
  end
  object AQGetPersonsByMovieId: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'movieId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM   person_has_movie'
      '       JOIN person'
      '       ON     person_has_movie.personId = person.actorId'
      '       JOIN role'
      '       ON     person_has_movie.roleId = role.roleId'
      'WHERE  movieId                        = :movieId')
    Left = 984
    Top = 200
  end
  object AQGetGenresByMovieId: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'movieId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM movie_has_genre'
      '    JOIN genre'
      '    ON  movie_has_genre.genreId = genre.genreId'
      'WHERE movieId                   = :movieId')
    Left = 984
    Top = 256
  end
  object AQGetEpisodeById: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'episodeId'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 224
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT * FROM episode JOIN series ON episode.seriesId = series.s' +
        'eriesId JOIN country ON series.countryId = country.countryId WHE' +
        'RE episodeId = :episodeId')
    Left = 984
    Top = 8
  end
  object AQGetPersonsBySeriesId: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'seriesId'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM   person_has_series'
      '       JOIN person'
      '       ON     person_has_series.actorId = actor.actorId'
      '       JOIN role'
      '       ON     person_has_series.roleId = role.roleId'
      'WHERE  seriesId                        = :seriesId')
    Left = 984
    Top = 56
  end
  object AQGetGenresBySeriesId: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'seriesId'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 136
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM series_has_genre'
      '    JOIN genre'
      '    ON  series_has_genre.genreId = genre.genreId'
      'WHERE seriesId                   = :seriesId')
    Left = 984
    Top = 104
  end
  object AQGetBroadcastById: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'broadcastId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM broadcast'
      'WHERE broadcastId = :broadcastId')
    Left = 984
    Top = 304
  end
  object AQSelectSeriesWithEpisodes: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'seriesId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 32
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT *, episodeId AS objectId, seriesEpisodeSeasonTitle as obj' +
        'ectName'
      'FROM seriesepisode;')
    Left = 1008
    Top = 760
  end
  object DSSelectSeriesPersons: TDataSource
    DataSet = AQSelectSeriesPersons
    Left = 368
    Top = 168
  end
  object AQSelectSeriesPersons: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    BeforePost = AQSelectSeriesPersonsBeforePost
    Parameters = <
      item
        Name = 'seriesId'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 56
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM   person_has_series'
      'WHERE  seriesId                        = :seriesId')
    Left = 368
    Top = 216
  end
  object DSSelectRoles: TDataSource
    DataSet = AQSelectRoles
    Left = 584
    Top = 688
  end
  object AQSelectRoles: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM `role`'
      'ORDER BY `roleName` ASC;')
    Left = 584
    Top = 744
  end
  object DSSelectCountries: TDataSource
    DataSet = AQSelectCountries
    Left = 544
    Top = 712
  end
  object AQSelectCountries: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM `country`'
      'ORDER BY `countryName` ASC;')
    Left = 544
    Top = 768
  end
  object AQReportMoviePersons: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    BeforePost = AQSelectMoviePersonsBeforePost
    Parameters = <
      item
        Name = 'movieId'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 152
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  CONCAT( IF( COUNT( DISTINCT personName ) >1, TRIM(roleNu' +
        'meric), TRIM(roleName) ) , '#39': '#39', GROUP_CONCAT( DISTINCT TRIM(per' +
        'sonName) ORDER BY roleName ASC SEPARATOR '#39', '#39' ) ) AS roleName,'
      '                          movieId'
      '                  FROM     person_has_movie'
      '                           LEFT JOIN person'
      
        '                           ON       person_has_movie.personId = ' +
        'person.personId'
      '                           LEFT JOIN role'
      
        '                           ON       person_has_movie.roleId = ro' +
        'le.roleId'
      'WHERE movieId = :movieId'
      ''
      '                  GROUP BY roleName')
    Left = 128
    Top = 392
  end
  object AQReportSeriesPersons: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    BeforePost = AQSelectMoviePersonsBeforePost
    Parameters = <
      item
        Name = 'seriesId'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 48
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  CONCAT( IF( COUNT( DISTINCT personName ) >1, TRIM(roleNu' +
        'meric), TRIM(roleName) ) , '#39': '#39', GROUP_CONCAT( DISTINCT TRIM(per' +
        'sonName) ORDER BY roleName ASC SEPARATOR '#39', '#39' ) ) AS roleName,'
      '                           seriesId'
      '                  FROM     person_has_series'
      '                           LEFT JOIN person'
      
        '                           ON       person_has_series.personId =' +
        ' person.personId'
      '                           LEFT JOIN role'
      
        '                           ON       person_has_series.roleId = r' +
        'ole.roleId'
      'WHERE seriesId = :seriesId'
      ''
      '                  GROUP BY roleName')
    Left = 128
    Top = 440
  end
  object DSSelectBroadcastPersons: TDataSource
    DataSet = AQSelectBroadcastPersons
    Left = 72
    Top = 216
  end
  object AQSelectBroadcastPersons: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    BeforePost = AQSelectBroadcastPersonsBeforePost
    Parameters = <
      item
        Name = 'broadcastId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM   person_has_broadcast'
      'WHERE  broadcastId                        = :broadcastId')
    Left = 72
    Top = 264
  end
  object AQUpdateBroadcast: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'broadcastName'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'broadcastLength'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'broadcastDescription'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'broadcastId'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE `broadcast`'
      'SET    broadcastName        = :broadcastName  ,'
      '       broadcastLength      = :broadcastLength,'
      '       broadcastDescription = :broadcastDescription'
      'WHERE  broadcastId          = :broadcastId')
    Left = 456
    Top = 680
  end
  object AQDeleteBroadcast: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'broadcastId'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 48
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'DELETE'
      'FROM   `broadcast`'
      'WHERE  `broadcastId` = :broadcastId')
    Left = 456
    Top = 720
  end
  object AQInsertBroadcast: TADOQuery
    Connection = ADOConnectionMain
    Parameters = <
      item
        Name = 'broadcastName'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 192
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'broadcastDescription'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 192
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'broadcastLength'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 192
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'INSERT'
      'INTO   `broadcast`'
      '       ('
      '              broadcastName       ,'
      '              broadcastDescription,'
      '              broadcastLength'
      '       )'
      '       VALUES'
      '       ('
      '              :broadcastName       ,'
      '              :broadcastDescription,'
      '              :broadcastLength'
      '       )')
    Left = 456
    Top = 768
  end
  object AQReportSeries: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT   seriesName ,'
      '         seriesDescription ,'
      '         episodeName ,'
      '         episodeDescription ,'
      '         seriesLength ,'
      '         countryName ,'
      '         episode.episodeSeason ,'
      '         episodeNumber,'
      
        '         GROUP_CONCAT(DISTINCT genreName separator ", ")        ' +
        '  AS genreName,'
      
        '         GROUP_CONCAT(DISTINCT hello.roleName separator "<br />"' +
        ') AS personName,'
      '         maxCount,'
      '         maxChannelName,'
      '         minCount,'
      '         minChannelName,'
      '         seriesInScheduleLength,'
      '         seriesSeasonInScheduleLength,'
      '         seasonSeriesCount,'
      '         seriesEpisodeCount'
      'FROM     series'
      '         LEFT JOIN episode'
      '         ON       series.seriesId = episode.seriesId'
      '         LEFT JOIN person_has_series'
      '         ON       episode.seriesId = person_has_series.seriesId'
      '         LEFT JOIN country'
      '         ON       series.countryId = country.countryId'
      '         LEFT JOIN series_has_genre'
      '         ON       episode.seriesId = series_has_genre.seriesId'
      '         LEFT JOIN genre'
      '         ON       series_has_genre.genreId = genre.genreId'
      '         LEFT JOIN'
      
        '                  ( SELECT  CONCAT( IF( COUNT( DISTINCT personNa' +
        'me ) >1, TRIM(roleNumeric), TRIM(roleName) ) , '#39': '#39', GROUP_CONCA' +
        'T( DISTINCT TRIM(personName) ORDER BY roleName ASC SEPARATOR '#39', ' +
        #39' ) ) AS roleName,'
      '                           seriesId'
      '                  FROM     person_has_series'
      '                           LEFT JOIN person'
      
        '                           ON       person_has_series.personId =' +
        ' person.personId'
      '                           LEFT JOIN role'
      
        '                           ON       person_has_series.roleId = r' +
        'ole.roleId'
      '                  GROUP BY roleName'
      '                  ) AS HELLO'
      '         ON       series.seriesId = HELLO.seriesId'
      '         LEFT JOIN'
      '                  ( SELECT DISTINCT maxCount ,'
      '                                   maxChannelName ,'
      '                                   minCount ,'
      '                                   minChannelName ,'
      
        '                                   schedule.episodeId AS maxMinS' +
        'cheduleEpisodeId'
      '                  FROM             SCHEDULE'
      '                                   JOIN'
      
        '                                                    ( SELECT  CO' +
        'UNT(*) AS maxCount,'
      
        '                                                             epi' +
        'sodeId ,'
      
        '                                                             cha' +
        'nnelName AS maxChannelName'
      
        '                                                    FROM     SCH' +
        'EDULE'
      
        '                                                             JOI' +
        'N channel'
      
        '                                                             ON ' +
        '      schedule.channelId = channel.channelId'
      
        '                                                    WHERE    epi' +
        'sodeId IS NOT NULL'
      
        '                                                    GROUP BY epi' +
        'sodeId,'
      
        '                                                             sch' +
        'edule.channelId'
      
        '                                                    ORDER BY COU' +
        'NT( * ) DESC'
      
        '                                                    ) AS schedul' +
        'eMax'
      
        '                                   ON               schedule.epi' +
        'sodeId = scheduleMax.episodeId'
      '                                   JOIN'
      
        '                                                    ( SELECT  CO' +
        'UNT(*) AS minCount,'
      
        '                                                             epi' +
        'sodeId ,'
      
        '                                                             cha' +
        'nnelName AS minChannelName'
      
        '                                                    FROM     SCH' +
        'EDULE'
      
        '                                                             JOI' +
        'N channel'
      
        '                                                             ON ' +
        '      schedule.channelId = channel.channelId'
      
        '                                                    WHERE    epi' +
        'sodeId IS NOT NULL'
      
        '                                                    GROUP BY epi' +
        'sodeId,'
      
        '                                                             sch' +
        'edule.channelId'
      
        '                                                    ORDER BY COU' +
        'NT( * ) ASC'
      
        '                                                    ) AS schedul' +
        'eMin'
      
        '                                   ON               schedule.epi' +
        'sodeId = scheduleMin.episodeId'
      '                  GROUP BY         schedule.episodeId,'
      '                                   schedule.channelId'
      '                  ) AS maxMinSchedule'
      
        '         ON       episode.episodeId = maxMinSchedule.maxMinSched' +
        'uleEpisodeId'
      '         LEFT JOIN'
      
        '                  ( SELECT ( COUNT( * ) * series.seriesLength ) ' +
        'AS seriesInScheduleLength,'
      '                           series.seriesId'
      '                  FROM     `schedule`'
      '                           JOIN episode'
      
        '                           ON       episode.episodeId = schedule' +
        '.episodeId'
      '                           JOIN series'
      
        '                           ON       series.seriesId = episode.se' +
        'riesId'
      '                  WHERE    schedule.episodeId IS NOT NULL'
      '                  GROUP BY series.seriesId'
      '                  ) AS seriesInSchedule'
      '         ON       series.seriesId = seriesInSchedule.seriesId'
      '         LEFT JOIN'
      
        '                  ( SELECT ( COUNT( * ) * series.seriesLength ) ' +
        'AS seriesSeasonInScheduleLength,'
      '                           series.seriesId,'
      '                           episode.episodeSeason'
      '                  FROM     `schedule`'
      '                           JOIN episode'
      
        '                           ON       episode.episodeId = schedule' +
        '.episodeId'
      '                           JOIN series'
      
        '                           ON       series.seriesId = episode.se' +
        'riesId'
      '                  WHERE    schedule.episodeId IS NOT NULL'
      '                  GROUP BY series.seriesId,'
      '                           episode.episodeSeason'
      '                  ) AS seriesSeasonInSchedule'
      
        '         ON (series.seriesId            = seriesSeasonInSchedule' +
        '.seriesId'
      
        '              AND episode.episodeSeason = seriesSeasonInSchedule' +
        '.episodeSeason)'
      '         LEFT JOIN'
      '                  ( SELECT  COUNT(*) AS seasonSeriesCount,'
      '                           seriesId,'
      '                           episodeSeason'
      '                  FROM     episode'
      '                  GROUP BY seriesId,'
      '                           episodeSeason'
      '                  ) AS seasonSeries'
      '         ON (episode.seriesId           = seasonSeries.seriesId'
      
        '              AND episode.episodeSeason = seasonSeries.episodeSe' +
        'ason)'
      '         LEFT JOIN'
      '                  ( SELECT  COUNT( * ) AS seriesEpisodeCount,'
      '                           episode.seriesId'
      '                  FROM     series'
      '                           JOIN episode'
      
        '                           ON       episode.seriesId = series.se' +
        'riesId'
      '                  GROUP BY episode.seriesId'
      '                  ) AS seasonEpisodeCount'
      '         ON (episode.seriesId = seasonEpisodeCount.seriesId)'
      'GROUP BY episode.seriesId,'
      '         episodeSeason,'
      '         episodeNumber'
      'ORDER BY seriesName ASC,'
      '         episodeSeason ASC,'
      '         episodeNumber ASC,'
      '         roleName ASC')
    Left = 976
    Top = 440
  end
  object AQReportMovies: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT   movieName ,'
      '         movieDescription ,'
      '         movieLength ,'
      '         movieBudget,'
      '         movieReturns,'
      '         countryName ,'
      '         movieDate,'
      
        '         GROUP_CONCAT(DISTINCT genreName separator ", ")        ' +
        '  AS genreName,'
      
        '         GROUP_CONCAT(DISTINCT hello.roleName separator "<br />"' +
        ') AS personName,'
      
        '         (movieReturns - movieBudget)                           ' +
        '  AS movieProfit'
      'FROM     movie'
      '         LEFT JOIN country'
      '         ON       movie.countryId = country.countryId'
      '         LEFT JOIN movie_has_genre'
      '         ON       movie.movieId = movie_has_genre.movieId'
      '         LEFT JOIN genre'
      
        '         ON       movie_has_genre.genreId                       ' +
        '     = genre.genreId,'
      
        '                  ( SELECT  CONCAT( IF( COUNT( DISTINCT personNa' +
        'me ) >1, TRIM(roleNumeric), TRIM(roleName) ) , '#39': '#39', GROUP_CONCA' +
        'T( DISTINCT TRIM(personName) ORDER BY roleName ASC SEPARATOR '#39', ' +
        #39' ) ) AS roleName'
      '                  FROM     person_has_movie'
      '                           LEFT JOIN person'
      
        '                           ON       person_has_movie.personId = ' +
        'person.personId'
      '                           LEFT JOIN role'
      
        '                           ON       person_has_movie.roleId = ro' +
        'le.roleId'
      '                  GROUP BY roleName'
      '                  ) AS HELLO'
      'GROUP BY movie.movieId'
      'ORDER BY movieName ASC')
    Left = 976
    Top = 496
  end
  object AQReportBroadcast: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT   broadcastName ,'
      '         broadcastDescription ,'
      '         broadcastLength ,'
      
        '         GROUP_CONCAT(DISTINCT hello.roleName separator "<br />"' +
        ') AS personName'
      ''
      'FROM     broadcast,'
      
        '         ( SELECT  CONCAT( IF( COUNT( DISTINCT personName ) >1, ' +
        'TRIM(roleNumeric), TRIM(roleName) ) , '#39': '#39', GROUP_CONCAT( DISTIN' +
        'CT TRIM(personName) ORDER BY roleName ASC SEPARATOR '#39', '#39' ) ) AS ' +
        'roleName'
      '         FROM     person_has_broadcast'
      '                  LEFT JOIN person'
      
        '                  ON       person_has_broadcast.personId = perso' +
        'n.personId'
      '                  LEFT JOIN role'
      
        '                  ON       person_has_broadcast.roleId = role.ro' +
        'leId'
      '         GROUP BY roleName'
      '         ) AS HELLO'
      'GROUP BY broadcast.broadcastId'
      'ORDER BY broadcastName ASC')
    Left = 976
    Top = 544
  end
  object AQReportBroadcastPersons: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    BeforePost = AQSelectMoviePersonsBeforePost
    Parameters = <
      item
        Name = 'broadcastId'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 24
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  CONCAT( IF( COUNT( DISTINCT personName ) >1, TRIM(roleNu' +
        'meric), TRIM(roleName) ) , '#39': '#39', GROUP_CONCAT( DISTINCT TRIM(per' +
        'sonName) ORDER BY roleName ASC SEPARATOR '#39', '#39' ) ) AS roleName,'
      '                           broadcastId'
      '                  FROM     person_has_broadcast'
      '                           LEFT JOIN person'
      
        '                           ON       person_has_broadcast.personI' +
        'd = person.personId'
      '                           LEFT JOIN role'
      
        '                           ON       person_has_broadcast.roleId ' +
        '= role.roleId'
      'WHERE broadcastId = :broadcastId'
      ''
      '                  GROUP BY roleName')
    Left = 128
    Top = 488
  end
  object AQReportMovieGenres: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'movieId'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 192
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT GROUP_CONCAT(genreName SEPARATOR '#39', '#39') as genreName'
      'FROM   genre'
      '       JOIN movie_has_genre'
      '       ON     genre.genreId    = movie_has_genre.genreId'
      'WHERE  movie_has_genre.movieId = :movieId')
    Left = 224
    Top = 392
  end
  object AQReportSeriesGenres: TADOQuery
    Connection = ADOConnectionMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'seriesId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT GROUP_CONCAT(genreName SEPARATOR '#39', '#39') AS genreName'
      'FROM   genre'
      '       JOIN series_has_genre'
      '       ON     genre.genreId    = series_has_genre.genreId'
      'WHERE  series_has_genre.seriesId = :seriesId')
    Left = 224
    Top = 440
  end
end
