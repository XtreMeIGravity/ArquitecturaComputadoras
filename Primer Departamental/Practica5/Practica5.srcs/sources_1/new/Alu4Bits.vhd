library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alu4Bits is
    generic( N: Integer := 4);
    Port ( AVec,BVec : in STD_LOGIC_VECTOR (N-1 downto 0);
           selA,selB : in STD_LOGIC;
           op : in STD_LOGIC_VECTOR (1 downto 0);
           ResVec : out STD_LOGIC_VECTOR ( N-1 downto 0);
           C,Negative,Ov,Z : out STD_LOGIC
           );
end Alu4Bits;

architecture Behavioral of Alu4Bits is
    -------------------
    Component Alu1Bit
              Port(
              a,b,sela,selb,cin:in std_logic;
              co,res: out std_logic;
              op: in std_logic_vector(1 downto 0)
              );
    end component;
    ------------------
    signal COutIn :STD_LOGIC_VECTOR (N downto 0);
    signal ResVecT: std_logic_vector( N-1 DOWNTO 0);
    ------------------
begin
    COutIn(0) <= selB;
    Ciclo: for i in 0 to N-1 generate
        ---compoennt  
        objAlu: Alu1Bit PORT MAP ( 
            a => AVec(i),
            b => BVec(i),
            sela => selA,
            selb => selB,
            cin => COutIn(i),
            co => COutIn(i+1),
            res=>ResVecT(i),
            op => op
        );
        -----component  
    end generate;
    process(ResVecT,COutIn)
    variable resOrAux:std_logic;
    begin
        for i in 0 to N-1 loop
            if(i=0) then
                resOrAux := ResVecT(i);
            else
                resOrAux := resOrAux OR ResVecT(i);
            end if;
        end loop;
        Z <= NOT(resOrAux);
    end process;
        ResVec <= ResVecT;
        c <= COutIn(N);
        Negative <= ResVecT(N-1);
        Ov <= COutIn(N) xor COutIn(N-1);
    
end Behavioral;
