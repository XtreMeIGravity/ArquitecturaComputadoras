library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity aluComponentes is
    generic( N: integer := 16);
    Port ( aVec,bVec : in STD_LOGIC_VECTOR (N-1 downto 0);
           selA,selB : in STD_LOGIC;
           Op : in STD_LOGIC_VECTOR (1 downto 0);
           resVec : out STD_LOGIC_VECTOR (N-1 downto 0);
           C,Negative,Ov,Z : out STD_LOGIC
           );
end aluComponentes;

architecture Behavioral of aluComponentes is
    -------------Entidad de la ALU de 1 bit----------------------
    Component alu is
    Port ( 
        a,b,selA,selB,Cin: in std_logic;
        Co,res: out std_logic;
        Op: in std_logic_vector(1 downto 0)
    );
    end component;
    -----------------------------------
    Signal CoutIn : STD_LOGIC_VECTOR (N downto 0);
    Signal ResVect: STD_LOGIC_VECTOR (N-1 downto 0);
    -----------------------------------
begin
    CoutIn(0) <= selB;
    
    Ciclo: for i in 0 to N-1 generate 
        ---Component---
        objAlu: alu Port Map(
            a => aVec(i),
            b => bVec(i),
            selA => selA,
            selB => selB,
            Cin => CoutIn(i),
            Co => CoutIn(i+1),
            res => ResVect(i),
            op => op
        );
        end generate;
        
    process(ResVect,CoutIn)
    variable resOrAux: STD_LOGIC; 
    begin
        for i in 0 to N-1 loop 
            if(i=0) then
                resOrAux := ResVect(i);
            else
                resOrAux := resOrAux OR ResVect(i);
            end if;
        end loop;
        Z <= NOT(resOrAux); 
    end process;
        resVec <= ResVect;
        C <= CoutIn(N);
        Negative <= ResVect(N-1);
        Ov <= CoutIn(N) XOR CoutIn(N-1);
    
end Behavioral;
