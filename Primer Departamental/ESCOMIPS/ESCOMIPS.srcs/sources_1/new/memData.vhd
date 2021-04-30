library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.all;

entity memData is
    generic(
            m: integer := 9;  --Bus de direcciones
            n: integer :=16   --Bus de datos
            );
    Port ( wd : in STD_LOGIC;
           clk : in STD_LOGIC;
           dir : in STD_LOGIC_VECTOR (m-1 downto 0); ---Bus de direcciones
           dataIn : in STD_LOGIC_VECTOR (n-1 downto 0); --Bus de datos entrada
           dataOut : out STD_LOGIC_VECTOR (n-1 downto 0)); ---Bus de datos salida
end memData;

architecture Behavioral of memData is
type datos is array (0 to (2**m)-1) of std_logic_vector (n-1 downto 0); --Arreglo de mxn
signal aux: datos := (others => (others => '0'));
begin
    process(clk)
    begin
        if(rising_edge(clk))then
            if(wd = '1')then
                aux (conv_integer((dir)))<= dataIn; --Escritura síncrona
            end if;
         end if;
    end process;
    ----Lectura Síncrona----
    dataOut <= aux(conv_integer((dir)));
end Behavioral;
