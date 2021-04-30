library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memProg is
    generic(
        m : integer := 9;---N�mero de palabras
        n: integer := 25 ----Tama�o de la palabra
    );
    Port ( PC : in STD_LOGIC_VECTOR (m-1 downto 0);
           Inst : out STD_LOGIC_VECTOR (n-1 downto 0));
end memProg;

architecture Behavioral of memProg is
--------------Definici�n de las constantes de instrucci�n-------
constant OPR: std_logic_vector(4 downto 0) := "00000"; ---C�d operaci�n tipo R
constant  LI: std_logic_vector(4 downto 0) := "00001";
constant LWI: std_logic_vector(4 downto 0) := "00010";
constant  LW: std_logic_vector(4 downto 0) := "10111";
constant SWI: std_logic_vector(4 downto 0) := "00011";
constant  SW: std_logic_vector(4 downto 0) := "00100";

constant ADDI: std_logic_vector(4 downto 0) := "00101";
constant SUBI: std_logic_vector(4 downto 0) := "00110";

constant ANDI: std_logic_vector(4 downto 0) := "00111";
constant  ORI: std_logic_vector(4 downto 0) := "01000";
constant XORI: std_logic_vector(4 downto 0) := "01001";
constant NANDI: std_logic_vector(4 downto 0) := "01010";
constant NORI: std_logic_vector(4 downto 0) := "01011";
constant XNORI: std_logic_vector(4 downto 0) := "01100";

constant BEQI: std_logic_vector(4 downto 0) := "01101";
constant BNEI: std_logic_vector(4 downto 0) := "01110";
constant BLTI: std_logic_vector(4 downto 0) := "01111";
constant BLETI: std_logic_vector(4 downto 0) := "10000";
constant BGTI: std_logic_vector(4 downto 0) := "10001";
constant BGETI: std_logic_vector(4 downto 0) := "10010";
constant B: std_logic_vector(4 downto 0) := "10011";

constant CALL: std_logic_vector(4 downto 0) := "10100";
constant RET: std_logic_vector(4 downto 0) := "10101";
constant NOP: std_logic_vector(4 downto 0) := "10110";

---------Constantes de REgistros----------
constant R0: std_logic_vector(3 downto 0) := "0000";
constant R1: std_logic_vector(3 downto 0) := "0001";
constant R2: std_logic_vector(3 downto 0) := "0010";
constant R3: std_logic_vector(3 downto 0) := "0011";
constant R4: std_logic_vector(3 downto 0) := "0100";
constant R5: std_logic_vector(3 downto 0) := "0101";
constant R6: std_logic_vector(3 downto 0) := "0110";
constant R7: std_logic_vector(3 downto 0) := "0111";
constant R8: std_logic_vector(3 downto 0) := "1000";
constant R9: std_logic_vector(3 downto 0) := "1001";
constant R10: std_logic_vector(3 downto 0) := "1010";
constant R11: std_logic_vector(3 downto 0) := "1011";
constant R12: std_logic_vector(3 downto 0) := "1100";
constant R13: std_logic_vector(3 downto 0) := "1101";
constant R14: std_logic_vector(3 downto 0) := "1110";
constant R15: std_logic_vector(3 downto 0) := "1111";

--------------Constante sin usar------
constant SU: std_logic_vector(3 downto 0) := "0000";
-----------------------------------------------------

