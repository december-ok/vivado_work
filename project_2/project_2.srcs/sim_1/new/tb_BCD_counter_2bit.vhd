library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_BCD_counter_2bit is
end tb_BCD_counter_2bit;

architecture Behavioral of tb_BCD_counter_2bit is
    component BCD_counter_2bit
        port( Clock: in std_logic;
 	         Reset: in std_logic;
 	         OutputL, OutputH: out std_logic_vector (3 downto 0));
    end component ;
    signal Clock: std_logic := '0';
    signal Reset: std_logic ;
    signal OutputL, OutputH: std_logic_vector (3 downto 0); 
begin
    Clock <= not Clock after 20 ns;
    UUT: BCD_counter_2bit port map (Clock => Clock, Reset => Reset, OutputL => OutputL, OutputH => OutputH);
    
    tb: process
    begin
        Reset <= '0';
        wait for 60 ns;
        
        Reset <= '1';
        wait for 40 ns;
        
        Reset <= '0';
        wait;
    end process;
end Behavioral;
