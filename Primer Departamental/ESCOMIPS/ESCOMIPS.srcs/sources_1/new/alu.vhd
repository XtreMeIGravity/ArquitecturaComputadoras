library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
    Port ( 
        a,b,selA,selB,Cin: in std_logic;
        Co,res: out std_logic;
        Op: in std_logic_vector(1 downto 0)
    );
end alu;

architecture Behavioral of alu is
    Signal auxA, auxB, auxAnd, auxOr, auxXor, auxSuma: std_logic;
begin
    auxA <= A XOR selA;
    auxB <= B XOR selB;
    
    auxAnd <= auxA AND auxB;
    auxOr <= auxA OR auxB;
    auxXor <= auxA XOR auxB;
    auxSuma <= auxA XOR auxB XOR Cin;
    
    Co <= (auxA AND Cin) OR (auxA AND auxB) OR (auxB and Cin) when Op = "11" else '0';
    
    res <= auxAnd when Op = "00" else
           auxOr when Op = "01" else
           auxXor when Op = "10" else
           auxSuma;

end Behavioral;
