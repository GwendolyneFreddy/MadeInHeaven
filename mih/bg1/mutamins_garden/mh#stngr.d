BEGIN "mh#stngr"

CHAIN
IF ~NumTimesTalkedTo(0)~
THEN "mh#stngr" grrrr
  @0
  DO ~ApplySpell(Myself, RESTORE_FULL_HEALTH)
      AddexperienceParty(300)~

== "%JAHEIRA_JOINED%" IF ~InParty("Jaheira") Detect("Jaheira") !StateCheck("Jaheira", CD_STATE_NOTVALID)~
  @1

== "%MINSC_JOINED%" IF ~InParty("Minsc") Detect("Minsc") !StateCheck("Minsc", CD_STATE_NOTVALID)~
  @2

== "%EDWIN_JOINED%" IF ~InParty("Edwin") Detect("Edwin") !StateCheck("Edwin", CD_STATE_NOTVALID)~
  @3

== "%IMOEN_JOINED%" IF ~InParty("%IMOEN_DV%") Detect("%IMOEN_DV%") !StateCheck("%IMOEN_DV%", CD_STATE_NOTVALID)~
  @4
END
  IF ""
    JOURNAL @5
    EXIT


