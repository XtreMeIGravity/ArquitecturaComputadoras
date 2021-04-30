library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.componentesProce.ALL;

entity ESCOMIPS is
    Port ( Reset : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Instruccion : out STD_LOGIC_VECTOR (24 downto 0);
           PC_OUT, RD1, RD2, ResALU, BusSR : out STD_LOGIC_VECTOR (15 downto 0));
end ESCOMIPS;

architecture Behavioral of ESCOMIPS is

signal microinstruccion: std_logic_vector(19 downto 0);
signal auxInstruccion : std_logic_vector(24 downto 0);
signal auxPCin, auxPCout, auxReadData1, auxReadData2, auxSLIT_SIGNO,auxLIT_DIRECCION, auxSDMD, auxMEM_DATAOUT, auxWRITEDATA, auxS, auxSOP1, auxSOP2, auxSEXT : std_logic_vector (15 downto 0) := "0000000000000000";
signal auxSR : std_logic_vector(15 downto 0) := "0000000000000000";
signal auxSigno: std_logic_vector(11 downto 0);
signal auxReg2, auxFlags: std_logic_vector(3 downto 0);
signal clr: std_logic;

begin

process(clk)
begin
    if(falling_edge(clk)) then
        clr <= reset;
     end if;
end process;

STACK: pila Port map(
    clk => clk, 
    clr => clr,
    UP => microinstruccion(18),
    DW => microinstruccion(17),
    WPC => microinstruccion(16),
    PCin => auxPCin,
    PCout => auxPCout
);

Mem_Prog: memProg port map(
    PC => auxPCout(8 downto 0),
    Inst => auxInstruccion
);

Arch_Reg: Registro16 port map(
    clk => clk,
    clr  => clr,
    WR  => microinstruccion(10),
    SHE  => microinstruccion(12),
    DIR  => microinstruccion(11),
    WReg  => auxInstruccion(19 downto 16),
    WData  => auxWRITEDATA,
    RReg1  => auxInstruccion(15 downto 12),
    RReg2  => auxREG2,
    Shamt  => auxInstruccion(7 downto 4),
    RData1  => auxReadData1,
    RData2  => auxReadData2
);

ES: ExtensorSigno port map(
     SLIT_IN => auxInstruccion(11 downto 0),
     SLIT_OUT => auxSLIT_SIGNO
);

ED: ExtensorDireccion Port MAP ( 
    LIT_IN => auxInstruccion(11 DOWNTO 0),
    LIT_OUT => auxLIT_DIRECCION
);   

ALU: aluComponentes port map(
    aVec => auxSOP1,
    bVec => auxSOP2,
    selA => microinstruccion(7),
    selB => microinstruccion(6),
    Op => microinstruccion(5 downto 4),
    resVec => auxS,
    C => auxFLAGS(0),
    Negative => auxFLAGS(2),
    Ov => auxFLAGS(3),
    Z => auxFLAGS(1)
); 
 
 UC: unidadControlC port map(
    clk => clk,
    clr => clr,
    LF => microinstruccion(0),
    funCode => auxInstruccion(3 downto 0),
    banderas => auxFlags,
    opCode => auxInstruccion(24 downto 20),
    microinstruccion => microinstruccion
 );
 
 Mem_Data: memData port map(
    clk => clk,
    wd => microinstruccion(2),
    dir => auxSDMD(8 downto 0),
    dataIn => auxReadData2,
    dataOut => auxMEM_DATAOUT
 );
 
 SDMP: Multiplexor_16bits Port MAP ( 
           DATA_IN1 => auxINSTRUCCION(15 DOWNTO 0),
           DATA_IN2 => auxSR,
           SELEC => MICROINSTRUCCION(19),
           DATA_OUT => auxPCIN
           );
           
SR2: Multiplexor_4bits Port MAP ( 
           DATA_IN1 => auxINSTRUCCION(11 DOWNTO 8),
           DATA_IN2 => auxINSTRUCCION(19 DOWNTO 16),
           SELEC => MICROINSTRUCCION(15),
           DATA_OUT => auxREG2
           );

SWD: Multiplexor_16bits Port MAP ( 
           DATA_IN1 => auxINSTRUCCION(15 DOWNTO 0),
           DATA_IN2 => auxSR,
           SELEC => MICROINSTRUCCION(14),
           DATA_OUT => auxWRITEDATA
           );
           
SEXT: Multiplexor_16bits Port MAP ( 
           DATA_IN1 => auxSLIT_SIGNO,
           DATA_IN2 => auxLIT_DIRECCION,
           SELEC => MICROINSTRUCCION(13),
           DATA_OUT => auxSEXT
           );

SOP1: Multiplexor_16bits Port MAP ( 
           DATA_IN1 => auxReadData1,
           DATA_IN2 => auxPCOUT,
           SELEC => MICROINSTRUCCION(9),
           DATA_OUT => auxSOP1
           );
           
SOP2: Multiplexor_16bits Port MAP ( 
           DATA_IN1 => auxReadData2,
           DATA_IN2 => auxSEXT,
           SELEC => MICROINSTRUCCION(8),
           DATA_OUT => auxSOP2
           );                     
 
SDMD: Multiplexor_16bits Port MAP ( 
           DATA_IN1 => auxS,
           DATA_IN2 => auxINSTRUCCION(15 DOWNTO 0),
           SELEC => MICROINSTRUCCION(3),
           DATA_OUT => auxSDMD
           );
           
SR: Multiplexor_16bits Port MAP ( 
           DATA_IN1 => auxMEM_DATAOUT,
           DATA_IN2 => auxS,
           SELEC => MICROINSTRUCCION(1),
           DATA_OUT => auxSR
           );
           
PC_OUT <= auxPCOUT;
RD1 <= auxReadData1;
RD2 <= auxReadData2;
ResALU <= auxS;
Instruccion <= auxINSTRUCCION;
BusSR <= auxSR;    
 
end Behavioral;
