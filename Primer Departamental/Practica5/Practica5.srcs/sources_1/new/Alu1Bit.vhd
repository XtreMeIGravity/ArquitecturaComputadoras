library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alu1Bit is
          Port(
          a,b,sela,selb,cin:in std_logic;
          co,res: out std_logic;
          op: in std_logic_vector(1 downto 0)
          );
end Alu1Bit;

architecture Behavioral of Alu1Bit is
    Signal  auxA,auxB,auxAnd,AuxOr,AuxXor,AuxSuma: std_logic;
begin
    auxA <= A XOR selA;
	auxB <= B XOR selB;
	
	auxAnd <= auxA  and AuxB ;
	auxOr <= auxA  or AuxB ;
	auxXor <= auxA  xor AuxB ;
	auxSuma <= auxA  xor AuxB  xor Cin;
	
	co <= (auxA and Cin)   OR (auxA and AuxB) OR ( auxB and Cin) When op = "11" else 
	       '0';
	res <= auxAnd   When op = "00" else
		auxOr   When op = "01" else
		auxXor   When op = "10" else
		auxSuma;
	
end Behavioral;