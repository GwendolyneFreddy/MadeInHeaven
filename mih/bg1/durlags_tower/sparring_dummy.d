BEGIN "mh#spdum"

IF ~True()~
BEGIN default
  SAY "(A sparring dummy stands motionless before you.  You could strike it if you wish.)"
  IF ~~
    REPLY "(Strike the dummy.)"
    DO ~ActionOverride(LastTalkedToBy(Myself), AttackNoSound(LastTalkedToBy(Myself)))~
    EXIT
  IF ~~
    REPLY "(Leave it alone.)"
    EXIT
END


