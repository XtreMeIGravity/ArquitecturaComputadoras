library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity MemProgram is
    generic(
        bDir : integer := 10;
        bDatos :integer := 25
    );
    Port ( 
        PC: in std_logic_vector(bDir-1 downto 0);
        Ints : out STD_LOGIC_VECTOR (bDatos-1 downto 0));
end MemProgram;

architecture Behavioral of MemProgram is
type arreglo is array (0 to (2**bDir)-1) of std_logic_vector(bDatos-1 downto 0);
signal memoriaPrograma : arreglo;
--REGISTROS
CONSTANT R0: std_logic_vector(3 downto 0)  := "0000";
CONSTANT R1: std_logic_vector(3 downto 0)  := "0001";
CONSTANT R2: std_logic_vector(3 downto 0)  := "0010";
CONSTANT R3: std_logic_vector(3 downto 0)  := "0011";
CONSTANT R4: std_logic_vector(3 downto 0)  := "0100";
CONSTANT R5: std_logic_vector(3 downto 0)  := "0101";
CONSTANT R6: std_logic_vector(3 downto 0)  := "0110";
CONSTANT R7: std_logic_vector(3 downto 0)  := "0111";
CONSTANT R8: std_logic_vector(3 downto 0)  := "1000";
CONSTANT R9: std_logic_vector(3 downto 0)  := "1001";
CONSTANT R10: std_logic_vector(3 downto 0) := "1010";
CONSTANT R11: std_logic_vector(3 downto 0) := "1011";
CONSTANT R12: std_logic_vector(3 downto 0) := "1100";
CONSTANT R13: std_logic_vector(3 downto 0) := "1101";
CONSTANT R14: std_logic_vector(3 downto 0) := "1110";
CONSTANT R15: std_logic_vector(3 downto 0) := "1111";
--SIN USAR
CONSTANT S_U: std_logic_vector(3 downto 0)  := "0000";
--INSTRUCIONES
CONSTANT OP_TD:     std_logic_vector(4 downto 0) := "00000";
CONSTANT OP_LI:     std_logic_vector(4 downto 0) := "00001";
CONSTANT OP_LWI:    std_logic_vector(4 downto 0) := "00010";
CONSTANT OP_SWI:    std_logic_vector(4 downto 0) := "00011";
CONSTANT OP_SW:     std_logic_vector(4 downto 0) := "00100";
CONSTANT OP_ADDI:   std_logic_vector(4 downto 0) := "00101";
CONSTANT OP_SUBI:   std_logic_vector(4 downto 0) := "00110";
CONSTANT OP_ANDI:   std_logic_vector(4 downto 0) := "00111";
CONSTANT OP_ORI:    std_logic_vector(4 downto 0) := "01000";
CONSTANT OP_XORI:   std_logic_vector(4 downto 0) := "01001";
CONSTANT OP_NANDI:  std_logic_vector(4 downto 0) := "01010";
CONSTANT OP_NORI:   std_logic_vector(4 downto 0) := "01011";
CONSTANT OP_XNORI:  std_logic_vector(4 downto 0) := "01100";
CONSTANT OP_BEQI:   std_logic_vector(4 downto 0) := "01101";
CONSTANT OP_BNEI:   std_logic_vector(4 downto 0) := "01110";
CONSTANT OP_BLIT:   std_logic_vector(4 downto 0) := "01111";
CONSTANT OP_BLETI:  std_logic_vector(4 downto 0) := "10000";
CONSTANT OP_BGTI:   std_logic_vector(4 downto 0) := "10001";
CONSTANT OP_BGETI:  std_logic_vector(4 downto 0) := "10010";
CONSTANT OP_B:      std_logic_vector(4 downto 0) := "10011";
CONSTANT OP_CALL:   std_logic_vector(4 downto 0) := "10100";
CONSTANT OP_RET:    std_logic_vector(4 downto 0) := "10101";
CONSTANT OP_NOP:    std_logic_vector(4 downto 0) := "10110";
--
CONSTANT OP2_ADD:   std_logic_vector(3 downto 0) := "0000";
CONSTANT OP2_SUB:   std_logic_vector(3 downto 0) := "0001";
CONSTANT OP2_AND:   std_logic_vector(3 downto 0) := "0010";
CONSTANT OP2_OR :   std_logic_vector(3 downto 0) := "0011";
CONSTANT OP2_XOR:   std_logic_vector(3 downto 0) := "0100";
CONSTANT OP2_NAND:  std_logic_vector(3 downto 0) := "0101";
CONSTANT OP2_NOR:   std_logic_vector(3 downto 0) := "0110";
CONSTANT OP2_XNOR:  std_logic_vector(3 downto 0) := "0111";
CONSTANT OP2_NOT:   std_logic_vector(3 downto 0) := "1000";
CONSTANT OP2_SLL:   std_logic_vector(3 downto 0) := "1001";
CONSTANT OP2_SRL:   std_logic_vector(3 downto 0) := "1010";
 
constant MP : arreglo := (
    OP_LI  & R0 & x"0000",
    OP_LI  & R1 & x"0001",
    OP_LI  & R2 & x"0000",
    OP_LI  & R3 & X"000C",
    OP_TD  & R4 & R0 & R1 & S_U & OP2_ADD,
    OP_SWI & R4 &  X"0072",
    OP_ADDI& R0 & R1 & X"000",
    OP_ADDI& R1 & R4 & X"000",
    OP_ADDI& R2 & R2 & X"001",
    OP_BNEI& R3 & R2 & X"FFB",-- PC = PC -5 
    OP_NOP & S_U & S_U & S_U & S_U & S_U ,     
    OP_B   & S_U & X"000A",
    others => (others => '0'));
begin
    memoriaPrograma <= MP;
    Ints <= memoriaPrograma(conv_integer(PC));
end Behavioral;

