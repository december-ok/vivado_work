LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY moore_tb IS
END moore_tb;
 
ARCHITECTURE behavior OF moore_tb IS
  COMPONENT moore
    PORT(
      clk : IN std_logic;
      din : IN std_logic;
      rst : IN std_logic;
      dout : OUT std_logic
    );
  END COMPONENT;
 
  signal clk : std_logic := '0';
  signal din : std_logic := '0';
  signal rst : std_logic := '0';
  signal dout : std_logic;
 
  constant clk_period : time := 20 ns;
 
BEGIN
  UUT: moore PORT MAP (
              clk => clk,
              din => din,
              rst => rst,
              dout => dout
             );
  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;
  
  stim_proc: process
  begin
    rst <= '1';
    wait for 100 ns;
    rst <= '0';
    din <= '0';
    wait for 20 ns;
    din <= '1';
    wait for 20 ns;
    din <= '0';
    wait for 20 ns;
    din <= '1';
    wait for 20 ns;
    din <= '0';
    wait for 20 ns;
    din <= '1';
    wait for 20 ns;
    din <= '0';
    wait for 20 ns;
    din <= '1';
  end process;
END;
