library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sim_and_triple is
--  Port ( );
end sim_and_triple;
architecture Behavioral of sim_and_triple is
    --- instanciando and
    Component and_triple
        Port ( e1,e2,e3 : in STD_LOGIC;
               s : out STD_LOGIC);
    end component;
    -------- signals aux
    signal e1,e2,e3,s:std_logic;
begin
    cualquiernombre:and_triple port map(e1,e2,e3,s);
    process
    begin
        e1<='1';
        e2<='0';
        e3<='1';
        wait for 10ns;
                
        e1<='1';
        e2<='1';
        e3<='0';
        wait for 10ns;
        wait;
   end process;
end Behavioral;
