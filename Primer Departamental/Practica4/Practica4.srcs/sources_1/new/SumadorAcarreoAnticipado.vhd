library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumadorAcarreoAnticipado is
    Generic( N : INTEGER := 4);
    Port ( A,B: in STD_LOGIC_VECTOR (N-1 downto 0);
           Cin  : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (N-1 downto 0);
           COut : out STD_LOGIC);
end SumadorAcarreoAnticipado;

architecture Behavioral of SumadorAcarreoAnticipado is
    
begin
    process( A, B, Cin)
        variable Pj : STD_LOGIC;
        variable Gk : STD_LOGIC;
        variable Pl : STD_LOGIC;
        variable Ci : STD_LOGIC_VECTOR ( N downto 0);
        variable Pi : STD_LOGIC_VECTOR ( N-1 downto 0);
        variable Gi : STD_LOGIC_VECTOR ( N-1 downto 0); 
    Begin
        Ci(0) := Cin;
        FOR i IN 0 TO N-1 LOOP
            ----------------------------------------------
            Pi(i) := A(i) XOR B(i);
            Gi(i) := A(i) AND B(i);
            S(i)  <= Pi(i) XOR Ci(i);
            ----------------------------
            FOR j IN 0 TO i LOOP
                ----PRODUCTO---- pj
                if j = 0 then
                    Pj := Pi(j);
                else
                    Pj := Pj AND Pi(j);
                end if;
                ---- END PRODUCTO---- pj
            END LOOP;
            ---------------------------------------------
            Ci(i+1) := (Ci(i) AND Pj);---------------------
            ----------------------------------------------
            if i > 0 then
                FOR k IN 0 TO i-1 LOOP
                    ----------------------
                    FOR l IN k+1 TO i LOOP
                        if l = k+1 then
                            Pl := Pi(l);
                        else
                            Pl := Pl AND Pi(l);
                        end if;                    
                    END LOOP;
                    -----------------------
                    if k = 0 then
                        Gk := Gi(k) AND Pl;
                    else
                        Gk := Gk OR (Gi(k) AND Pl);
                    end if;   
                END LOOP;
                ---------------------------------------------
                Ci(i+1) := Ci(i+1) OR Gk;----------------------
                --------------------------------------------- 
            end if;
            ----------------------------------------------
            Ci(i+1) := Ci(i+1) OR Gi(i);--------------------
            ----------------------------------------------
        END LOOP; 
        COut <= Ci(N);   
    end process;
end Behavioral;
