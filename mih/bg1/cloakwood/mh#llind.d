BEGIN "mh#llind"

IF ~Global("mh#HelpLlindellyn", "GLOBAL", 0)~
BEGIN hello
  SAY @0
  IF ""
    GOTO archer
  IF ~HasItem("%tutu_var%bow01", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%bow02", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%bow03", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%bow04", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%bow05", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%bow06", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%bow07", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%bow08", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%bow09", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%xbow01", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%xbow02", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%xbow03", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%xbow04", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%xbow05", LastTalkedToBy(Myself))~
    GOTO lost_arrow
  IF ~HasItem("%tutu_var%xbow06", LastTalkedToBy(Myself))~
    GOTO lost_arrow
END

IF ""
BEGIN archer
  SAY @1
  IF ""
    UNSOLVED_JOURNAL @2
    EXIT
END

IF ""
BEGIN lost_arrow
  SAY @3
  IF ""
    DO ~SetGlobal("mh#HelpLlindellyn", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @4
    EXIT
END

IF ~Global("mh#HelpLlindellyn", "GLOBAL", 1)
    !PartyHasItem("mh#lucky")~
BEGIN not_found
  SAY @5
  IF ""
    EXIT
END

IF ~Global("mh#HelpLlindellyn", "GLOBAL", 1)
    ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)
    PartyHasItem("mh#lucky")~
BEGIN found_evil
  SAY @6
  IF ""
    DO ~TakePartyItem("mh#lucky")
        GiveItem("%tutu_var%arow02", LastTalkedToBy(Myself))
        AddexperienceParty(750)
	EraseJournalEntry(@2)
	EraseJournalEntry(@4)
        SetGlobal("mh#HelpLlindellyn", "GLOBAL", 2)~
    SOLVED_JOURNAL @7
    EXIT
END

IF ~Global("mh#HelpLlindellyn", "GLOBAL", 1)
    ReactionLT(LastTalkedToBy(Myself), FRIENDLY_LOWER)
    PartyHasItem("mh#lucky")~
BEGIN found_neutral
  SAY @8
  IF ""
    DO ~TakePartyItem("mh#lucky")
        GiveItem("%tutu_var%arow10", LastTalkedToBy(Myself))
        AddexperienceParty(750)
	EraseJournalEntry(@2)
	EraseJournalEntry(@4)
        SetGlobal("mh#HelpLlindellyn", "GLOBAL", 2)~
    SOLVED_JOURNAL @9
    EXIT
END

IF ~Global("mh#HelpLlindellyn", "GLOBAL", 1)
    PartyHasItem("mh#lucky")~
BEGIN found_good
  SAY @10
  IF ""
    DO ~TakePartyItem("mh#lucky")
        GiveItem("%tutu_var%arow06", LastTalkedToBy(Myself))
        AddexperienceParty(750)
	EraseJournalEntry(@2)
	EraseJournalEntry(@4)
        SetGlobal("mh#HelpLlindellyn", "GLOBAL", 2)~
    SOLVED_JOURNAL @11
    EXIT
END

IF ~True()~
BEGIN default
  SAY @12
  IF ""
    EXIT
END


