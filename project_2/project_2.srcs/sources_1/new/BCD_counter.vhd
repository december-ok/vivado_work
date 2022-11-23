library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCD_counter is 
   port( Clock: in std_logic;
 	    Reset: in std_logic;
 	    Output: out std_logic_vector(3 downto 0));
end BCD_counter;
 
architecture Behavioral of BCD_counter is
   signal temp: std_logic_vector(3 downto 0);
begin   
   process(Clock, Reset)
   begin
      if (Reset = '1') then
         temp <= "0000";
      elsif (rising_edge(Clock)) then
         if (temp = "1001") then
            temp <= "0000";
         else
            temp <= temp + 1;
         end if;
      end if;
   end process;
   Output <= temp;
end Behavioral;