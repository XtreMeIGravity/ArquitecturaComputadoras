library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity Registro16 is
    Port ( writeData : in STD_LOGIC_VECTOR (15 downto 0);
           clk,clr: in STD_LOGIC;           
           WR,SHE,DIR : in STD_LOGIC;           
           writeReg : in std_logic_vector(3 downto 0);
           ReadReg1,ReadReg2: in std_logic_vector(3 downto 0);
           shamt : in std_logic_vector(3 downto 0);
           ReadData1,ReadData2 : out STD_LOGIC_VECTOR (15 downto 0)
           );
end Registro16;

architecture Behavioral of Registro16 is
type banco is array (0 to 15) of std_logic_vector(15 downto 0);
signal registros : banco; 
begin
    process(clk, clr, registros, writeReg, ReadReg2, ReadReg1)
    variable aux:bit_vector(15 downto 0);
    begin
        aux := (to_bitvector(registros(conv_integer(ReadReg2))));
        --LIMPIA EL REGISTRO
        if(clr = '1') then
            for i in 0 to 15 loop
                registros(i) <= x"0000";
            end loop;
        ---acciones en subida
        elsif( rising_edge(clk) ) then
            if(WR = '1' and SHE = '0') then -- carga
                registros(conv_integer(writeReg)) <= writeData;
            elsif(WR = '1' and SHE = '1')then
                    if(DIR ='0') THEN--- corrimiento derecha
                        aux := aux srl conv_integer(shamt);
                    elsif(DIR='1')then --- corrimiento izquierda
                        aux := aux sll conv_integer(shamt);
                    end if;
                registros(conv_integer(writeReg)) <= to_stdlogicvector(aux);
            end if;
        end if;
    end process;
    ReadData1 <= registros(conv_integer(ReadReg1));
    ReadData2 <= registros(conv_integer(ReadReg2));
end Behavioral;