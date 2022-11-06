library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FLIP_FLOP is
  port(CLOCK : in std_logic;
       J_INPUT : in std_logic;
       K_INPUT : in std_logic;
       ENABLE : in std_logic;
       Q : out std_logic;
       NOT_Q : out std_logic);
end JK_FLIP_FLOP;

architecture Behavioral of JK_FLIP_FLOP is
begin
  process(CLOCK)
  variable Q_TEMP: std_logic := '0';
  variable FORMER_J, FORMER_K: std_logic;
  begin
    if falling_edge(CLOCK) then
        if ENABLE = '0' then
            Q_TEMP := '0';
        elsif FORMER_J = '0' and FORMER_K = '0' then
            Q_TEMP := Q_TEMP;
        elsif FORMER_J = '1' and FORMER_K = '0' then
            Q_TEMP := '1';
        elsif FORMER_J = '0' and FORMER_K = '1' then
            Q_TEMP := '0';
        else
            Q_TEMP := not Q_TEMP; 
        end if;
    end if;
    Q <= Q_TEMP;
    NOT_Q <= not Q_TEMP;
    
    FORMER_J := J_INPUT;
    FORMER_K := K_INPUT;
  end process;
end Behavioral; 