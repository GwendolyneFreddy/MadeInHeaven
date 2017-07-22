// Add a variable to know if player talked with Gerde

ADD_TRANS_ACTION "%tutu_var%gerde"
BEGIN 0 END	// States
BEGIN END	// Transactions
  ~SetGlobal("mh#TalkedWithGerde", "GLOBAL", 1)~


// Alter unreliable state trigger for a more reliable one

REPLACE_STATE_TRIGGER "%tutu_var%gerde" 1
  ~NumDeadGT("AnkhegGerde", 5)~


// Add a variable to know if player talked with Fenten

ADD_TRANS_ACTION "%tutu_var%fenten"
BEGIN 1 2 END	// States
BEGIN END	// Transactions
  ~SetGlobal("mh#TalkedWithFenten", "GLOBAL", 1)~


