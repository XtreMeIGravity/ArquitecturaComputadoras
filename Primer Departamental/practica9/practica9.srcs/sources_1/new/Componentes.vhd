library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package componentes is
    ---------------------Contador------------------------
    Component Contador
    generic (N: integer  := 4);
    Port ( 
        clr,clk: in std_logic;
        LB,EB: in std_logic;
        QB: out std_logic_vector(N-1 downto 0)
    );
    end component;
    -----------------------------------------------------
    ----------------------Deco---------------------------
    Component Deco
        port(
            QB: in std_logic_vector(3 downto 0);
            a: out  std_logic_vector (6 downto 0)--Display 7 segmentos
        );
    end Component;
    -----------------------------------------------------
    ----------------------Mux----------------------------
    Component Mux
    Port (
        a_in: in  std_logic_vector (6 downto 0);--Display 7 segmentos
        ec : in std_logic;
        a_out: out  std_logic_vector (6 downto 0)--Display 7 segmentos
    );
    end Component;
    -----------------------------------------------------
    --------------------Registro-------------------------
    component Registro
    generic(
        N:integer :=9
    );
    port(
        DA: in std_logic_vector(N-1 downto 0);
        LA,EA: in std_logic;
        clk,clr: in std_logic;
        QA: out std_logic_vector(N-1 downto 0)
    );
    end component;
    -----------------------------------------------------
	-------------------Unidad de control-----------------
	Component UnidadDeControl
		Port ( clk,clr,a0,z,ini : in STD_LOGIC;
			   LA,EA,LB,EB,EC : out STD_LOGIC);
	end Component;
	-----------------------------------------------------
end componentes;