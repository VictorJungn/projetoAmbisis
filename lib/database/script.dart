// ignore_for_file: prefer_const_declarations

final creatTable = '''
CREATE TABLE esg_goal 
  (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT,
    isComplete INTEGER,
    type INGEGER
  );
''';

final insert1 = '''
INSERT INTO esg_goal (date, isComplete, type)
VALUES ('05/03/2014', 1, 2);
''';

final insert2 = '''
INSERT INTO esg_goal (date, isComplete, type)
VALUES ('12/06/2015', 0, 1);
''';

final insert3 = '''
INSERT INTO esg_goal (date, isComplete, type)
VALUES ('18/02/2016', 1, 1);
''';

final insert4 = '''
INSERT INTO esg_goal (date, isComplete, type)
VALUES ('21/09/2017', 1, 3);
''';

final insert5 = '''
INSERT INTO esg_goal (date, isComplete, type)
VALUES ('04/07/2018', 0, 2);
''';

final insert6 = '''
INSERT INTO esg_goal (date, isComplete, type)
VALUES ('29/11/2019', 1, 1);
''';

final insert7 = '''
INSERT INTO esg_goal (date, isComplete, type)
VALUES ('10/08/2020', 0, 3);
''';

final insert8 = '''
INSERT INTO esg_goal (date, isComplete, type)
VALUES ('27/05/2021', 0, 2);
''';

final insert9 = '''
INSERT INTO esg_goal (date, isComplete, type)
VALUES ('08/12/2022', 1, 3);
''';

final insert10 = '''
INSERT INTO esg_goal (date, isComplete, type)
VALUES ('23/01/2023', 1, 1);
''';
