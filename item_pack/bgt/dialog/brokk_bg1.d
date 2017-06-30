BEGIN "mh#brok1"

IF "NumTimesTalkedTo(0)"
BEGIN first_meet
  SAY "Eh, who be you, now?  Me forge be closed!"
  IF ""
    REPLY "Why are you closed?"
    GOTO no_business
  IF ""
    REPLY "Oh, never mind."
    GOTO let_me_be
END

IF ""
BEGIN no_business
  SAY "There be no good iron t'forge with, that's why!  What little I have tends t'crumble right on me anvil!"
  IF ""
    GOTO let_me_be
END

IF ~GlobalLT("Chapter", "GLOBAL", 3)~
BEGIN let_me_be
  SAY "Just let me be..."
  IF ""
    JOURNAL "Dwarven Smith

A dwarven smith I met at the Friendly Arm Inn told me he can't forge anything because there is no good iron.  Perhaps if trade could somehow be restored, he could forge something good?"
    EXIT
END

IF ~Global("mh#BrokkGaveGirdle", "GLOBAL", 0)
    ReactionGT(Myself, HOSTILE_UPPER)~
BEGIN girdle1
  SAY "Hey, I recognize t' lot of ye.  Y've been cleaning out that mine down south, aye?"
  = "Y'did mighty fine, and this old dwarf thanks ye.  Here, take this with ye with me thanks."
  = "Me name be Brokk.  If ya need anything forged, I be yer dwarf."
  IF ""
    DO ~GiveItemCreate("mh#belt1", LastTalkedToBy(Myself), 0, 0, 0)
        SetGlobal("mh#BrokkGaveGirdle", "GLOBAL", 1)~
    JOURNAL "A Job Well Done

The dwarf Brokk at the Friendly Arm Inn gave me an enchanted girdle for restoring the mine down south.  I wonder what it does?"
    GOTO hub
END

IF ~PartyHasItem("mh#misc1")
    Global("mh#BrokkForgeScale", "GLOBAL", 0)~
BEGIN scale1
  SAY "Mm, y'got yerself something mighty interesting there..."
  IF ""
    DO ~SetGlobal("mh#BrokkForgeScale", "GLOBAL", 1)~
    GOTO scale2
END

IF ""
BEGIN scale2
  SAY "Green dragon scales, aye?  And from da look of 'm, already cured.  Y'be wantin' me t' craft some armor then?"
  = "These be lean times, so I'll give ye a fine deal, only 8000 gold."
  IF ""
    REPLY "Not right now, sorry."
    GOTO hub
  IF "PartyGoldGT(7999)"
    REPLY "That sounds fine, let's do it!"
    GOTO scale3
END

IF ""
BEGIN scale3
  SAY "Aye, come back in a day and she'll be done fer ye."
  IF ""
    DO ~TakePartyItem("mh#misc1")
        DestroyItem("mh#misc1")
	TakePartyGold(7500)
	SetGlobal("mh#BrokkForgeScale", "GLOBAL", 2)
	SetGlobalTimer("mh#BrokkForgingScale", "GLOBAL", ONE_DAY)~
  GOTO goodbye
END

IF ~Global("mh#BrokkForgeScale", "GLOBAL", 2)
    GlobalTimerExpired("mh#BrokkForgingScale", "GLOBAL")~
BEGIN scale4
  SAY "Yer dragon scale be done.  A beauty, ain't she?  Use her well!"
  IF ""
    DO ~GiveItemCreate("mh#armr1", LastTalkedToBy(Myself), 0, 0, 0)
        SetGlobal("mh#BrokkForgeScale", "GLOBAL", 3)~
    GOTO hub
END

IF "True()"
BEGIN default
  SAY "Welcome back t'me forge!"
  IF ""
    GOTO hub
END

IF ""
BEGIN hub
  SAY "So, ye be wanting sumthin' from this old dwarf?"
  IF ~Global("mh#BrokkForgeScale", "GLOBAL", 1)
      PartyHasItem("mh#misc1")
      PartyGoldGT(7999)~
    REPLY "Let's craft that dragon scale!"
    GOTO scale3
  IF ""
    REPLY "What do you have for sale?"
    GOTO shop
  IF ""
    REPLY "Nothing for now."
    GOTO goodbye
  IF ~Global("mh#BrokkDwarvenMagic", "GLOBAL", 0)~
    REPLY "I was wondering...  You don't seem to be a cleric or wizard.  How come you can forge enchanted weapons?"
    GOTO dwarven_magic
END

IF ""
BEGIN shop
  SAY "Here ya be, me finest work!"
  IF ""
    DO ~StartStore("mh#brok1", LastTalkedToBy(Myself))~
    EXIT
END

IF ""
BEGIN goodbye
  SAY "Right, time t'get back t'work."
  IF ""
    EXIT
END

IF ""
BEGIN dwarven_magic
  SAY "Aye, it be true, I be no cleric or wizard.  It be the blessing of the Soul Forger.  Some of us dwarves got it in themselves t'craft weapons and armor that are innately magical."
  = "It be a rare enough talent, and even if y'got it, it takes years t'bring it out and hone it 't perfection.  Longer than a human'd live, in most cases.  Fer me it took more than a hundred years."
  IF ""
    DO ~SetGlobal("mh#BrokkDwarvenMagic", "GLOBAL", 1)~
    JOURNAL "The Blessing of the Soul Forger

The smith Brokk told me that a rare few dwarves have the innate ability to create magical weapons without being clerics or wizards.  It apparently takes many years to hone the talent."
    GOTO goodbye
END


