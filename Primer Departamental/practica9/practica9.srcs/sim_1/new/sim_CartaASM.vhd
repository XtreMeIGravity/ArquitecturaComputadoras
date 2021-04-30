library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sim_CartaASM is
--  Port ( );
end sim_CartaASM;

architecture Behavioral of sim_CartaASM is
    -----------------------------------------------------------------
    Component CartaASM
        Port (
            ini,clr,clk: in std_logic;
            DA: in std_logic_vector(8 downto 0);
            QA: inout std_logic_vector(8 downto 0);
            SieteSegmentos: out std_logic_vector( 6 downto 0)
        );
    end Component;
    -----------------------------------------------------------------
    signal N:integer:=9;
    signal ini,clr,clk: std_logic;
    signal DA: std_logic_vector(N-1 downto 0);
    signal QA: std_logic_vector(N-1 downto 0);
    signal SieteSegmentos: std_logic_vector( 6 downto 0);
    -----------------------------------------------------------------
    ---------------------Reloj----------------------
    constant CLK_period : time := 10 ns;
    -----------------------------------------------   
begin
    -------------component-----------------------
    CASM:CartaASM port MAP(ini,clr,clk,DA,QA,SieteSegmentos);
    -------------------------------------------
     -- Clock process definitions
    CLK_process :process
    begin
        clk <= '0';
        wait for CLK_period/2;
        clk <= '1';
        wait for CLK_period/2;
    end process;
    -------------------------------------------
    
    CARTAASM_PROCESS : process
    begin
        clr <= '1';
        ini <= '0';	
        DA<="101101011";
        wait for 10 ns;   
        clr <= '0';
        wait for 10 ns; 
        ini<='1';
        wait for 120 ns;
        

        clr <= '1';
        ini <= '0';	
        DA<="000011101";
        wait for 10 ns;   
        clr <= '0';
        wait for 10 ns; 
        ini<='1';
        wait for 120 ns;
        
        
        clr <= '1';
        ini <= '0';	
        DA<="000010000";
        wait for 10 ns;   
        clr <= '0';
        wait for 10 ns; 
        ini<='1';
        wait for 120 ns;
        
        
        clr <= '1';
        ini <= '0';	
        DA<="100001000";
        wait for 10 ns;   
        clr <= '0';
        wait for 10 ns; 
        ini<='1';
        wait for 120 ns;
        
        
        clr <= '1';
        ini <= '0';	
        DA<="000000000";
        wait for 10 ns;   
        clr <= '0';
        wait for 10 ns; 
        ini<='1';
        wait for 120 ns;
        
        wait;        
    end process;    
end Behavioral;
