library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SRCompleto is
    generic(N : integer :=8 );
    Port ( A,B : in STD_LOGIC_VECTOR ( N-1 downto 0);
           Selector : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR ( N-1 downto 0);
           Cout :out STD_LOGIC
           );
end SRCompleto;

architecture Behavioral of SRCompleto is
    --- señales y variables--
    SIGNAL CInOut : STD_LOGIC_VECTOR ( N downto 0);
    SIGNAL Eb : STD_LOGIC_VECTOR ( N-1 downto 0);
begin
    PROCESS( A, B, Eb, CInOut ,Selector)
    BEGIN
        CInOut(0) <= Selector;--Asigna el selector
        FOR i IN 0 TO N-1 LOOP
            Eb(i) <= B(i) XOR Selector;
            S(i) <= (A(i) XOR Eb(i)) XOR CInOut(i);
            CInOut(i+1) <= ( A(i) AND CInOut(i) ) OR (  A(i)  AND Eb(i) ) OR( Eb(i)  AND CInOut(i) );
        END LOOP;
        Cout <= CInOut(N);
    END PROCESS;
end Behavioral;