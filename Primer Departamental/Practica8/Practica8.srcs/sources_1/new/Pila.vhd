library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.numeric_std.all;

entity Pila is
    Port ( pcIn : in STD_LOGIC_VECTOR (15 downto 0);
           clk,clr: in STD_LOGIC;           
           WPC, UP, DW : in STD_LOGIC;           
           pcOut : out STD_LOGIC_VECTOR (15 downto 0);
           SP : out STD_LOGIC_VECTOR(2 downto 0)
           );
end Pila;

architecture Behavioral of Pila is
type pilaFF is array (0 to 7) of std_logic_vector(15 downto 0);
signal PILA : pilaFF := (others =>(others =>'1'));
signal PosActT:integer range 0 to 7:= 0;
begin
    --PILA
    process(clk, clr)
        variable PosAct:integer range 0 to 7:= 0;
    begin
        --limpiar la pila
        if(clr = '1') then
            for i in 0 to 7 loop
                PILA(i) <= x"FFFF";
                PosAct := 0;
            end loop;
        elsif( rising_edge(clk) ) then
            if(WPC = '0' and UP = '0' and DW = '0' )then
                PILA(PosAct) <= PILA(PosAct)+1;
            elsif(WPC = '1' and UP = '0' and DW = '0' )then
                PILA(PosAct) <= pcIn;
            elsif(WPC = '1' and UP = '1' and DW = '0' )then
                PosAct := PosAct + 1 ;
                PILA( PosAct ) <= pcIn;
            elsif(WPC = '0' and UP = '0' and DW = '1' )then
                PosAct := PosAct - 1 ;
                PILA( PosAct ) <= PILA( PosAct )+1;
            end if;
            PosActT <= PosAct;
        end if;
    end process;
    SP <= std_logic_vector(TO_SIGNED(PosActT,3));
    pcOut <= PILA(PosActT);
end Behavioral;