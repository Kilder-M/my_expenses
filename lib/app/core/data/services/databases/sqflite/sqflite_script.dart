const createExpenseTable = '''
  CREATE TABLE expense(
    id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT
    ,planned_expenses_id INTEGER NOT NULL
    ,name VARCHAR(200) NOT NULL
    ,value REAL NOT NULL
    ,payment_type CHAR(10)
    ,isPayed INTEGER NOT NULL 
    ,FOREIGN KEY (planned_expenses_id) REFERENCES planned_expenses (id)
  )
''';

const createPlannedExpensesTable= '''
  CREATE TABLE planned_expenses(
   id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
  ,month CHAR(10) 
  ,amount REAL
  ,wage REAL 
  ,remainder REAL 
  )
 ''';