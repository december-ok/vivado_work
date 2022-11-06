library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FLIP_FLOP is
  port(CLOCK : in std_logic;
       DATA_INPUT : in std_logic;
       DATA_OUTPUT : out std_logic;
       NOT_DATA_OUTPUT : out std_logic);
end D_FLIP_FLOP;

architecture Behavioral of D_FLIP_FLOP is
begin
  process(CLOCK)
  begin
    if rising_edge(CLOCK) then
      DATA_OUTPUT <= DATA_INPUT;
      NOT_DATA_OUTPUT <= not DATA_INPUT;
    end if;
  end process;
end Behavioral; 