library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simAlu is
--  Port ( );
end simAlu;

architecture Behavioral of simAlu is
    ---------------------------------------
    Component Alu4Bits
        generic( N: Integer := 4);
        Port ( AVec,BVec : in STD_LOGIC_VECTOR (N-1 downto 0);
               selA,selB : in STD_LOGIC;
               op : in STD_LOGIC_VECTOR (1 downto 0);
               ResVec : inout STD_LOGIC_VECTOR (N-1 downto 0);
               C,Negative,Ov,Z : out STD_LOGIC
               );
    end Component;
    -------------------------------------------
    constant N: integer :=4;
    signal A: std_logic_vector(N-1 downto 0);
    signal B: std_logic_vector(N-1 downto 0);
    signal selA,selB : STD_LOGIC;
    signal op : STD_LOGIC_VECTOR (1 downto 0);
    signal ResVec : STD_LOGIC_VECTOR (N-1 downto 0);
    signal C,Negative,Ov,Z : STD_LOGIC;
begin
    ----------Invocar Componente--------------------
    obj1 : Alu4Bits
        GENERIC MAP( N)
        PORT MAP(  A, B,selA,selB,op,ResVec,C,Negative,Ov,Z );
    --------------------------------------------------
    -----Proceso-----
    p1:PROCESS
    begin
        A <= "0101"; --5
        B <= "1110"; -- -2
        
        
        selA <= '0';
        selB <= '0';   --suma
        op <= "11";
        WAIT FOR 20ns;
        
        
        selA <= '0';
        selB <= '1';   --resta
        op <= "11";
        WAIT FOR 20ns; 
        
        
        selA <= '0';
        selB <= '0';   --AND
        op <= "00";
        WAIT FOR 20ns;
        
        selA <= '1';
        selB <= '1';   --NAND
        op <= "01";
        WAIT FOR 20ns;
        
        selA <= '0';
        selB <= '0';   --OR
        op <= "01";
        WAIT FOR 20ns;
                
        selA <= '1';
        selB <= '1';   --NOR
        op <= "00";
        WAIT FOR 20ns;
        
        selA <= '0';
        selB <= '0';   --XOR
        op <= "10";
        WAIT FOR 20ns;
        
        A <= "0101"; --5
        B <= "1110"; -- -2
        selA <= '1';
        selB <= '0';   --XNOR
        op <= "10";
        WAIT FOR 20ns;       
        
        ----------------------------
        A <= "0101"; --5
        B <= "0111"; -- 7
        selA <= '0';
        selB <= '0';   --suma
        op <= "11";
        WAIT FOR 20ns;
        ----------------------------
        A <= "0101"; --5
        B <= "0101"; -- 5
        selA <= '0';
        selB <= '1';   --resta
        op <= "11";
        WAIT FOR 20ns;
        
        selA <= '1';
        selB <= '1';   --NAND(NOT)
        op <= "01";
        WAIT FOR 20ns;
        
        WAIT;
    end process;

end Behavioral;

