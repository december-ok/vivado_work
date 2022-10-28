library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity mux_4v_4to1 is
    Port ( I1,I2,I3,I4 : in STD_LOGIC_VECTOR(3 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           O : out STD_LOGIC_VECTOR(3 downto 0));
end mux_4v_4to1;

architecture Behavioral of mux_4v_4to1 is
begin
    process is
    begin
        if (S = "00") then
            O <= I1;
        elsif (S = "01") then
            O <= I2;
        elsif (S = "10") then
            O <= I3;
        else
            O <= I4;
        end if;
    end process;
end Behavioral;
