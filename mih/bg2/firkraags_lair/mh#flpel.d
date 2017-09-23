BEGIN "mh#flpel"

IF ~NumTimesTalkedTo(0)~
BEGIN freedom
  SAY "Freedom!  Thank you so much, kind stranger!"
  IF ~~
    REPLY "Think nothing of it."
    GOTO good_reward
  IF ~~
    REPLY "I just couldn't let a pretty elven lass like you stay that way forever!"
    GOTO flirt
  IF ~~
    REPLY "Yeah, yeah, whatever.  Any chance of a reward for saving your elven arse?"
    GOTO evil_reward
END

IF ~~
BEGIN good_reward
  SAY "Here, take this scroll with my blessing.  I make sure all the fair folk will know what you have done for me!"
  IF ~~
    DO ~ApplySpell(Myself, RESTORE_FULL_HEALTH)
	AddexperienceParty(2000)
	ReputationInc(1)
	GiveItem("scrl61", LastTalkedToBy(Myself))
	EscapeArea()~
    EXIT
END

IF ~~
BEGIN evil_reward
  SAY "Hmph, you may have saved me, but you are downright rude!  Very well, take this scroll and be gone with you!"
  IF ~~
    DO ~ApplySpell(Myself, RESTORE_FULL_HEALTH)
        AddexperienceParty(2000)
	GiveItem("scrl56", LastTalkedToBy(Myself))
	EscapeArea()~
    EXIT
END

IF ~~
BEGIN flirt
  SAY "Oh my, you make me blush...  Mm..."
  IF ~~
    GOTO not_my_type
  IF ~Gender(PLAYER1, MALE)
      Or(3)
	Race(PLAYER1, HUMAN)
	Race(PLAYER1, HALF_ELF)
	Race(PLAYER1, ELF)
      ReactionGT(PLAYER1, NEUTRAL_UPPER)~
    GOTO lets_kiss
END

IF ~~
BEGIN not_my_type
  SAY "Thanks for the compliment, but you're not really my type."
  IF ~~
    GOTO good_reward
END

IF ~~
BEGIN lets_kiss
  SAY "You're pretty handsome yourself, you know.  How about a kiss?"
  IF ~~
    REPLY "Oh-ho, I'll not say no to a kiss from a pretty elf!"
    GOTO doing_it
  IF ~~
    REPLY "Sorry, but I don't think my lover would appreciate that."
    GOTO look_no_touch
  IF ~~
    REPLY "Just a kiss?  I'd hoped for something more..."
    GOTO no_lewd
END

IF ~~
BEGIN doing_it
  SAY "Alright, close your eyes...  *SMOOCH*"
  = "(She is a good kisser, and her nubile elven body feels warm and soft against yours even with all your gear on.)"
  = "Mm, if circumstances are different, perhaps we could...  But no, this will have to do for now."
  IF ~~
    GOTO good_reward
END

IF ~~
BEGIN look_no_touch
  SAY "Look, but no touch, eh?  That's a pity, your lover is truly lucky.  Oh well..."
  IF ~~
    GOTO good_reward
END

IF ~~
BEGIN no_lewd
  SAY "Oh my, aren't you a naughty one!  Mm, maybe if circumstances were different, but this really isn't the time or place.  Just a kiss will have to do!"
  IF ~~
    GOTO doing_it
END


