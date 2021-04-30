library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity pila is
    Port ( PCin : in STD_LOGIC_VECTOR (15 downto 0);
           clk,clr,WPC,UP,DW : in STD_LOGIC;
           PCout : out STD_LOGIC_VECTOR (15 downto 0);
           SPOut : out STD_LOGIC_VECTOR (2 downto 0));
end pila;

architecture Behavioral of pila is
    type array_pc is array (0 to 7) of std_logic_vector(15 downto 0);
    signal SP_aux:integer range 0 to 7 := 0;
    signal stack: array_pc := (others => (others =>'0'));
begin
    process(clk,clr,stack)
        variable SP : integer range 0 to 7:=0;
        begin
        if(clr='1') then
            SP:=0;
            stack <=(others=>(others=>'0')); --Mandamos todo a 0
        elsif (rising_edge(clk)) then
            if(WPC='1' and UP='0' and DW='0') then --Salto condicional e incondicional
                stack(SP)<=PCin;
            elsif(WPC='1' and UP='1' and DW='0') then ---CALL
                SP:=SP+1;
                stack(SP)<=PCin;
           elsif (WPC = '0' and UP = '0' and DW = '0') then --PC(SP)++ AND SP = SP
                stack(SP) <= stack(SP) + 1; --Incremento del PC
            elsif (WPC = '0' and UP = '0' and DW = '1') then --RET
                SP := SP - 1;
                stack(SP) <= stack(SP) + 1;
            end if;
         end if;
         SP_aux <= SP;
      end process;
      
      SPOut <= conv_std_logic_vector(SP_aux, 3); 
      PCout <= stack(SP_aux);
end Behavioral;
