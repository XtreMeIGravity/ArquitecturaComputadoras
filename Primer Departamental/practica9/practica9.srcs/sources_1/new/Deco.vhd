library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Deco is
    port(
        QB: in std_logic_vector(3 downto 0);
        a: out  std_logic_vector (6 downto 0)--Display 7 segmentos
	);
end Deco;

architecture Behavioral of Deco is
    constant n0 : std_logic_vector(3 downto 0) := "0000";
    constant n1 : std_logic_vector(3 downto 0) := "0001";
    constant n2 : std_logic_vector(3 downto 0) := "0010";
    constant n3 : std_logic_vector(3 downto 0) := "0011";
    constant n4 : std_logic_vector(3 downto 0) := "0100";
    constant n5 : std_logic_vector(3 downto 0) := "0101";
    constant n6 : std_logic_vector(3 downto 0) := "0110";
    constant n7 : std_logic_vector(3 downto 0) := "0111";
    constant n8 : std_logic_vector(3 downto 0) := "1000";
    constant n9 : std_logic_vector(3 downto 0) := "1001";
begin
    process(QB)
	begin
		case QB is   ---abcdefg
		when n0=> a <= "0000001";    
 		when n1=> a <= "1111001";
		when n2=> a <= "0010010";
		when n3=> a <= "0000110";
		when n4=> a <= "1001100";
		when n5=> a <= "0100100";
		when n6=> a <= "0100000";
		when n7=> a <= "0001110";
		when n8=> a <= "0000000";
		when others => a <="0000100";
		end case;
	end process;
end Behavioral;
