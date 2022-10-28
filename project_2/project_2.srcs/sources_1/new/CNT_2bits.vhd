library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity CNT_2bits is
    Port ( clk : in STD_LOGIC;
           cnt_out : out STD_LOGIC_VECTOR (1 downto 0));
end CNT_2bits;

architecture Behavioral of CNT_2bits is
begin

    CNT: process(clk)
        variable cnt_o : std_logic_vector (1 downto 0);
    begin
        if (rising_edge(clk)) then
            if (cnt_o < 3) then
                cnt_o := cnt_o +1;
            else
                cnt_o := "00";
            end if;
        end if;
        cnt_out <= cnt_o;     
    end process CNT;


end Behavioral;
