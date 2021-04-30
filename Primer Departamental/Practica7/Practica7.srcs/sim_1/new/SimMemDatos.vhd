LIBRARY ieee;
LIBRARY STD;

USE STD.TEXTIO.ALL;

USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
 
ENTITY SimMemDatos IS
END SimMemDatos;
 
ARCHITECTURE behavior OF SimMemDatos IS 
 
    ------Declaracion de componente Registro16------
    Component MemDatos
        generic(
            bDir : integer := 4;
            bDatos :integer := 8
        );
        Port ( Wd,Clk : in STD_LOGIC;
               add: in std_logic_vector(bDir-1 downto 0);
               DataIn : in STD_LOGIC_VECTOR (bDatos-1 downto 0);
               DataOut : out STD_LOGIC_VECTOR (bDatos-1 downto 0));
    end Component;
    -----------------------------------------------   

    ----------Entradas----------
    constant TamBusDirecciones : integer :=11;
    constant TamBusDatos : integer := 16;
    -- 1111 1111 1111 1111 'O' 2 Bytes
    
    signal Clk: std_logic := '0';
    signal Wd: std_logic := '0';   
    
    signal add : std_logic_vector(TamBusDirecciones-1 downto 0) := (others => '0');
    signal DataIn : STD_LOGIC_VECTOR (TamBusDatos-1 downto 0) := (others => '0');
    signal DataOut : STD_LOGIC_VECTOR (TamBusDatos-1 downto 0);
    -----------------------------------------------   
    
    ----------Reloj----------
    constant CLK_period : time := 10 ns;
    -----------------------------------------------   
 
BEGIN
	-- Instanciar la memoria 16bits x 2^8
    MemoriaDatos: MemDatos
        generic map(
            bDir => TamBusDirecciones,
            bDatos => TamBusDatos
        )
        Port MAP( 
            Wd => Wd,Clk => Clk,
            add => add,
            DataIn => DataIn,
            DataOut => DataOut );
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
	file ARCH_RES : TEXT;																					
	variable LINEA_RES : line;
	file ARCH_VEC : TEXT;
	variable LINEA_VEC : line;
	-------------------------------------------
	variable var_Wd: std_logic; 
	variable var_add : std_logic_vector(TamBusDirecciones-1 downto 0);
    variable var_DataIn : STD_LOGIC_VECTOR (TamBusDatos-1 downto 0);
    variable var_DataOut : STD_LOGIC_VECTOR (TamBusDatos-1 downto 0);
	------------------------------------------------
	
	VARIABLE CADENA : STRING(1 TO 7);
    begin		
		file_open(ARCH_VEC, "C:\Users\David\Downloads\FilesP7\entradas.txt", READ_MODE); 	
		file_open(ARCH_RES, "C:\Users\David\Downloads\FilesP7\resultado.txt", WRITE_MODE); 	

		CADENA := " addx16";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := "     WD";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := "DaInx16";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := "DaOux16";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo

        DataIn<=x"0000";

		WAIT FOR 10 NS;
		
		FOR I IN 0 TO 13 LOOP
			readline(ARCH_VEC,LINEA_VEC); -- lee una linea completa

			Hread(LINEA_VEC, var_Add);
			Add <= var_Add;
			
			read(LINEA_VEC, var_Wd);
			Wd <= var_Wd;
			
			Hread(LINEA_VEC, var_DataIn);			
			DataIn <= var_DataIn;
			
			WAIT UNTIL RISING_EDGE(CLK);	--ESPERO AL FLANCO DE SUBIDA 
			
			var_DataOut := DataOut;
			
			Hwrite(LINEA_RES, var_Add,	right, 8);
			write(LINEA_RES, var_Wd,	right, 8);
			Hwrite(LINEA_RES, var_DataIn,right, 8);
			Hwrite(LINEA_RES, var_DataOut,right, 8);

			writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
			
		end loop;
		file_close(ARCH_VEC);  -- cierra el archivo
		file_close(ARCH_RES);  -- cierra el archivo

      wait;
   end process;
	
END;
