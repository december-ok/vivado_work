library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCD_counter_2bit is 
   port( Clock: in std_logic;
 	    Reset: in std_logic;
 	    OutputL, OutputH: out std_logic_vector(3 downto 0));
end BCD_counter_2bit;
 
architecture Behavioral of BCD_counter_2bit is
   signal tempL, tempH: std_logic_vector(3 downto 0);
begin
   process(Clock, Reset)
   variable carry: std_logic := '0';
   begin
      if (Reset = '1') then
         tempL <= "0000";
         tempH <= "0000";
      elsif (rising_edge(Clock)) then
         if (tempL = "1001") then
            tempL <= "0000";
            carry := '1';
         else
            tempL <= tempL + 1;
         end if;
         
         if (carry = '1') then
            if(tempH = "1001") then
                tempH <= "0000";
            else
                tempH <= tempH + 1;
            end if;
            carry := '0';
         end if;
      end if;
   end process;
   OutputL <= tempL;
   OutputH <= tempH;   
end Behavioral;
