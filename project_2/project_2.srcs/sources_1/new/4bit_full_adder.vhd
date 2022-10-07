library ieee;
use ieee.std_logic_1164.all;

entity add_4bits is 
port(sw : in std_logic_vector(9 downto 0); 
     led : out std_logic_vector(5 downto 0)
);
end add_4bits;

architecture a of add_4bits is
component fulladd 
port(a, b, cin : in std_logic;
     s, cout : out std_logic);
end component;

signal tcout1, tcout2, tcout3 : std_logic;

begin
U1 : fulladd port map(sw(0), sw(4), sw(8), led(0), tcout1);
U2 : fulladd port map(sw(1), sw(5), tcout1, led(1), tcout2);
U3 : fulladd port map(sw(2), sw(6), tcout2, led(2), tcout3);
U4 : fulladd port map(sw(3), sw(7), tcout3, led(3), led(4));
end a;
