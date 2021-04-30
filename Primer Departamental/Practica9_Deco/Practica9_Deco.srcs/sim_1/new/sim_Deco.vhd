library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sim_Deco is
--  Port ( );
end sim_Deco;

architecture Behavioral of sim_Deco is
    ----------------------------------------------------------
    component Deco
    port(
        QB: in std_logic_vector(3 downto 0);
        a: out  std_logic_vector (6 downto 0)--Display 7 segmentos
	);
	end component;
	----------------------------------------------------------
	SIGNAL QB: std_logic_vector(3 downto 0);
    SIGNAL a: std_logic_vector (6 downto 0);--Display 7 segmentos
    ----------------------------------------------------------
begin
    Decod:Deco PORT MAP(QB,a);

    P1:process
    begin
        QB<="0000";
        wait for 10ns;
        QB<="0001";
        wait for 10ns;
        QB<="0010";
        wait for 10ns;
        QB<="0011";
        wait for 10ns;
        QB<="0100";
        wait for 10ns;
        QB<="0101";
        wait for 10ns;
        QB<="0110";
        wait for 10ns;
        QB<="0111";
        wait for 10ns;
        QB<="1000";
        wait for 10ns;
        QB<="1001";
        wait for 10ns;
        QB<="1010";
        wait for 10ns;
        wait;
    end process;
end Behavioral;
