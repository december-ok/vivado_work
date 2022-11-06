LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY D_FLIP_FLOP_tb IS
END D_FLIP_FLOP_tb;

ARCHITECTURE behavior OF D_FLIP_FLOP_tb IS
  COMPONENT D_FLIP_FLOP
  PORT(
       CLOCK : IN std_logic;
       DATA_INPUT : IN std_logic;
       DATA_OUTPUT : OUT std_logic;
       NOT_DATA_OUTPUT : OUT std_logic
      );
  END COMPONENT;

  signal CLOCK : std_logic := '0';
  signal DATA_INPUT : std_logic := '0';
  signal DATA_OUTPUT : std_logic;
  signal NOT_DATA_OUTPUT : std_logic;
BEGIN
  uut: D_FLIP_FLOP PORT MAP (
       CLOCK => CLOCK,
       DATA_INPUT => DATA_INPUT,
       DATA_OUTPUT => DATA_OUTPUT,
       NOT_DATA_OUTPUT => NOT_DATA_OUTPUT
     );
  CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  DATA_INPUT0: process
  begin
    DATA_INPUT <= '0';
    wait for 20 ns;
    DATA_INPUT <= '1';
    wait for 20 ns;
  end process;
END;
