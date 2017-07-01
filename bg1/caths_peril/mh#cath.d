BEGIN "mh#cath"

IF "NumTimesTalkedTo(0)"
BEGIN rescue
  SAY @0
  IF ""
    REPLY @1
    GOTO attacked
  IF ""
    REPLY @2
    GOTO underdressed
END

IF ""
BEGIN underdressed
  SAY @3
  IF ""
    GOTO attacked
END

IF ""
BEGIN attacked
  SAY @4
  = @5
  = @6
  = @7
  IF ""
    REPLY @8
    GOTO reward
  IF ""
    REPLY @9
    GOTO taste
  IF ""
    REPLY @10
    GOTO reward
END

IF ""
BEGIN taste
  SAY @11
  IF ""
    GOTO reward
END

IF ""
BEGIN reward
  SAY @12
  IF ""
    DO ~SetGlobal("mh#HelpCathline", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @13
    GOTO new_armor
END

IF ""
BEGIN new_armor
  SAY @14
  IF ~PartyHasItem("%tutu_var%chan01")~
    REPLY @15
    GOTO normal_chain
  IF ~PartyHasItem("%tutu_var%chan02")~
    REPLY @16
    GOTO both_scrolls
  IF ""
    REPLY @17
    GOTO goodbye
  IF ""
    REPLY @18
    GOTO goodbye
  IF ""
    REPLY @19
    GOTO rest
END

IF ""
BEGIN normal_chain
  SAY @20
  = @21
  IF ""
    DO ~TakePartyItem("%tutu_var%chan01")
GiveItem("%tutu_var%scrl56", LastTalkedToBy(Myself))
SetGlobal("mh#HelpCathline", "GLOBAL", 2)
AddexperienceParty(300)~
    UNSOLVED_JOURNAL @22
  GOTO goodbye
END

IF ""
BEGIN enchanted_chain
  SAY @23
  = @24
  IF ""
    DO ~TakePartyItem("%tutu_var%chan02")
EraseJournalEntry(@13)
EraseJournalEntry(@22)
GiveItem("%tutu_var%scrl61", LastTalkedToBy(Myself))
SetGlobal("mh#HelpCathline", "GLOBAL", 3)
AddexperienceParty(700)~
    SOLVED_JOURNAL @25
    GOTO goodbye
END
IF ""
BEGIN both_scrolls
  SAY @23
  = @26
  IF ""
    DO ~TakePartyItem("%tutu_var%chan02")
EraseJournalEntry(@13)
EraseJournalEntry(@22)
GiveItem("%tutu_var%scrl56", LastTalkedToBy(Myself))
GiveItem("%tutu_var%scrl61", LastTalkedToBy(Myself))
SetGlobal("mh#HelpCathline", "GLOBAL", 3)
AddexperienceParty(1000)~
    SOLVED_JOURNAL @27
    GOTO goodbye
END

IF "True()"
BEGIN default
  SAY @28
  IF ~PartyHasItem("%tutu_var%chan01")
Global("mh#HelpCathline", "GLOBAL", 1)~
    REPLY @29
    GOTO normal_chain
  IF ~PartyHasItem("%tutu_var%chan02")
Global("mh#HelpCathline", "GLOBAL", 1)~
    REPLY @30
    GOTO both_scrolls
  IF ~PartyHasItem("%tutu_var%chan02")
Global("mh#HelpCathline", "GLOBAL", 2)~
    REPLY @30
    GOTO enchanted_chain
  IF ""
    REPLY @31
    GOTO rest
  IF ""
    REPLY @32
    GOTO goodbye
END

IF ""
BEGIN rest
  SAY @33
  IF ""
    DO "RestParty()"
    EXIT
END

IF ""
BEGIN goodbye
  SAY @34
  IF ""
    EXIT
END


