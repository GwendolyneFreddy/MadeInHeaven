BEGIN "mh#lurch"

IF ~NumTimesTalkedTo(0)~
BEGIN saved
  SAY @0
  IF ""
    REPLY @1
    GOTO noble
  IF ""
    REPLY @2
    GOTO fight
END

IF ""
BEGIN noble
  SAY @3
  = @4
  IF ""
    JOURNAL @5
    DO ~ApplySpell(Myself, RESTORE_FULL_HEALTH)
        GiveItem("misc44", LastTalkedToBy(Myself))
        ChangeAlignment(Myself, CHAOTIC_NEUTRAL)
        AddExperienceParty(2000)
	EscapeAreaDestroy(90)~
    EXIT
END

IF ""
BEGIN fight
  SAY @6
  IF ""
    DO ~ApplySpell(Myself, RESTORE_FULL_HEALTH)
        Enemy()~
    EXIT
END


