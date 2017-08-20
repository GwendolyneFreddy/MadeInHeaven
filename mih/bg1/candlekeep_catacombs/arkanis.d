ADD_TRANS_ACTION "%tutu_var%arkani3"
BEGIN 1 END	// States
BEGIN END	// Transaction
~ApplySpell("DEDER", MH_PLAYER_CONTROL)
ApplySpell(Myself, MH_PLAYER_CONTROL)
ChangeEnemyAlly("DEDER", ALLY)
ChangeEnemyAlly(Myself, ALLY)~


