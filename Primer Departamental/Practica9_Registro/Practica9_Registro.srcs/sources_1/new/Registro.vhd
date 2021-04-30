library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;


entity Registro is
    generic(
        N:integer :=9
    );
    port(
        DA: in std_logic_vector(N-1 downto 0);
        LA,EA: in std_logic;
        clk,clr: in std_logic;
        QA: out std_logic_vector(N-1 downto 0)
    );
end Registro;

architecture Behavioral of Registro is
    signal registro: std_logic_vector(N-1 downto 0):= (others =>'0');
begin
    process(clk, clr, registro)
    variable aux:bit_vector(N-1 downto 0);
    begin
        ---
        aux := (to_bitvector(registro));
        --LIMPIA EL REGISTRO
        if(clr = '1') then
            for i in 0 to N-1 loop
                registro<= (others =>'0');
            end loop;
        ---acciones en subida
        elsif( rising_edge(clk) ) then
            if(LA = '1' and EA = '0') then -- carga
                registro <= DA;
            elsif(LA = '0' and EA = '1')then
                aux := aux srl 1;
                registro <= to_stdlogicvector(aux);
            end if;
        end if;
    end process;
    QA <= registro;
end Behavioral;
