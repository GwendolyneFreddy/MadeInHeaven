BEGIN "mh#doppr"

IF ~True()~
BEGIN 0
  SAY @0
  IF ~~
    DO ~ApplySpell(Myself,DOPPLEGANGER_CHANGE_DEFAULT)~
    EXIT
END


