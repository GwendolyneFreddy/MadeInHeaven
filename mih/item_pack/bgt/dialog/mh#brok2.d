BEGIN "mh#brok2"

IF ~NumTimesTalkedTo(0)~
BEGIN meet_again
  SAY @0
  IF ~~
    REPLY @1
    GOTO glad_to_see_ya
  IF ~~
    REPLY @2
    GOTO remember_me
END

IF ~~
BEGIN glad_to_see_ya
  SAY @3
  IF ~~
    GOTO save_you
END

IF ~~
BEGIN remember_me
  SAY @4
  IF ~~
    GOTO save_you
END

IF ~~
BEGIN save_you
  SAY @5
  = @6
  = @7
  = @8
  IF ~~
    REPLY @9
    GOTO old_stuff
END

IF ~~
BEGIN old_stuff
  SAY @10
  = @11
  = @12
  IF ~~
    REPLY @13
    GOTO give_girdle
  IF ~~
    REPLY @14
    GOTO give_girdle
END

IF ~~
BEGIN give_girdle
  SAY @15
  IF ~~
    DO ~GiveItemCreate("mh#belt1", LastTalkedToBy(Myself), 0, 0, 0)~
    GOTO sell_stuff
END

IF ~True()~
BEGIN default
  SAY @16
  IF ~~
    REPLY @17
    GOTO sell_stuff
  IF ~Global("mh#AskedBrokkForge", "GLOBAL", 0)~
    REPLY @18
    GOTO no_forge
  IF ~~
    REPLY @19
    EXIT
END

IF ~~
BEGIN sell_stuff
  SAY @20
  IF ~~
    DO ~StartStore("mh#brok2", LastTalkedToBy(Myself))~
    EXIT
END

IF ~~
BEGIN no_forge
  SAY @21
  = @22
  = @23
  IF ~~
    DO ~SetGlobal("mh#AskedBrokkForge", "GLOBAL", 1)~
    EXIT
END


