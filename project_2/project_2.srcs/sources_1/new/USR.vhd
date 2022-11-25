library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity USR is
    Port ( clk : in STD_LOGIC; -- clock
           clear : in STD_LOGIC; -- clear
           s : in STD_LOGIC_VECTOR (1 downto 0); -- mode select
           d_in : in STD_LOGIC; -- new serial data input
           p_in : in STD_LOGIC_VECTOR (3 downto 0); -- parallel input
           Q : out STD_LOGIC_VECTOR (3 downto 0)); -- register output
end USR;

architecture Behavioral of USR is
    signal Q_temp : std_logic_vector (3 downto 0) := "0001";
begin
    process(clk)
    begin
        if (rising_edge (clk)) then
            if (clear = '1') then
                Q_temp <= "0000";
            else
                if(s = "00") then
                    Q_temp <= Q_temp;
                elsif(s = "01") then
                    Q_temp(0) <= Q_temp(1);
                    Q_temp(1) <= Q_temp(2);
                    Q_temp(2) <= Q_temp(3);
                    Q_temp(3) <= d_in;                    
                elsif(s = "10") then
                    Q_temp(3) <= Q_temp(2);
                    Q_temp(2) <= Q_temp(1);
                    Q_temp(1) <= Q_temp(0);
                    Q_temp(0) <= d_in;
                else
                    Q_temp <= p_in;
                end if;
            end if;
        end if;
    end process;
    
    Q <= Q_temp;
    
end Behavioral;