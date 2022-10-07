LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


ENTITY fulladd IS
   PORT (
     a, b, cin : in std_logic;
     s, cout : out std_logic
   );
END fulladd;

ARCHITECTURE trans OF fulladd IS   
   
   SIGNAL t1, t2, t3: STD_LOGIC;
   
BEGIN
    t1 <= a xor b;
    t2 <= a and b;
	t3 <= t1 and cin;
	s <= t1 xor cin;
	cout <= t2 or t3;
END trans;