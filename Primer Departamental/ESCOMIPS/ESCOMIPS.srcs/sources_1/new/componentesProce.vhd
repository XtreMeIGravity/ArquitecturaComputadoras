library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package componentesProce is

-- ALU DE 16 BITS
component aluComponentes is
    generic( N: integer := 16);
    Port ( aVec,bVec : in STD_LOGIC_VECTOR (N-1 downto 0);
           selA,selB : in STD_LOGIC;
           Op : in STD_LOGIC_VECTOR (1 downto 0);
           resVec : out STD_LOGIC_VECTOR (N-1 downto 0);
           C,Negative,Ov,Z : out STD_LOGIC
           );
end component;

--ARCHIVO DE REGISTROS
component Registro16 is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           WR : in STD_LOGIC; --Se�al de control
           SHE : in STD_LOGIC; --Se�al de control
           DIR : in STD_LOGIC; --Se�al de control
           WReg : in STD_LOGIC_VECTOR (3 downto 0); --N�mero de registro
           WData : in STD_LOGIC_VECTOR (15 downto 0);
           RReg1 : in STD_LOGIC_VECTOR (3 downto 0);
           RReg2 : in STD_LOGIC_VECTOR (3 downto 0);
           Shamt : in STD_LOGIC_VECTOR (3 downto 0);
           RData1 : out STD_LOGIC_VECTOR (15 downto 0);
           RData2 : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- UNIDAD DE CONTROL
component unidadControlC is
    Port ( clk, clr : in STD_LOGIC;
           LF : in STD_LOGIC;
           funCode,banderas : in STD_LOGIC_VECTOR (3 downto 0);
           opCode : in STD_LOGIC_VECTOR (4 downto 0);
           microInstruccion : out STD_LOGIC_VECTOR (19 downto 0));
end component;

---MEMORIA DE DATOS
component memData is
    generic(
            m: integer := 9;  --Bus de direcciones
            n: integer :=16   --Bus de datos
            );
    Port ( wd : in STD_LOGIC;
           clk : in STD_LOGIC;
           dir : in STD_LOGIC_VECTOR (m-1 downto 0); ---Bus de direcciones
           dataIn : in STD_LOGIC_VECTOR (n-1 downto 0); --Bus de datos entrada
           dataOut : out STD_LOGIC_VECTOR (n-1 downto 0)); ---Bus de datos salida
end component;

--- MEMORIA DE PROGRAMA
component memProg is
    generic(
        m : integer := 9;---N�mero de palabras
        n: integer := 25 ----Tama�o de la palabra
    );
    Port ( PC : in STD_LOGIC_VECTOR (m-1 downto 0);
           Inst : out STD_LOGIC_VECTOR (n-1 downto 0));
end component;

---PILA
component pila is
    Port ( PCin : in STD_LOGIC_VECTOR (15 downto 0);
           clk,clr,WPC,UP,DW : in STD_LOGIC;
           PCout : out STD_LOGIC_VECTOR (15 downto 0);
           SPOut : out STD_LOGIC_VECTOR (2 downto 0));
end component;

--EXTENSOR DIRECCIO�N
component ExtensorDireccion is
 Port ( LIT_IN : in STD_LOGIC_VECTOR (11 downto 0);
           LIT_OUT : out STD_LOGIC_VECTOR (15 downto 0));
end component;

---EXTENSOR SIGNO
component ExtensorSigno is
 Port ( SLIT_IN : in STD_LOGIC_VECTOR (11 downto 0);
           SLIT_OUT : out STD_LOGIC_VECTOR (15 downto 0));
end component;

----MULTIPLEXOR DE 16 BITS
component Multiplexor_16bits is
    Port ( 
           DATA_IN1, DATA_IN2 : in STD_LOGIC_VECTOR (15 downto 0);
           SELEC : in STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (15 downto 0)
           );
end component;

----MULTIPLEXOR DE 4 BITS
component Multiplexor_4bits is
    Port ( DATA_IN1, DATA_IN2 : in STD_LOGIC_VECTOR (3 downto 0);
           SELEC : in STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end component;

end package;