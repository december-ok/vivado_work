LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY T_FLIP_FLOP_tb IS
END T_FLIP_FLOP_tb;

ARCHITECTURE behavior OF T_FLIP_FLOP_tb IS
  COMPONENT T_FLIP_FLOP
  PORT(
       CLOCK : IN std_logic;
       T_INPUT : IN std_logic;
       ENABLE : IN std_logic;
       Q : OUT std_logic;
       NOT_Q : OUT std_logic
      );
  END COMPONENT;

  signal CLOCK : std_logic := '0';
  signal T_INPUT : std_logic := '0';
  signal ENABLE : std_logic := '0';
  signal Q : std_logic;
  signal NOT_Q : std_logic;
BEGIN
  uut: T_FLIP_FLOP PORT MAP (
       CLOCK => CLOCK,
       T_INPUT => T_INPUT,
       ENABLE => ENABLE,
       Q => Q,
       NOT_Q => NOT_Q
     );
CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  T_INPUT0: process
  begin
    T_INPUT <= '0';
    wait for 20 ns;
    T_INPUT <= '1';
    wait for 20 ns;
  end process;

  ENABLE0: process
  begin
    ENABLE <= '0';
    wait for 40 ns;
    ENABLE <= '1';
    wait for 40 ns;
  end process;
END;
