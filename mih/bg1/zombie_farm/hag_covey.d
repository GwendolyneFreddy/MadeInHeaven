// Patches for karmic rewards

ADD_TRANS_ACTION "%tutu_var%kirian"
BEGIN 2 END	// States
BEGIN END	// Transactions
  ~SetGlobal("mh#PeacefulKirian", "GLOBAL", 1)~

ADD_TRANS_ACTION "%tutu_var%meilum"
BEGIN 5 6 END	// States
BEGIN END	// Transactions
  ~SetGlobal("mh#PeacefulMeilum", "GLOBAL", 1)~

ADD_TRANS_ACTION "%tutu_scriptbg%sendai"
BEGIN 4 END	// States
BEGIN END	// Transactions
  ~SetGlobal("mh#PeacefulBGSendai", "GLOBAL", 1)~


// Hag taunts

BEGIN "mh#annis"

BEGIN "mh#ghag1"

BEGIN "mh#ghag2"


CHAIN
IF ~NumTimesTalkedTo(0)~
THEN "mh#annis" puny_mortals
  @0

== "mh#ghag1"
  @1

== "mh#ghag2"
  @2

== "mh#annis"
  @3

== "mh#ghag1"
  @4

== "mh#ghag2"
  @5

== "mh#annis"
  @6
END
  IF ~~
    DO ~SetGlobal("mh#FarmOfFear", "GLOBAL", 3)
        SetGlobal("mh#CoveyAttacked", "GLOBAL", 1)~
    UNSOLVED_JOURNAL @7
    EXIT

// Wenric calls for aid

BEGIN "mh#wenr2"

IF ~NumTimesTalkedTo(0)~
BEGIN found_you
  SAY @8
  IF ~~
    REPLY @9
    GOTO ogre_invasion
  IF ~~
    REPLY @10
    GOTO ogre_invasion
  IF ~~
    REPLY @11
    GOTO plead
END

IF ~~
BEGIN plead
  SAY @12
  IF ~~
    REPLY @13
    GOTO ogre_invasion
  IF ~~
    REPLY @14
    GOTO you_monster
END

IF ~~
BEGIN you_monster
  SAY @15
  IF ~~
    DO ~ReputationInc(-3)
        SetGlobal("mh#FarmOfFear", "GLOBAL", 9)
	EscapeAreaDestroy(60)~
    EXIT
END

IF ~~
BEGIN ogre_invasion
  SAY @16
  = @17
  = @18
  IF ~~
    REPLY @19
    GOTO witches_beware
  IF ~~
    REPLY @20
    GOTO flaming_fist
  IF ~~
    REPLY @21
    GOTO no_reward
END

IF ~~
BEGIN flaming_fist
  SAY @22
  IF ~~
    REPLY @19
    GOTO witches_beware
  IF ~~
    REPLY @21
    GOTO no_reward
END

IF ~~
BEGIN no_reward
  SAY @23
  IF ~~
    REPLY @24
    GOTO witches_beware
  IF ~~
    REPLY @20
    GOTO flaming_fist
  IF ~~
    REPLY @25
    GOTO you_monster
END

IF ~~
BEGIN witches_beware
  SAY @26
  IF ~~
    DO ~SetGlobal("mh#FarmOfFear", "GLOBAL", 2)
        EscapeAreaDestroy(60)~
    UNSOLVED_JOURNAL @27
    EXIT
END


BEGIN "mh#wenr3"

IF ~NumTimesTalkedTo(0)~
BEGIN success
  SAY @28
  = @29
  IF ~~
    REPLY @30
    GOTO take_it
  IF ~~
    REPLY @31
    GOTO take_it
END

IF ~~
BEGIN take_it
  SAY @32
  IF ~~
    DO ~GiveItem("%tutu_var%misc44", LastTalkedToBy(Myself))
	EraseJournalEntry(@7)
	EraseJournalEntry(@27)
	AddexperienceParty(5000)
	SetGlobal("mh#FarmOfFear", "GLOBAL", 4)~
    SOLVED_JOURNAL @33
    EXIT
END

IF ~True()~
BEGIN peace
  SAY @34
  IF ~~
    EXIT
END


