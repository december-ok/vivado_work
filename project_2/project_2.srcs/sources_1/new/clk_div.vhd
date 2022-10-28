library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk_div is
    Port ( Clk : in STD_LOGIC; -- Boolean board clock
           f_0, f_1, f_2, f_3 : out STD_LOGIC);
end clk_div;

architecture Behavioral of clk_div is
    signal cnt : std_logic_vector(27 downto 0);
begin
    c_cnt0: process (Clk)
    begin
      if(rising_edge(Clk)) then
            if (cnt < x"FFFFFFF") then 
                cnt <= cnt +1;
             else 
                cnt <= x"0000000";
             end if;
        end if;
    end process c_cnt0;
           
    f_3 <= cnt(16); -- 100MHz / 2^17 = 762.94Hz -> 1.3 msec   = 0.0013 sec
    f_2 <= cnt(20); -- 100MHz / 2^21 = 47.68Hz  -> 20.1 msec  = 0.0201 sec
    f_1 <= cnt(23); -- 100MHz / 2^24 = 5.96Hz   -> 167.8 msec = 0.1678 sec
    f_0 <= cnt(25); -- 100MHz / 2^26 = 1.49Hz   -> 671.1 msec = 0.6711 sec

end Behavioral;
