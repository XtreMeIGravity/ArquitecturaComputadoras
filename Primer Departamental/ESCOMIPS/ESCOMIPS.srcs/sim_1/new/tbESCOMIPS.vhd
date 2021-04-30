library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tbESCOMIPS is
--  Port ( );
end tbESCOMIPS;

architecture Behavioral of tbESCOMIPS is

component ESCOMIPS is
    Port ( Reset : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Instruccion : out STD_LOGIC_VECTOR (24 downto 0);
           PC_OUT, RD1, RD2, ResALU, BusSR : out STD_LOGIC_VECTOR (15 downto 0));
end component;

--INPUTS
SIGNAL CLK : STD_LOGIC := '0';
SIGNAL RESET : STD_LOGIC := '0';

--OUTPUTS
SIGNAL PC_OUT : STD_LOGIC_VECTOR (15 downto 0);
SIGNAL RD1 : STD_LOGIC_VECTOR (15 downto 0);
SIGNAL RD2 : STD_LOGIC_VECTOR (15 downto 0);
SIGNAL ResALU : STD_LOGIC_VECTOR (15 downto 0);
SIGNAL INSTRU : STD_LOGIC_VECTOR (24 downto 0);
SIGNAL BusSR : STD_LOGIC_VECTOR (15 downto 0);

--CLOCK PERIOD DEFINITIONS
CONSTANT CLK_PERIOD: TIME := 10 NS;

begin

UUT: ESCOMIPS PORT MAP (
     CLK => CLK,
     RESET => RESET,
     PC_OUT => PC_OUT,
     RD1 => RD1,
     RD2 => RD2,
     ResALU => ResALU,
     Instruccion => INSTRU,
     BusSR => BusSR     
     );
--CLOCK PROCESS DEFINITIONS
CLK_PROCESS: PROCESS
BEGIN
     CLK <= '0';
     WAIT FOR CLK_PERIOD/2;
     CLK <= '1';
     WAIT FOR CLK_PERIOD/2;
END PROCESS;

STIM_PROCESS: PROCESS
BEGIN
     RESET <= '1';
     WAIT FOR 20 NS;
     RESET <= '0';
     WAIT FOR 20 NS;
     WAIT;
END PROCESS;

end Behavioral;
