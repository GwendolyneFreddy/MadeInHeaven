BEGIN "mh#cath"

IF "NumTimesTalkedTo(0)"
BEGIN rescue
  SAY "Oh, thank you so much!  I really thought I was done for!"
  IF ""
    REPLY "What happened?"
    GOTO attacked
  IF ""
    REPLY "Are you always this... uh, underdressed?"
    GOTO underdressed
END

IF ""
BEGIN underdressed
  SAY "That's the monster's doing!"
  IF ""
    GOTO attacked
END

IF ""
BEGIN attacked
  SAY "When I came home the door was open and that horrible creature was inside!  I tried to fight it, but suddenly my armor crumbled and I got hit by its tentacles!"
  = "I was paralyzed, and then that... that thing just went and gobbled me up whole!"
  = "My clothes dissolved in its stomach and I was sure I'd be next, until there was all this shouting and I got battered left and right.  I think some of your blows only just missed me!"
  = "And then all the movement just ceased and this huge gash opened up in front of me and... well, you know the rest."
  IF ""
    REPLY "Sounds like it was a really close call then.  It was pure luck I happened to be nearby."
    GOTO reward
  IF ""
    REPLY "Well, I would say that this monster had -heh- good taste."
    GOTO taste
  IF ""
    REPLY "Whatever.  Might there be a reward for saving your life?"
    GOTO reward
END

IF ""
BEGIN taste
  SAY "Heh well, I am used to men devouring me, but not quite so literally!"
  IF ""
    GOTO reward
END

IF ""
BEGIN reward
  SAY "I'd like to give you something for your help, but I need a little time to prepare it.  Meanwhile, could you do me a favor and get me a new suit of armor from Taerum?"
  IF ""
    DO ~SetGlobal("mh#HelpCathline", "GLOBAL", 1)~
    UNSOLVED_JOURNAL "New Armor for Cathline

I barely saved the life of an elven priestess named Cathline.  Her armor had failed her in battle and she was almost devoured alive by the largest carrion crawler I have ever seen.

She did mention a reward, but asked me if I could fetch her some new armor first.  Considering her formidable -ahem- 'assets', I believe only chain mail would have any chance of fitting her properly."
    GOTO new_armor
END

IF ""
BEGIN new_armor
  SAY "I prefer chain mail, that heavy plate is uncomfortable to me in, ahem, certain places."
  IF ~PartyHasItem("chan01")~
    REPLY "Why don't you try this chain mail?  I'll just get another for myself."
    GOTO normal_chain
  IF ~PartyHasItem("chan02")~
    REPLY "You definitely need something better than normal chain.  Try this magical one!"
    GOTO both_scrolls
  IF ""
    REPLY "Sure miss, I can do that for you."
    GOTO goodbye
  IF ""
    REPLY "Sure, why not.  I've carried orders for everyone else on the sword coast..."
    GOTO goodbye
  IF ""
    REPLY "Yeah, I can do that.  But we're tired, would you mind if we rested here for a spell first?"
    GOTO rest
END

IF ""
BEGIN normal_chain
  SAY "Oh, let me try that... It's a little tight, but it will do."
  = "Here, you can have this scroll.  If you are hurt badly, this can patch you right up!"
  IF ""
    DO ~TakePartyItem("chan01")
GiveItem("scrl56", LastTalkedToBy(Myself))
SetGlobal("mh#HelpCathline", "GLOBAL", 2)
AddexperienceParty(300)~
    UNSOLVED_JOURNAL "New Armor for Cathline

I gave the elf priestess Cathline a new suit of chain mail to replace the one that was destroyed in her encounter with the carrion crawler.  She was very thankful and gave us a magical scroll in return.

Still, with the iron plague and all, the risk of another dangerous wardrobe failure remains.  Perhaps I could give her something better?"
  GOTO goodbye
END

IF ""
BEGIN enchanted_chain
  SAY "Really, an enchanted suit of chain, for me?  Oh, it fits perfectly!  Thank you so much!"
  = "This is so much better than that other chain!  Here, this scroll is for you!"
  IF ""
    DO ~TakePartyItem("chan02")
GiveItem("scrl61", LastTalkedToBy(Myself))
SetGlobal("mh#HelpCathline", "GLOBAL", 3)
AddexperienceParty(700)~
    SOLVED_JOURNAL "New Armor for Cathline

I gave the elf priestess Cathline an enchanted suit of chain instead of the normal chain I gave her earlier.  She thanked me by giving me another magical scroll."
    GOTO goodbye
END
IF ""
BEGIN both_scrolls
  SAY "Really, an enchanted suit of chain, for me?  Oh, it fits perfectly!  Thank you so much!"
  = "You went way beyond what I asked for, and I shall be equally generous in return.  Here, with these two scrolls there should be no wound you can't cure."
  IF ""
    DO ~TakePartyItem("chan02")
GiveItem("scrl56", LastTalkedToBy(Myself))
GiveItem("scrl61", LastTalkedToBy(Myself))
SetGlobal("mh#HelpCathline", "GLOBAL", 3)
AddexperienceParty(1000)~
    SOLVED_JOURNAL "New Armor for Cathline

I gave the elf priesstess Cathline a suit of magical chain mail to replace the armor she lost in her encounter with the carrion crawler.  She was very thankful indeed and gave me two magical scrolls in return."
    GOTO goodbye
END

IF "True()"
BEGIN default
  SAY "Thanks again for saving me!  Come back anytime!"
  IF ~PartyHasItem("chan01")
Global("mh#HelpCathline", "GLOBAL", 1)~
    REPLY "I brought you that suit of chain mail you asked for."
    GOTO normal_chain
  IF ~PartyHasItem("chan02")
Global("mh#HelpCathline", "GLOBAL", 1)~
    REPLY "You need much better protection.  Here, take this enchanted suit of chain mail."
    GOTO both_scrolls
  IF ~PartyHasItem("chan02")
Global("mh#HelpCathline", "GLOBAL", 2)~
    REPLY "You need much better protection.  Here, take this enchanted suit of chain mail."
    GOTO enchanted_chain
  IF ""
    REPLY "Would you mind if we rested here for a spell?  It's such a long trek back to town."
    GOTO rest
  IF ""
    REPLY "Glad to see you're still safe.  Later!"
    GOTO goodbye
END

IF ""
BEGIN rest
  SAY "Sure, no problem.  Make yourselves at home!"
  IF ""
    DO "RestParty()"
    EXIT
END

IF ""
BEGIN goodbye
  SAY "Alright, have a safe trip!"
  IF ""
    EXIT
END


