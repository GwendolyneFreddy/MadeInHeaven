BEGIN "mh#letha"

IF ~NumTimesTalkedTo(0)~
BEGIN first_meet
  SAY @0
  IF ""
    REPLY @1
    GOTO lost_telkiira
  IF ~~
    REPLY @2
    GOTO sea_elf
  IF ~~
    REPLY @3
    GOTO rude
END

IF ~~
BEGIN sea_elf
  SAY @4
  IF ~~
    REPLY @5
    GOTO lost_telkiira
  IF ~~
    REPLY @6
    GOTO rude
END

IF ~~
BEGIN rude
  SAY @7
  IF ~~
    REPLY @8
    GOTO shipwreck
  IF ~~
    REPLY @9
    GOTO leave
END

IF ~~
BEGIN leave
  SAY @10
  IF ~~
    DO ~ReputationInc(-1)
	ForceSpell(Myself, DRYAD_TELEPORT)
	Wait(1)
	DestroySelf()~
    EXIT
END

IF ~~
BEGIN shipwreck
  SAY @11
  IF ~~
    REPLY @5
    GOTO lost_telkiira
  IF ~~
    REPLY @12
    GOTO leave
END

IF ~~
BEGIN lost_telkiira
  SAY @13
  = @14
  = @15
  IF ~~
    REPLY @16
    GOTO took_quest
  IF ~~
    REPLY @17
    GOTO took_quest
END

IF ~~
BEGIN took_quest
  SAY @18
  = @19
  = @20
  IF ~~
    DO ~GiveItem("scrl75", LastTalkedToBy(Myself))
        SetGlobal("mh#HelpLetha", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @21
    EXIT
END

IF ~PartyHasItem("mh#misc3")~
BEGIN found_it
  SAY @22
  = @23
  IF ~~
    DO ~TakePartyItem("mh#misc3")
        GiveItem("mh#ioun2", LastTalkedToBy(Myself))
	ReputationInc(1)
	AddexperienceParty(2000)
	EraseJournalEntry(@21)
	EraseJournalEntry(@33)
	EraseJournalEntry(@36)
	EraseJournalEntry(@44)
	ForceSpell(Myself, DRYAD_TELEPORT)
	Wait(1)
	DestroySelf()~
    SOLVED_JOURNAL @47
    EXIT
END

IF ~True()~
BEGIN keep_looking
  SAY @24
  IF ~~
    EXIT
END


BEGIN "mh#helen"

IF ~Global("mh#HelpLetha", "GLOBAL", 2)~
BEGIN look_what_I_found
  SAY @25
  IF ~ReactionGT(LastTalkedToBy(Myself), NEUTRAL_UPPER)~
    REPLY @26
    GOTO give_nice
  IF ~ReactionLT(LastTalkedToBy(Myself), FRIENDLY_LOWER)~
    REPLY @26
    GOTO not_like
  IF ~~
    REPLY @27
    GOTO beach
END

IF ~~
BEGIN beach
  SAY @28
  = @29
  IF ~ReactionGT(LastTalkedToBy(Myself), NEUTRAL_UPPER)~
    REPLY @26
    GOTO give_nice
  IF ~ReactionLT(LastTalkedToBy(Myself), FRIENDLY_LOWER)~
    REPLY @26
    GOTO not_like
  IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)~
    REPLY @30
    GOTO give_scare
  IF ~ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
    REPLY @30
    GOTO not_like
END

IF ~~
BEGIN give_nice
  SAY @31
  IF ~~
    REPLY @32
    DO ~GiveItem("mh#misc3", LastTalkedToBy(Myself))
        SetGlobal("mh#HelpLetha", "GLOBAL", 3)~
    UNSOLVED_JOURNAL @33
    EXIT
END

IF ~~
BEGIN give_scare
  SAY @34
  IF ~~
    REPLY @35
    DO ~GiveItem("mh#misc3", LastTalkedToBy(Myself))
        SetGlobal("mh#HelpLetha", "GLOBAL", 3)~
    UNSOLVED_JOURNAL @36
    EXIT
END

IF ~~
BEGIN not_like
  SAY @37
  IF ~PartyGoldGT(49)~
    REPLY @38
    GOTO give_bribe
  IF ~~
    REPLY @39
    GOTO threat
END

IF ~~
BEGIN give_bribe
  SAY @40
  IF ~~
    REPLY @35
    DO ~GiveItem("mh#misc3", LastTalkedToBy(Myself))
        TakePartyGold(50)
        SetGlobal("mh#HelpLetha", "GLOBAL", 3)~
    UNSOLVED_JOURNAL @41
    EXIT
END

IF ~~
BEGIN threat
  SAY @42
  IF ~~
    REPLY @43
    DO ~SetGlobal("mh#HelpLetha", "GLOBAL", 3)~
    UNSOLVED_JOURNAL @44
    EXIT
END

IF ~NumTimesTalkedTo(0)~
BEGIN first_meet
  SAY @45
  IF ~~
    GOTO playing
END

IF ~True()~
BEGIN playing
  SAY @46
  IF ~~
    EXIT
END


