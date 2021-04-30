library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.numeric_std.all;

entity Contador is
    generic (N: integer  := 4);
    Port ( 
        clr,clk: in std_logic;
        LB,EB: in std_logic;
        QB: out std_logic_vector(N-1 downto 0)
    );
end Contador;

architecture Behavioral of Contador is    
    -- Señal temporal para el contador.
    signal Contador_tmp:STD_LOGIC_VECTOR(N-1 DOWNTO 0) := (others =>'0');
begin
    process(clk, clr)
    begin
        if(clr = '1') then
            Contador_tmp <= (others =>'0');
        elsif( rising_edge(clk)) then
            if(LB='0' AND EB='1')then
                Contador_tmp <= Contador_tmp + 1;
            elsif( LB='1' AND EB='0' ) then
                Contador_tmp <= (others =>'0');
            end if;
        end if;
    end process;
    QB <= Contador_tmp;
end Behavioral;
