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

IF ~GlobalLT("Chapter", "GLOBAL", %tutu_chapter_3%)~
BEGIN let_me_be
  SAY "Just let me be..."
  IF ""
    JOURNAL "Dwarven Smith

A dwarven smith I met at the Friendly Arm Inn told me he can't forge anything because there is no good iron.  Perhaps if trade could somehow be restored, he could forge something good?"
    EXIT
END

IF ~Global("mh#BrokkGaveGirdle", "GLOBAL", 0)
    ReactionGT(LastTalkedToBy(Myself), HOSTILE_UPPER)~
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

IF ~PartyHasItem("%tutu_var%plat06")
    Global("mh#BrokkForgeAnkheg", "GLOBAL", 0)~
BEGIN ankheg1
  SAY "Interesting armor ya be wearin' there.  Ankheg, if I be nae mistaken?  Allow an old dwarf a closer look..."
  = "Aye, ankheg, and expertly crafted, I gotta say.  Must have been that fellah down south, the Thunderhammer?  Only master smith around these parts, besides meself of course."
  IF ""
    DO ~SetGlobal("mh#BrokkForgeAnkheg", "GLOBAL", 1)~
    GOTO ankheg2
END

IF ""
BEGIN ankheg2
  SAY "By Moradin, why didn't I think of this meself?  Say, do you think you can get 'nother o' these shells?  I be hearin' a place up north be crawlin' with these critters lately."
  IF ~PartyHasItem("%tutu_var%misc12")~
    REPLY "I have one here actually.  I was hoping to get something else crafted out of it."
    GOTO ankheg3
  IF ""
    REPLY "It's dangerous business to get these, but I'll consider it."
    GOTO hub
END

IF ""
BEGIN ankheg3
  SAY "Ye be quite sumthin', these bugs are nae t' be trifled with!  Alright, let's see here..."
  = "Mm, mm...  Aye, this should create two, maybe three shields...  Tell ya what, come back in a day and ye can have da first one."
  = "By Moradin, no human is gonna outperform me!  This will be one of me finest!"
  IF ""
    DO ~TakePartyItem("%tutu_var%misc12")
        DestroyItem("%tutu_var%misc12")
	SetGlobal("mh#BrokkForgeAnkheg", "GLOBAL", 2)
	SetGlobalTimer("mh#BrokkForgingAnkheg", "GLOBAL", ONE_DAY)~
    GOTO goodbye
END

IF ~Global("mh#BrokkForgeAnkheg", "GLOBAL", 2)
    GlobalTimerExpired("mh#BrokkForgingAnkheg", "GLOBAL")~
BEGIN ankheg4
  SAY "Ah, there ya be!  And here be what I promised ye.  A fine shield, if I do say so meself."
  = "And nae, it be on the house.  Ya saved me business again really, I already be having more people waitin' for any shields I'll be carving outta that shell ye brought."
  IF ""
    DO ~GiveItemCreate("mh#shld2", LastTalkedToBy(Myself), 0, 0, 0)
        SetGlobal("mh#BrokkForgeAnkheg", "GLOBAL", 3)~
    GOTO goodbye
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
  IF "PartyGoldGT(7999)"
    REPLY "That sounds fine, let's do it!"
    GOTO scale3
  IF ""
    REPLY "Not right now, sorry."
    GOTO hub
END

IF ""
BEGIN scale3
  SAY "Aye, come back in a day and she'll be done fer ye."
  IF ""
    DO ~TakePartyItem("mh#misc1")
        DestroyItem("mh#misc1")
	TakePartyGold(8000)
	DestroyGold(8000)
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
    GOTO goodbye
END

IF ~PartyHasItem("mh#misc2")
    Global("mh#BrokkForgeMeteoric", "GLOBAL", 0)~
BEGIN meteoric1
  SAY "Mm, y'got yerself something mighty interesting there..."
  IF ""
    DO ~SetGlobal("mh#BrokkForgeMeteoric", "GLOBAL", 1)~
    GOTO meteoric2
END

IF ""
BEGIN meteoric2
  SAY "Aye, that be a mighty fine haul of meteoric iron y'all have there!  A great find, 'specially at this time!"
  = "Mm, I think ye got yerself enough for a fine shield there.  I'll do it fer ya, fer 4,000 gold!"
  IF "PartyGoldGT(3999)"
    REPLY "That sounds fine, let's do it!"
    GOTO meteoric3
  IF ""
    REPLY "Not right now, sorry."
    GOTO hub
END

IF ""
BEGIN meteoric3
  SAY "Aye, come back in a day or three and she'll be done fer ye."
  IF ""
    DO ~TakePartyItem("mh#misc2")
        DestroyItem("mh#misc2")
	TakePartyGold(4000)
	DestroyGold(4000)
	SetGlobal("mh#BrokkForgeMeteoric", "GLOBAL", 2)
	SetGlobalTimer("mh#BrokkForgingMeteoric", "GLOBAL", THREE_DAYS)~
  GOTO goodbye
END

IF ~Global("mh#BrokkForgeMeteoric", "GLOBAL", 2)
    GlobalTimerExpired("mh#BrokkForgingMeteoric", "GLOBAL")~
BEGIN meteoric4
  SAY "Yer meteoric iron shield be done.  A beauty, ain't she?  Use her well!"
  IF ""
    DO ~GiveItemCreate("mh#shld3", LastTalkedToBy(Myself), 0, 0, 0)
        SetGlobal("mh#BrokkForgeMeteoric", "GLOBAL", 3)~
    GOTO goodbye
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
  IF ~Global("mh#BrokkForgeAnkheg", "GLOBAL", 1)
      PartyHasItem("%tutu_var%misc12")~
    REPLY "I brought you an ankheg shell!"
    GOTO ankheg3
  IF ~Global("mh#BrokkForgeScale", "GLOBAL", 1)
      PartyHasItem("mh#misc1")
      PartyGoldGT(7999)~
    REPLY "Let's craft that dragon scale armor!"
    GOTO scale3
  IF ~Global("mh#BrokkForgeMeteoric", "GLOBAL", 1)
      PartyHasItem("mh#misc2")
      PartyGoldGT(3999)~
    REPLY "Let's craft that meteoric iron shield!"
    GOTO meteoric3
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


