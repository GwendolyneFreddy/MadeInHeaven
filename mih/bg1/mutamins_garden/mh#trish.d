BEGIN "mh#trish"

IF ~NumTimesTalkedTo(0)~
BEGIN unthankful
  SAY @0
  = @1
  = @2
  IF ""
    DO ~ApplySpell(Myself, RESTORE_FULL_HEALTH)
	AddexperienceParty(700)
	ForceSpell(Myself, MH_TRISH_SUMMON_SLIMES)
	Wait(1)
	ForceSpell(Myself, DRYAD_TELEPORT)
	Wait(1)
	DestroySelf()~
    JOURNAL @3
    EXIT
END


