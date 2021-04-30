library IEEE;

USE STD.TEXTIO.ALL;

USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity sim_Pila is
--  Port ( );
end sim_Pila;

architecture Behavioral of sim_Pila is
    ------Declaracion de componente Pila------
    Component Pila
    Port ( pcIn : in STD_LOGIC_VECTOR (15 downto 0);
           clk,clr: in STD_LOGIC;           
           WPC, UP, DW : in STD_LOGIC;           
           pcOut : out STD_LOGIC_VECTOR (15 downto 0);
           SP : out STD_LOGIC_VECTOR(2 downto 0)
           );
    end Component;
    -----------------------------------------------   
    ----------Entradas----------
    signal pcIn : STD_LOGIC_VECTOR (15 downto 0);
    signal CLK,CLR: std_logic := '0';
    signal WPC, UP, DW: STD_LOGIC :='0'; --OPER
    
    signal pcOut : STD_LOGIC_VECTOR (15 downto 0);
    signal SP : STD_LOGIC_VECTOR(2 downto 0);
    ----------------------------------------------   
    ----------Reloj----------
    constant CLK_period : time := 10 ns;
    -----------------------------------------------   
begin
    -- Instanciar la pila 
   register16: Pila
        Port  MAP( pcIn,CLK,CLR,WPC, UP, DW, pcOut,  SP );

    -- Clock process definitions
    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

     -- Stimulus process																	
    stim_proc: process
	-------------------------------------------
	file ARCH_RES : TEXT;																					
	variable LINEA_RES : line;
	file ARCH_VEC : TEXT;
	variable LINEA_VEC : line;
	-------------------------------------------
    ----------Entradas----------
    variable var_pcIn : STD_LOGIC_VECTOR (15 downto 0);
    variable var_CLR: std_logic := '0';
    variable var_WPC, var_UP, var_DW: STD_LOGIC :='0'; --OPER
    
    variable var_pcOut : STD_LOGIC_VECTOR (15 downto 0);
    variable var_SP : STD_LOGIC_VECTOR(2 downto 0);
    ----------------------------------------------  
	VARIABLE CADENA : STRING(1 TO 7); 
    begin
        file_open(ARCH_VEC, "C:\Users\David\Downloads\FilesP8\entradas.txt", READ_MODE);
		file_open(ARCH_RES, "C:\Users\David\Downloads\FilesP8\resultado.txt", WRITE_MODE);
		CADENA := "     SP";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := "     PC";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
        pcIn<=x"0000";
		WAIT FOR 10 NS;
        
        FOR I IN 0 TO 25 LOOP
			readline(ARCH_VEC,LINEA_VEC); -- lee una linea completa

			Hread(LINEA_VEC, var_pcIn);
            pcIn <= var_pcIn;
            read(LINEA_VEC, var_WPC);
            WPC <= var_WPC;
            read(LINEA_VEC, var_UP);
            UP <= var_UP;
            read(LINEA_VEC, var_DW);
            DW <= var_DW;
			read(LINEA_VEC, var_CLR);
            CLR <= var_CLR;     
			
			WAIT UNTIL RISING_EDGE(CLK);	--ESPERO AL FLANCO DE SUBIDA 
			
			var_SP := SP;
			var_pcOut := pcOut;
			
			Hwrite(LINEA_RES, var_SP, right,8);
			Hwrite(LINEA_RES, var_pcOut, right, 8);

			writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
			
		end loop;
		
		file_close(ARCH_VEC);  -- cierra el archivo
		file_close(ARCH_RES);  -- cierra el archivo
        WAIT;
    end process;

end Behavioral;
