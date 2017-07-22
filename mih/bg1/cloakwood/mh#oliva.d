BEGIN "mh#oliva"

IF ~NumTimesTalkedTo(0)
    ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
BEGIN greet_evil
  SAY @0
  IF ""
    EXIT
END

IF ~NumTimesTalkedTo(0)~
BEGIN greet_good
  SAY @1
  IF ""
    DO ~SetGlobal("mh#HelpOlivia", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @2
    EXIT
END

IF ~Global("mh#HelpOlivia", "GLOBAL", 1)
    PartyHasItem("mh#hiero")~
BEGIN got_her_wish
  SAY @3
  IF ""
    DO ~TakePartyItem("mh#hiero")
        DestroyItem("mh#hiero")
	GiveItem("%tutu_var%wand07", LastTalkedToBy(Myself))
	AddexperienceParty(750)
	EraseJournalEntry(@2)
        SetGlobal("mh#HelpOlivia", "GLOBAL", 2)
	Wait(2)
	ForceSpell(Myself, MH_OLIVIA_TRANSFORMATION)~
    SOLVED_JOURNAL @4
    EXIT
END

IF ~True()~
BEGIN default
  SAY @5
  IF ""
    EXIT
END


