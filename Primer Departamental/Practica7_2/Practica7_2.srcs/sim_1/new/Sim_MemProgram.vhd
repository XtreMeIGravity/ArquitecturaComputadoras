LIBRARY ieee;
LIBRARY STD;

USE STD.TEXTIO.ALL;

USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
 
ENTITY Sim_MemProgram IS
END Sim_MemProgram;
 
ARCHITECTURE behavior OF Sim_MemProgram IS 
 
    ------Declaracion de componente Program------
    Component MemProgram
        generic(
            bDir : integer := 10;
            bDatos :integer := 25
        );
        Port ( 
            PC: in std_logic_vector(bDir-1 downto 0);
            Ints : out STD_LOGIC_VECTOR (bDatos-1 downto 0));
    end Component;
    -----------------------------------------------   
    ----------Entradas----------
    constant TamBusDirecciones : integer :=10;
    constant TamBusDatos : integer := 25;
    signal PC : std_logic_vector(TamBusDirecciones-1 downto 0) := (others => '0');
    signal Ints : STD_LOGIC_VECTOR (TamBusDatos-1 downto 0);
    -----------------------------------------------   
     
BEGIN
	-- Instanciar la memoria 25 bits x 2^10 = 25600bits o 3200Bytes
    MemPrograma: MemProgram
        generic map(
            bDir => TamBusDirecciones,
            bDatos => TamBusDatos
        )
        Port MAP( 
            PC,
            Ints);
     -- Stimulus process																	
    stim_proc: process
    -------------------------------------------------
	file ARCH_RES : TEXT;																					
	variable LINEA_RES : line;
	-------------------------------------------------
	variable var_PC: std_logic_vector(9 downto 0);
	variable var_OPCODE: std_logic_vector(4 downto 0);
	variable var_19_16 : std_logic_vector(3 downto 0);
	variable var_15_12 : std_logic_vector(3 downto 0);
	variable var_11_08 : std_logic_vector(3 downto 0);
	variable var_07_04 : std_logic_vector(3 downto 0);
	variable var_03_00 : std_logic_vector(3 downto 0);
	-------------------------------------------------
	
	VARIABLE CADENA : STRING(1 TO 7);
    begin		
		file_open(ARCH_RES, "C:\Users\David\Downloads\FilesP7.2\resultado.txt", WRITE_MODE); 	

	   CADENA := "     PC";
	   write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
	   CADENA := " OPCODE";
	   write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
	   CADENA := "  19-16";
	   write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
	   CADENA := "  15-12";
	   write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
	   CADENA := "  11-08";
	   write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
	   CADENA := "  07-04";
	   write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
	   CADENA := "  03-00";
	   write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
	   writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
	   WAIT FOR 10 NS;
	   FOR I IN 0 TO 11 LOOP
			var_PC := PC;
			Hwrite(LINEA_RES, var_PC,	right, 8);
			var_OPCODE :=Ints(24 downto 20);
			write(LINEA_RES, var_OPCODE,right, 8);
			var_19_16 :=Ints(19 downto 16);
			write(LINEA_RES, var_19_16 ,right, 8);
			var_15_12 :=Ints(15 downto 12);
			write(LINEA_RES, var_15_12 ,right, 8);
			var_11_08 :=Ints(11 downto 8);
			write(LINEA_RES, var_11_08 ,right, 8);
			var_07_04 :=Ints(7 downto 4);
			write(LINEA_RES, var_07_04 ,right, 8);
			var_03_00 :=Ints(3 downto 0);
			write(LINEA_RES, var_03_00 ,right, 8);
			writeline(ARCH_RES,LINEA_RES);-- escribe la linea en el archivo
		    PC <= PC+1;
	       WAIT FOR 10 NS;
	   end loop;
	   file_close(ARCH_RES);  -- cierra el archivo
       wait;
   end process;
	
END;