type mProg is array (0 to (2**m)-1) of std_logic_vector(n-1 downto 0);
constant programa: mProg := (
-- ---PROGRAMA 1---
--    LI & R0 & x"0001",
--    LI & R1 & x"0007",
--    OPR & R1 & R1 & R0 & SU & "0000",
--    SWI & R1 & x"0005",
--    B & SU & x"0002",
--    OTHERS => (OTHERS =>'0')

----PROGRAMA 2, MENOR DE 4 REGISTROS----
--    LI & R0 & x"0056",              --0
--    LI & R1 & x"0007",              --1
--    LI & R2 & x"0011",              --2
--    LI & R3 & x"0020",              --3
--    ADDI & R14 & R0 & x"000",       --4
--    ADDI & R15 & R1 & x"000",       --5
--    CALL & SU & x"0010",            --6
--    ADDI & R15 & R2 & x"000",       --7
--    CALL & SU & x"0010",            --8
--    ADDI & R15 & R3 & x"000",       --9
--    CALL & SU & x"0010",            --10
--    LWI & R0 & x"0000",             --11
--    NOP & SU & SU & SU & SU & SU,   --12
--    B & SU & x"000C",               --13
    
--    B & SU & x"000C",               --14
--    B & SU & x"000C",               --15


--    BLETI & R14 & R15 & x"003",     --16
--    SWI & R14 & x"0000",            --17
--    RET & SU & SU & SU & SU & SU,   --18
--    SWI & R15 & x"0000",            --19
--    LWI & R14 & x"0000",            --20
--    RET & SU & SU & SU & SU & SU,   --21
    
--    OTHERS => (OTHERS =>'0')

----(4,4,4,4).(4,4,4,4) Caso 2----
--    LI & R0 & x"0004",              --0
--    SWI & R0 & x"0200",            --1
--    SWI & R0 & x"0400",            --2
--    SWI & R0 & x"0201",            --3
--    SWI & R0 & x"0401",            --4
--    SWI & R0 & x"0202",            --5
--    SWI & R0 & x"0402",            --6
--    SWI & R0 & x"0203",            --7
--    SWI & R0 & x"0403",            --8

--    LI & R0 & x"0000",              --9
--    LI & R1 & x"0000",              --10
--    LI & R2 & x"0004",              --11 ---longitud de los vectores
--    BEQI & R2 & R1 & x"007",        --12
--    LW & R14 & R1 & x"200",         --13
--    LW & R15 & R1 & x"400",         --14
--    ADDI & R1 & R1 & x"001",        --15
--    CALL & SU & x"0017",            --16
--    OPR & R0 & R0 & R12 & SU & SU,  --17
--    B & SU & x"000C",               --18
--    NOP & SU & SU & SU & SU & SU,   --19
--    B & SU & x"0013",               --20
--    B & SU & x"0013",               --21
--    B & SU & x"0013",               --22

--    LI & R13 & x"0001",             --23
--    ADDI & R12 & R15 & x"000",        --24
--    BLTI & R14 & R13 & x"002",      --25
--    RET & SU & SU & SU & SU & SU,   --26
--    OPR & R12 & R12 & R15 & SU & SU,  --27
--    ADDI & R13 & R13 & x"001",        --28
--    B & SU & x"0019",               --29
    
--    OTHERS => (OTHERS =>'0')
--);

----(8,16).(8,16) Caso 2----
    LI & R0 & x"0008",              --0
    SWI & R0 & x"0200",            --1
    SWI & R0 & x"0400",            --2
    LI & R0 & x"0016",              --3
    LI & R0 & x"0016",              --4
    SWI & R0 & x"0201",            --5
    SWI & R0 & x"0401",            --6
    SWI & R0 & x"0202",            --7
    SWI & R0 & x"0402",            --68

    LI & R0 & x"0000",              --9
    LI & R1 & x"0000",              --10
    LI & R2 & x"0002",              --11 ---longitud
    BEQI & R2 & R1 & x"007",        --12
    LW & R14 & R1 & x"200",         --13
    LW & R15 & R1 & x"400",         --14
    ADDI & R1 & R1 & x"001",        --15
    CALL & SU & x"0017",            --16
    OPR & R0 & R0 & R12 & SU & SU,  --17
    B & SU & x"000C",               --18
    NOP & SU & SU & SU & SU & SU,   --19
    B & SU & x"0013",               --20
    B & SU & x"0013",               --21
    B & SU & x"0013",               --22

    LI & R13 & x"0001",             --23 ---mul
    ADDI & R12 & R15 & x"000",        --24
    BLTI & R14 & R13 & x"002",      --25
    RET & SU & SU & SU & SU & SU,   --26
    OPR & R12 & R12 & R15 & SU & SU,  --27
    ADDI & R13 & R13 & x"001",        --28
    B & SU & x"0019",               --29
    
    OTHERS => (OTHERS =>'0')
);


begin
    Inst <= programa(conv_integer(PC));
end Behavioral;
