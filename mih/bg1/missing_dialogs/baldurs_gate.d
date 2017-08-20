BEGIN "%tutu_scriptm%towbasc"

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 1)~
BEGIN hello
  SAY @0
  IF ""
    EXIT
END

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 2)~
BEGIN degrodel
  SAY @1
  IF ""
    JOURNAL @2
    EXIT
END

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 3)~
BEGIN fenten
  SAY @3
  IF ""
    JOURNAL @4
    EXIT
END

IF ~True()~
BEGIN go_away
  SAY @5
  IF ""
    EXIT
END


BEGIN "%FTOWBASC%"


IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 1)~
BEGIN hello
  SAY @6
  IF ""
    EXIT
END

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 2)~
BEGIN rinnie
  SAY @7
  IF ""
    JOURNAL @8
    EXIT
END

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 3)~
BEGIN sunin
  SAY @9
  IF ""
    JOURNAL @10
    EXIT
END

IF ~True()~
BEGIN no_talk
  SAY @11
  IF ""
    EXIT
END


BEGIN "%tutu_scriptm%towbasn"

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 1)~
BEGIN degrodel
  SAY @12
  IF ""
    JOURNAL @13
    EXIT
END

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 2)~
BEGIN heroes
  SAY @14
  IF ""
    JOURNAL @15
    EXIT
END

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 3)~
BEGIN watch_out
  SAY @16
  IF ""
    JOURNAL @17
    EXIT
END

IF ~True()~
BEGIN no_better
  SAY @18
  IF ""
    EXIT
END


BEGIN "%FTOWBASN%"

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 1)~
BEGIN charname
  SAY @19
  IF ""
    EXIT
END

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 2)~
BEGIN bogeyman
  SAY @20
  IF ""
    JOURNAL @21
    EXIT
END

IF ~ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)
    RandomNum(3, 3)~
BEGIN jardak
  SAY @22
  IF ""
    JOURNAL @23
    EXIT
END

IF ~True()~
BEGIN busy
  SAY @24
  IF ""
    EXIT
END


BEGIN "%tutu_scriptp%rsbax_a"

IF ~Gender(LastTalkedToBy(Myself), MALE)
    ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
BEGIN male_evil
  SAY @25
  IF ""
    EXIT
END

IF ~Gender(LastTalkedToBy(Myself), MALE)
    ReactionLT(LastTalkedToBy(Myself), FRIENDLY_LOWER)~
BEGIN male_neutral
  SAY @26
  IF ""
    EXIT
END

IF ~Gender(LastTalkedToBy(Myself), MALE)~
BEGIN male_good
  SAY @27
  IF ""
    EXIT
END

IF ~ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
BEGIN female_evil
  SAY @28
  IF ""
    EXIT
END

IF ~ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
BEGIN female_neutral
  SAY @29
  IF ""
    EXIT
END

IF ~True()~
BEGIN female_good
  SAY @30
  IF ""
    EXIT
END


BEGIN "%tutu_scriptp%rsbax_b"

IF ~Gender(LastTalkedToBy(Myself), MALE)
    ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
BEGIN male_evil
  SAY @31
  IF ""
    EXIT
END

IF ~Gender(LastTalkedToBy(Myself), MALE)
    ReactionLT(LastTalkedToBy(Myself), FRIENDLY_LOWER)~
BEGIN male_neutral
  SAY @32
  IF ""
    EXIT
END

IF ~Gender(LastTalkedToBy(Myself), MALE)~
BEGIN male_good
  SAY @33
  IF ""
    EXIT
END

IF ~ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
BEGIN female_evil
  SAY @34
  IF ""
    EXIT
END

IF ~ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
BEGIN female_neutral
  SAY @35
  IF ""
    EXIT
END

IF ~True()~
BEGIN female_good
  SAY @36
  IF ""
    EXIT
END


BEGIN "%tutu_scriptp%rsbax_c"

IF ~Gender(LastTalkedToBy(Myself), MALE)
    ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
BEGIN male_evil
  SAY @37
  IF ""
    EXIT
END

IF ~Gender(LastTalkedToBy(Myself), MALE)
    ReactionLT(LastTalkedToBy(Myself), FRIENDLY_LOWER)~
BEGIN male_neutral
  SAY @38
  IF ""
    EXIT
END

IF ~Gender(LastTalkedToBy(Myself), MALE)~
BEGIN male_good
  SAY @39
  IF ""
    EXIT
END

IF ~ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
BEGIN female_evil
  SAY @40
  IF ""
    EXIT
END

IF ~ReactionLT(LastTalkedToBy(Myself), NEUTRAL_LOWER)~
BEGIN female_neutral
  SAY @41
  IF ""
    EXIT
END

IF ~True()~
BEGIN female_good
  SAY @42
  IF ""
    EXIT
END


