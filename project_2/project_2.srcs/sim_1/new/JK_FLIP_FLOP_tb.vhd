LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY JK_FLIP_FLOP_tb IS
END JK_FLIP_FLOP_tb;

ARCHITECTURE behavior OF JK_FLIP_FLOP_tb IS
  COMPONENT JK_FLIP_FLOP
  PORT(
       CLOCK : IN std_logic;
       J_INPUT : IN std_logic;
       K_INPUT : IN std_logic;
       ENABLE : IN std_logic;
       Q : OUT std_logic;
       NOT_Q : OUT std_logic
      );
  END COMPONENT;

  signal CLOCK : std_logic := '0';
  signal J_INPUT : std_logic := '0';
  signal K_INPUT : std_logic := '0';
  signal ENABLE : std_logic := '0';
  signal Q : std_logic;
  signal NOT_Q : std_logic;
BEGIN
  uut: JK_FLIP_FLOP PORT MAP (
       CLOCK => CLOCK,
       J_INPUT => J_INPUT,
       K_INPUT => K_INPUT,
       ENABLE => ENABLE,
       Q => Q,
       NOT_Q => NOT_Q);
  CLOCK0: process
  begin
    CLOCK <= '0';
    wait for 10 ns;
    CLOCK <= '1';
    wait for 10 ns;
  end process;

  J_INPUT0: process
  begin
    J_INPUT <= '0';
    wait for 20 ns;
    J_INPUT <= '1';
    wait for 20 ns;
  end process;

  K_INPUT0: process
  begin
    K_INPUT <= '0';
    wait for 40 ns;
    K_INPUT <= '1';
    wait for 40 ns;
  end process;

  ENABLE0: process
  begin
    ENABLE <= '0';
    wait for 80 ns;
    ENABLE <= '1';
    wait for 80 ns;
  end process;
END;