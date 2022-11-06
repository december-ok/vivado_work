library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FLIP_FLOP is
  port(CLOCK : in std_logic;
       T_INPUT : in std_logic;
       ENABLE : in std_logic;
       Q : out std_logic;
       NOT_Q : out std_logic);
end T_FLIP_FLOP;

architecture Behavioral of T_FLIP_FLOP is
begin
  process(CLOCK)
  variable Q_TEMP: std_logic := '0';
  variable FORMER_T: std_logic;
  begin
    if ENABLE = '0' then
        Q_TEMP := '0';
    else
        if rising_edge(CLOCK) then
            if ENABLE = '0' then
                Q_TEMP := '0';
            elsif FORMER_T = '0' then
                Q_TEMP := Q_TEMP;
            elsif FORMER_T = '1' then
                Q_TEMP := not Q_TEMP;
            end if;
        end if;
    end if;
    
    FORMER_T := T_INPUT;
    Q <= Q_TEMP;
    NOT_Q <= not Q_TEMP;
  end process;
end Behavioral;