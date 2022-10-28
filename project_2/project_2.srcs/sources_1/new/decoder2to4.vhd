library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity decoder2to4 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end decoder2to4;

architecture Behavioral of decoder2to4 is
begin
    
    Y(0) <= NOT A(0) AND NOT A(1);
    Y(1) <= A(0) AND NOT A(1);
    Y(2) <= NOT A(0) AND A(1);
    Y(3) <= A(0) AND A(1);
end Behavioral;
