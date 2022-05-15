---------------------------------------------------------------------
--------------------------PID Controller-----------------------------
---------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--entity declaration--
entity PID is
    port(   --Inputs--
            ADC_DATA : in std_logic_vector(15 downto 0); --16bit unsigned PID input--
            CLK1     : in std_logic;
            --Outputs--
            DAC_DATA : out std_logic_vector(15 downto 0)); --16bit unsigned PID output--
end entity PID;

--architecure definition--
architecture PID_arch of PID is

    type statetype is ( Reset,              --user defined type to determine the flow of the system--
                        CalculateNewError,
                        CalculatePID,
                        DivideKg,
                        Write2DAC,
                        SOverload,
                        ConvDac );

    signal state, next_state : statetype := Reset;
    signal Kp               : integer := 10;  --proportional constant--
    signal Kd               : integer := 20;  --differential constant--
    signal Ki               : integer := 1;   --integral constant--
    signal Output           : integer := 1;   --intermediate output--
    signal inter            : integer := 0;   --intermediate signal--
    signal Setval           : integer := 33259; --set point, this is hwat the PID loop tries to achieve--
    signal sAdc             : integer := 0;     --stores the integer converted value of the ADC input--
    signal Error            : integer := 0;     --stores the deviation of the input form the set point--
    signal p,i,d            : integer := 0;     --Contain the proportional, derivative and integral errors respectively--
    signal DacDataCarrier   : std_logic_vector(15 downto 0); --contains the binary converted value to be output to the DAC--

    begin
        process(CLK1, state)    --sensitive to Clock and current state--
            variable Output_Old : integer := 0;
            variable Error_Old  : integer := 0;
            begin
                if CLK1'Event and CLK1 = '1' then
                    state <= next_state;
                end if;

                case state is
                    when Reset =>
                        sAdc <= to_integer(unsigned(ADC_DATA)); --Get the input for PID--
                        next_state <= CalculateNewError;
                        Error_Old := Error;     --Capture old error--
                        Output_Old := Output;   --Caputre old PID output--

                    when CalculateNewError =>
                        next_state <= CalculatePID;
                        inter <= (SetVal - sAdc); --Calculate Error--
                        Error <= to_integer(to_unsigned(inter,32));

                    when CalculatePID =>
                        next_state <= DivideKg;
                        p <= Kp * (Error);  --Calculate PID--
                        i <= Ki * (Error + Error_Old);
                        d <= Kd * (Error - Error_Old);

                    when DivideKg =>
                        next_state <= SOverload;
                        Output <= Output_Old+(p + i + d) / 2048; --Calculate new Output(/2048 to scale the output correctly)

                    when SOverload =>
                        next_state <= ConvDac;  --done to keep output within 16bit range--
                        if Ouput > 65535 then
                            Output <= 65535;
                        end if;
                        if Output < 1 then
                            Output <= 1;
                        end if;

                    when ConvDac =>
                        DacDataCarrier <= std_logic_vector(to_unsigned(Output, 16));
                        next_state <= Write2DAC;

                    when Write2DAC =>
                        next_state <= Reset;
                        DAC_DATA <= DacDataCarrier;
                end case;
        end process;
        
end architecture PID_arch;