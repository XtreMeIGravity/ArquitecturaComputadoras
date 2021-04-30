library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sim_Mux is
--  Port ( );
end sim_Mux;

architecture Behavioral of sim_Mux is
    -----------------------------------------------
    component Mux
        Port (
            a_in: in  std_logic_vector (6 downto 0);--Display 7 segmentos
            ec : in std_logic;
            a_out: out  std_logic_vector (6 downto 0)--Display 7 segmentos
        );
    end component;
    -----------------------------------------------
    signal a_in: std_logic_vector (6 downto 0);--Display 7 segmentos
    signal ec : std_logic;
    signal a_out: std_logic_vector (6 downto 0);--Display 7 segmentos
    -----------------------------------------------
begin
    Multiplexor: Mux Port map ( a_in, ec, a_out );
    
    P1:process    
    begin
        a_in<="0000000";
        ec <= '0';
        wait for 10ns;
        a_in<="0100000";
        ec <= '1';
        wait for 10ns;
    
    end process;


end Behavioral;
