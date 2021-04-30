library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.componentes.all;

entity CartaASM is
    Port (
        ini,clr,clk: in std_logic;
        DA: in std_logic_vector(8 downto 0);
        QA: inout std_logic_vector(8 downto 0);
        SieteSegmentos: out std_logic_vector( 6 downto 0)
    );
end CartaASM;

architecture Behavioral of CartaASM is
    ---------------------------------------------
    signal N_Aux2:integer := 4;
    signal a0,z : STD_LOGIC;
    signal LA,EA,LB,EB,EC : STD_LOGIC;
    signal QB : std_logic_vector( 3 downto 0);
    signal AIn : std_logic_vector( 6 downto 0);
    signal AOut : std_logic_vector( 6 downto 0);
    SIGNAL QA_aux : std_logic_vector( 8 downto 0);
    ---------------------------------------------
begin
    UC:UnidadDeControl port map(clk,clr,a0,z,ini,LA,EA,LB,EB,EC );
    Con:Contador generic map(4)Port map(clr,clk,LB,EB,QB);
    Reg: Registro generic map(9) port map( DA,LA,EA,clk,clr,QA);
    Decod: Deco port map( QB, AIn );
    Multiplexor: Mux port map( AIn, EC, AOut );
    QA_aux <= QA;
    z<= NOT( QA_aux(8) OR QA_aux(7) OR QA_aux(6) OR QA_aux(5) OR QA_aux(4) OR QA_aux(3) OR QA_aux(2) OR QA_aux(1) OR QA_aux(0) );
    a0<= QA_aux(0);
    SieteSegmentos<=AOut;
end Behavioral;
