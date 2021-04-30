----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2020 19:03:02
-- Design Name: 
-- Module Name: Alu1Bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alu1Bit is
          Port(
          a,b,sela,selb,cin:in std_logic;
          co,res: out std_logic;
          op: in std_logic_vector(1 downto 0)
          );

end Alu1Bit;

architecture Behavioral of Alu1Bit is

begin


end Behavioral;
