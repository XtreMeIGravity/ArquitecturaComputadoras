library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sim_Registro is
--  Port ( );
end sim_Registro;

architecture Behavioral of sim_Registro is
 -------------------------------------------
    Component Registro
         generic(
        N:integer :=9
    );
    port(
        DA: in std_logic_vector(N-1 downto 0);
        LA,EA: in std_logic;
        clk,clr: in std_logic;
        QA: out std_logic_vector(N-1 downto 0)
    );
    end Component;
    -------------------------------------------
    -------------------------------------------
    signal N : integer := 9;
    Signal DA: std_logic_vector(N-1 downto 0);
    Signal LA,EA: std_logic;
    Signal clk,clr: std_logic;
    Signal QA: std_logic_vector(N-1 downto 0);
    -------------------------------------------
    ----------Reloj----------
    constant CLK_period : time := 10 ns;
    -----------------------------------------------   
begin    
    -------------component-----------------------
    Contador1:Registro
        generic map(N)
        Port map( DA,LA,EA,clk ,clr,QA );
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
        DA <= "000010000";
        LA <= '0';
        EA <= '0';
        clr <= '1';
        WAIT FOR 10ns;
        DA <= "000010000";
        LA <= '1';
        EA <= '0';
        clr <= '0';
        WAIT FOR 10ns;
        DA <= "000000000";
        LA <= '0';
        EA <= '0';
        clr <= '0';
        WAIT FOR 10ns;
        DA <= "000000000";
        LA <= '0';
        EA <= '1';
        clr <= '0';
        WAIT FOR 50ns;
        wait;
    end process;
end Behavioral;
