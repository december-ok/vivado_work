LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


ENTITY project1_demo IS
   PORT (
      mclk    : IN STD_LOGIC;
      sw      : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      led     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
   );
END project1_demo;

ARCHITECTURE trans OF project1_demo IS   
   
   SIGNAL t1, t2, t3: STD_LOGIC;
   
BEGIN
    t1 <= sw(0) xor sw(1);
    t2 <= sw(0) and sw(1);
	t3 <= t1 and sw(2);
	led(0) <= t1 xor sw(2);
	led(1) <= t2 or t3;
END trans;