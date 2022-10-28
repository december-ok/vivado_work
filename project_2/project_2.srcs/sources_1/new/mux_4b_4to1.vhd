library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity mux_4b_4to1 is
    Port ( I1,I2,I3,I4 : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (1 downto 0);
           O : out STD_LOGIC);
end mux_4b_4to1;

architecture Behavioral of mux_4b_4to1 is
    signal t0 ,t1, t2, t3: STD_LOGIC;
begin
    t0 <= NOT S(0) AND NOT S(1) AND I1;
    t1 <= NOT S(0) AND S(1) AND I2;
    t2 <= S(0) AND NOT S(1) AND I3;
    t3 <= S(0) AND S(1) AND I4;
    
    O <= t0 OR t1 OR t2 OR t3;
end Behavioral;
