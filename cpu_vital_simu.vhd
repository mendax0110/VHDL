library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
library alt_vtl;
use alt_vtl.SUPPORT.all;

--entity declaration--
entity AND2 is
    generic(
        TimingCheckOn : Boolean := True;
        XGenerationOn : Boolean := False;
        InstancePath  : STRING  := "*";
        tpd_IN1_Y   :   VitalDelayType01 := DefPropDelay01;
        tpd_IN2_Y   :   VitalDelayType01 := DefPropDelay01;
        tipd_IN1    :   VitalDelayType01 := DefPropDelay01;
        tipd_IN2    :   VitalDelayType01 := DefPropDelay01);

    port(
        Y   :   out STD_LOGIC;
        IN1 :   in STD_LOGIC;
        IN2 :   in STD_LOGIC);
    attribute VIRAL_LEVEL0 of AND2 : entitiy is true;
end AND2;

--architecture body--
architecture AltVITAL of AND2 is
    attribute VITAL_LEVEL1 of AltVITAL : architecture is
        TRUE;

    signal IN1_ipd : STD_ULOGIC := 'U';
    signal IN2_ipd : STD_ULOGIC := 'U';

    begin

    -------------------
    --INPUT PATH DELAYs
    -------------------
    WireDelay : block;
    begin
        VitalWireDelay (IN1_ipd, IN1, tipd_IN1);
        VitalWireDelay (IN2_ipd, IN2, tipd_IN2);
    end block;
    -------------------
    --BEHAVIOUR SECTION
    -------------------
    VITALBehaviour : process (IN1_ipd, IN2_ipd)
    --functionality results
    VARIABLE Results : STD_LOGIC_VECTOR(1 to 1) := (others => 'X');

    ALIAS Y_zd : STD_ULOGIC is Results(1);

    --output glitch detection variables
    VARIABLE Y_GlitchData : VitalGlitchDataType;

    begin

        -----------------------
        --Functionality Section
        -----------------------
        Y_zd := (IN2_ipd) AND (IN1_ipd);
        --------------------
        --Path Delay Section
        --------------------
        VitalPathDelay01 (
            OutSignal => Y,
            OutSignalName => "Y",
            OutTemp => Y_zd,
            Path => (0 => (IN1_ipd'last_event, tpd_IN1_Y, TRUE),
                     1 => (IN2_ipd'last_event, tpd_IN2_Y, TRUE)),
            GlitchData => Y_GlitchData,
            Mode => DefGlitchMode,
            Xon  => DefGlitchXon);
    end process;
end AltVITAL;


