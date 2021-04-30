library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity MemDatos is
    generic(
        bDir : integer := 4;
        bDatos :integer := 8
    );
    Port ( 
        Wd,Clk : in STD_LOGIC;
        add: in std_logic_vector(bDir-1 downto 0);
        DataIn : in STD_LOGIC_VECTOR (bDatos-1 downto 0);
        DataOut : out STD_LOGIC_VECTOR (bDatos-1 downto 0));
end MemDatos;

architecture Behavioral of MemDatos is
type arreglo is array (0 to (2**bDir)-1) of std_logic_vector(bDatos-1 downto 0);
signal aux : arreglo;
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            if( wd = '1' )then
                aux(conv_integer(add)) <= DataIn;
            end if;
        end if;
    end process;
    DataOut <= aux(conv_integer(add));
end Behavioral;
