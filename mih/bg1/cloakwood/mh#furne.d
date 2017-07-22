BEGIN "mh#furne"

IF ~GlobalLT("mh#FurnelaineBearsDead", "GLOBAL", 3)~
BEGIN get_out
  SAY @0
  IF ""
    EXIT
END

IF ~Global("mh#HelpFurnelaine", "GLOBAL", 0)
    HPPercentLT(MostDamagedOf([PC]), 30)~
BEGIN fought_poorly
  SAY @1
  IF ""
    DO ~SetGlobal("mh#HelpFurnelaine", "GLOBAL", 1)~
    SOLVED_JOURNAL @2
    EXIT
END

IF ~Global("mh#HelpFurnelaine", "GLOBAL", 0)
    HasItem("%tutu_var%potn08", Myself)
    HPPercentLT(MostDamagedOf([PC]), 70)~
BEGIN fought_okay
  SAY @3
  IF ""
    DO ~GiveItem("%tutu_var%potn08", LastTalkedToBy(Myself))
        SetGlobal("mh#HelpFurnelaine", "GLOBAL", 3)~
    SOLVED_JOURNAL @4
    EXIT
END

IF ~Global("mh#HelpFurnelaine", "GLOBAL", 0)~
BEGIN fought_well
  SAY @5
  IF ""
    DO ~GiveItem("%tutu_var%bow02", LastTalkedToBy(Myself))
        SetGlobal("mh#HelpFurnelaine", "GLOBAL", 1)~
    SOLVED_JOURNAL @6
    EXIT
END

IF ~RandomNum(2, 1)~
BEGIN more_than_bears
  SAY @7
  IF ""
    EXIT
END

IF "True()"
BEGIN default
  SAY @8
  IF ""
    EXIT
END


