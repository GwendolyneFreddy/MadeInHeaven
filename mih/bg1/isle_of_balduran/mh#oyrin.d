BEGIN "mh#oyrin"

IF ~NumTimesTalkedTo(0)~
BEGIN ambush
  SAY @0
  IF ~~
    DO ~CreateCreature("wolfva", [3410.1230], 13)
        CreateCreature("wolfva", [3415.1460], 11)
        CreateCreature("wolfva", [3850.1055], 1)
        CreateCreature("wolfva", [3990.1275], 7)
        Enemy()~
    EXIT
END


