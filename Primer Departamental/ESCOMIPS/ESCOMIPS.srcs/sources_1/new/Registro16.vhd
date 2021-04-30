library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Registro16 is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           WR : in STD_LOGIC; --Señal de control
           SHE : in STD_LOGIC; --Señal de control
           DIR : in STD_LOGIC; --Señal de control
           WReg : in STD_LOGIC_VECTOR (3 downto 0); --Número de registro
           WData : in STD_LOGIC_VECTOR (15 downto 0);
           RReg1 : in STD_LOGIC_VECTOR (3 downto 0);
           RReg2 : in STD_LOGIC_VECTOR (3 downto 0);
           Shamt : in STD_LOGIC_VECTOR (3 downto 0);
           RData1 : out STD_LOGIC_VECTOR (15 downto 0);
           RData2 : out STD_LOGIC_VECTOR (15 downto 0));
end Registro16;

architecture Behavioral of Registro16 is
type banco is array (0 to 15) of std_logic_vector(15 downto 0);
signal registros : banco;
begin
    process(clk, clr, WR, SHE, DIR)
    variable aux: bit_vector(15 downto 0);
    variable auxq: std_logic_vector(15 downto 0);
    begin
         aux := to_bitvector(auxq);
        --Reset, se limpia el registro
        if(clr ='1') then
            for i in 0 to 15 loop
                registros(i) <= x"0000";
            end loop;
         
         elsif (rising_edge(clk))then
            if( WR='1' and SHE='0')then   --Carga
                registros(conv_integer(WReg)) <= WData;
            elsif( WR='1' and SHE ='1')then --Corrimiento
                auxq := registros(conv_integer(RReg2));
                aux := to_bitvector(auxq);
                if(DIR='0')then --A la derecha
                    aux := aux srl conv_integer(Shamt);
                else --A la izquierda
                    aux := aux sll conv_integer(Shamt);
                end if;
                auxq := to_stdlogicvector(aux);
                registros(conv_integer(WReg)) <=auxq;
            end if;
         end if;               
    end process;
--Lecturas
RData1 <= registros(conv_integer(RReg1));
RData2 <= registros(conv_integer(RReg2));
end Behavioral;