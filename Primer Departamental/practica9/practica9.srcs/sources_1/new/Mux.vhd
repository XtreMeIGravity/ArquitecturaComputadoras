library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port (
        a_in: in  std_logic_vector (6 downto 0);--Display 7 segmentos
        ec : in std_logic;
        a_out: out  std_logic_vector (6 downto 0)--Display 7 segmentos
    );
end Mux;

architecture Behavioral of Mux is

begin
    process(a_in,ec)
	begin
	   if(ec = '0') then
		  a_out<="1111110";
	   else
		  a_out <= a_in;
	   end if;
    end process;
end Behavioral;
