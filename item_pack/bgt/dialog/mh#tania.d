BEGIN "mh#tania"

IF "NumTimesTalkedTo(0)"
BEGIN firstmeet
  SAY @0
  IF ""
    REPLY @1
    GOTO introductions
  IF ""
    REPLY @2
    GOTO introductions
END

IF ""
BEGIN introductions
  SAY @3
  = @4
  = @5
  IF ""
    REPLY @6
    GOTO winter_wolf_pelts
  IF ""
    REPLY @7
    GOTO goodbye
END

IF "True()"
BEGIN default
  SAY @8
  IF ~Global("mh#TaniaWolfHide", "GLOBAL", 0)~
    REPLY @9
    GOTO winter_wolf_pelts
  IF ~Global("mh#TaniaWolfHide", "GLOBAL", 1)
      NumItemsPartyGT("misc01", 5)~
    REPLY @10
    GOTO craft_armor
  IF ~Global("mh#TaniaWolfHide", "GLOBAL", 2)
      GlobalTimerExpired("mh#TaniaCraftingHide", "GLOBAL")~
    REPLY @11
    GOTO armor_made
  IF ~Global("mh#TaniaNewRobe", "GLOBAL", 1)
      PartyHasItem("clck09")
      PartyHasItem("clck10")
      PartyHasItem("clck11")
      PartyHasItem("clck12")
      PartyHasItem("clck13")
      PartyHasItem("clck14")~
    REPLY @12
    GOTO robe_study
  IF ~Global("mh#TaniaNewRobe", "GLOBAL", 2)
      GlobalTimerExpired("mh#TaniaCraftingRobe", "GLOBAL")~
    REPLY @13
    GOTO elemental_robe
  IF ""
    REPLY @14
    GOTO goodbye
END

IF ""
BEGIN goodbye
  SAY @15
  IF ""
    EXIT
END

IF ""
BEGIN winter_wolf_pelts
  SAY @16
  = @17
  = @18
  = @19
  IF ""
    UNSOLVED_JOURNAL @20
    DO ~SetGlobal("mh#TaniaWolfHide", "GLOBAL", 1)~
    EXIT
END

IF ""
  BEGIN craft_armor
  SAY @21
  = @22
  IF ""
    DO ~TakePartyItemNum("misc01", 6)
      DestroyItem("misc01")
      DestroyItem("misc01")
      DestroyItem("misc01")
      DestroyItem("misc01")
      DestroyItem("misc01")
      DestroyItem("misc01")
      SetGlobal("mh#TaniaWolfHide", "GLOBAL", 2)
      SetGlobalTimer("mh#TaniaCraftingHide", "GLOBAL", THREE_DAYS)~
    UNSOLVED_JOURNAL @23
    EXIT
END

IF ""
BEGIN armor_made
  SAY @24
  IF ""
    DO ~GiveItemCreate("mh#armr3", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@20)
        EraseJournalEntry(@23)
        SetGlobal("mh#TaniaWolfHide", "GLOBAL", 3)~
    SOLVED_JOURNAL @25
    GOTO another_job
END

IF ""
BEGIN another_job
  SAY @26
  = @27
  = @28
  IF ""
    DO ~SetGlobal("mh#TaniaNewRobe", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @29
    EXIT
END

IF ""
BEGIN robe_study
  SAY @30
  IF ""
    DO ~TakePartyItem("clck09")
        TakePartyItem("clck10")
        TakePartyItem("clck11")
        TakePartyItem("clck12")
        TakePartyItem("clck13")
        TakePartyItem("clck14")
	DestroyItem("clck09")
	DestroyItem("clck10")
	DestroyItem("clck11")
	DestroyItem("clck12")
	DestroyItem("clck13")
	DestroyItem("clck14")
	SetGlobal("mh#TaniaNewRobe", "GLOBAL", 2)
	SetGlobalTimer("mh#TaniaCraftingRobe", "GLOBAL", SEVEN_DAYS)~
    UNSOLVED_JOURNAL @31
    EXIT
END

IF ""
BEGIN elemental_robe
  SAY @32
  = @33
  IF ""
    DO ~GiveItemCreate("mh#robe1", LastTalkedToBy(Myself), 0, 0, 0)
        EraseJournalEntry(@29)
        EraseJournalEntry(@31)
        SetGlobal("mh#TaniaNewRobe", "GLOBAL", 3)
        EscapeAreaDestroy(60)~
    SOLVED_JOURNAL @34
    EXIT
END




