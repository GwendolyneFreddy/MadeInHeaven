// Alaundro's Prophecies by the chanters

BEGIN "%tutu_var%chanter"

IF "True()"
BEGIN default
  SAY #4607
  IF ""
    EXIT
END


BEGIN "%tutu_var%voieas"

IF "True()"
BEGIN default
  SAY #4601
  IF ""
    EXIT
END


BEGIN "%tutu_var%voinor"

IF "True()"
BEGIN default
  SAY #4606
  IF ""
    EXIT
END


BEGIN "%tutu_var%voisou"

IF "True()"
BEGIN default
  SAY #4603
  IF ""
    EXIT
END


BEGIN "%tutu_var%voiwes"

IF "True()"
BEGIN default
  SAY #4605
  IF ""
    EXIT
END


// Default fallback dialogs for Phlydia and Reevor

APPEND "%tutu_var%phlydi"

IF "True()"
BEGIN default
  SAY @0
  IF ""
    EXIT
END

END	// APPEND


APPEND "%tutu_var%reevor"
IF "True()"
BEGIN default
  SAY @1
  IF ""
    EXIT
END

END	// APPEND


