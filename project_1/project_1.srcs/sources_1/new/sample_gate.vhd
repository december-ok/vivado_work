library ieee;
use ieee.std_logic_1164.all;

entity  fulladd is 
    port( a, b, cin : in   std_logic;
          s, cout   : out std_logic);
end fulladd;

architecture df of fulladd is
signal t1, t2, t3 : std_logic;
begin
	t1 <= a xor b;
	t2 <= a and b;
	t3 <= t1 and cin;
	s <= t1 xor cin;
	cout <= t2 or t3;
end df;
