library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimSumadorRestador is
--  Port ( );
end SimSumadorRestador;

architecture Behavioral of SimSumadorRestador is
    ------------------Componente-------------------
    COMPONENT SRCompleto
        generic(N : integer := 8 );
        Port ( A,B : in STD_LOGIC_VECTOR ( N-1 downto 0);
               Selector : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR ( N-1 downto 0);
               Cout :out STD_LOGIC);
    END COMPONENT;
    -----------------Fin componente-----------------
    -----vaariables Y constes para la simulacion-----
    constant NBits : integer := 8;
    SIGNAL A,B : STD_LOGIC_VECTOR ( NBits-1 downto 0);
    SIGNAL Selector : std_logic;
    SIGNAL S : STD_LOGIC_VECTOR ( NBits-1 downto 0);
    SIGNAL Cout : STD_LOGIC;
    --------------------------
begin
    ----------Invocar Componente--------------------
    obj1 : SRCompleto
        GENERIC MAP( N => NBits)
        PORT MAP( A, B,  Selector, S, Cout);
    --------------------------------------------------
    -----Proceso-----
    p1:PROCESS
    begin
        Selector <= '0';
            A <= "00010111"; --23
            B <= "01010111"; --87
        WAIT FOR 20ns;
            A <= "00011010"; --26
            B <= "01011111"; --95
        WAIT FOR 20ns;
            A <= "00101001"; --41
            B <= "01100010"; --98
        WAIT FOR 20ns;
            Selector <= '1';---RESTA
            A <= "10111010"; --186
            B <= "00100100"; --36
        WAIT FOR 20ns;
            Selector <= '0';
            A <= "00111111"; --63
            B <= "01100010"; --98
        WAIT FOR 20ns;
            Selector <= '1';---RESTA
            A <= "00111100"; --60
            B <= "00001111"; --15
        WAIT FOR 20ns;
            A <= "01111000"; --120
            B <= "00110000"; --48
        WAIT FOR 20ns;
            A <= "00001011"; --11
            B <= "00001000"; --8
        WAIT FOR 20ns;
            A <= "00000001"; --11
            B <= "00000100"; --8
        WAIT FOR 20ns;
            A <= "11110001"; --  -15
            B <= "11110110"; --  -10
        wait;
    End process;
    --Fin proceso--
end Behavioral;
