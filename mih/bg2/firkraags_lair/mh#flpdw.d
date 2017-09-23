BEGIN "mh#flpdw"

IF ~NumTimesTalkedTo(0)~
BEGIN rescued
  SAY "Have at ya, mons... eh, what happened?  And who are you?"
  IF ~~
    REPLY "Easy, friend.  You were petrified by a basilisk."
    GOTO friendly
  IF ~~
    REPLY "I just saved you from being a pidgeon stool.  Any chance of a reward?"
    GOTO hostile
END

IF ~~
BEGIN friendly
  SAY "Petrified, eh?  Yeah, I do remember some sort of lizard staring at me..."
  = "And you saved me?  Thanks pal, I owe you one. Here, it's not much but take these."
  IF ~~
    DO ~ApplySpell(Myself, RESTORE_FULL_HEALTH)
	AddexperienceParty(2000)
	GiveItem("potn09", LastTalkedToBy(Myself))
	GiveItem("potn52", LastTalkedToBy(Myself))
	EscapeArea()~
    EXIT
END

IF ~~
BEGIN hostile
  SAY "Hmph, can't say I like your attitude, but I suppose I do owe you."
  = "Very well, take this gold.  Good luck and goodbye!"
  IF ~~
    DO ~ApplySpell(Myself, RESTORE_FULL_HEALTH)
	AddexperienceParty(2000)
	GivePartyGold(200)
	EscapeArea()~
    EXIT
END


