library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexor_16bits is
    Port ( 
           DATA_IN1, DATA_IN2 : in STD_LOGIC_VECTOR (15 downto 0);
           SELEC : in STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (15 downto 0)
           );
end Multiplexor_16bits;

architecture Behavioral of Multiplexor_16bits is

begin
     WITH SELEC SELECT
          DATA_OUT <= DATA_IN1 WHEN '0',
          DATA_IN2 WHEN OTHERS;

end Behavioral;
