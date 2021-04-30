

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ORTriple is
    Port ( a,b,c : in STD_LOGIC;
           Outt : out STD_LOGIC);
end ORTriple;

architecture Behavioral of ORTriple is
begin

    PROCESS(a,b,c)
    BEGIN
        Outt <= a OR b OR c;
    END PROCESS;

end Behavioral;
