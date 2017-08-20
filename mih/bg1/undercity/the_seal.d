BEGIN "mh#gsage"

IF ~NumTimesTalkedTo(0)~
BEGIN it_begins
  SAY @0
  IF ~~
    REPLY @1
    GOTO prophecy
  IF ~~
    REPLY @2
    GOTO nobody
  IF ~~
    REPLY @3
    GOTO temple
END

IF ~~
BEGIN prophecy
  SAY @4
  IF ~~
    REPLY @2
    GOTO nobody
  IF ~~
    REPLY @3
    GOTO temple
END

IF ~~
BEGIN nobody
  SAY @5
  IF ~~
    REPLY @6
    GOTO prophecy
  IF ~~
    REPLY @3
    GOTO temple
END

IF ~~
BEGIN temple
  SAY @7
  IF ~~
    REPLY @6
    GOTO prophecy
  IF ~~
    REPLY @2
    GOTO nobody
  IF ~~
    REPLY @8
    GOTO confrontation
END

IF ~~
BEGIN confrontation
  SAY @9
  = @10
  IF ~~
    GOTO cold_farewell
  IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)~
    GOTO warm_farewell
END

IF ~~
BEGIN cold_farewell
  SAY @11
  IF ~~
    DO ~EscapeAreaDestroy(30)~
    UNSOLVED_JOURNAL @12
    EXIT
END

IF ~~
BEGIN warm_farewell
  SAY @13
  IF ~~
    DO ~EscapeAreaDestroy(30)~
    UNSOLVED_JOURNAL @12
    EXIT
END


BEGIN "mh#pain"

IF ~NumTimesTalkedTo(0)~
BEGIN know_pain
  SAY @14
  = @15
  = @16
  IF ~~
    DO ~Enemy()~
    EXIT
END


BEGIN "mh#loss"

IF ~NumTimesTalkedTo(0)~
BEGIN know_loss
  SAY @17
  = @18
  = @19
  IF ~~
    DO ~Enemy()~
    EXIT
END


BEGIN "mh#sorow"

IF ~NumTimesTalkedTo(0)~
BEGIN know_sorrow
  SAY @20
  = @21
  = @22
  IF ~~
    DO ~Enemy()~
    EXIT
END


