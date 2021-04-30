library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sim_Contador is
--  Port ( );
end sim_Contador;

architecture Behavioral of sim_Contador is
    -------------------------------------------
    Component Contador
        generic(N: integer  := 4);
        Port( 
            clr,clk: in std_logic;
            LB,EB: in std_logic;
            QB: out std_logic_vector(N-1 downto 0)
        );
    end Component;
    -------------------------------------------
    -------------------------------------------
    signal N : integer := 4;
    signal clr,clk: std_logic;
    signal LB,EB: std_logic;
    signal QB: std_logic_vector(N-1 downto 0);
    -------------------------------------------
    ----------Reloj----------
    constant CLK_period : time := 10 ns;
    -----------------------------------------------   
begin    
    -------------component-----------------------
    Contador1:Contador
        generic map(N)
        Port map( clr,clk,LB,EB,QB );
    -------------------------------------------
     -- Clock process definitions
    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;
    -------------------------------------------
    stim:process
    begin
        clr <= '0';
        LB <= '1';
        EB <= '0';
        WAIT FOR 10ns;
        LB <= '1';
        EB <= '0';
        WAIT FOR 10ns;
        LB <= '1';
        EB <= '0';
        WAIT FOR 10ns;
        LB <= '0';
        EB <= '1';
        WAIT FOR 50ns;
        wait;
    end process;
end Behavioral;
