library ieee;
use ieee.std_logic_1164.all;

entity  add_4bits is 
port( a, b : in std_logic_vector(3 downto 0); 
         cin  : in std_logic;
         sum : out std_logic_vector(3 downto 0);
         cout : out std_logic
);
end add_4bits;

architecture a of add_4bits is
component  fulladd  
port( a, b, cin  : in   std_logic;
         s, cout  : out std_logic);
end component;
signal tcout1, tcout2, tcout3 : std_logic;

begin
U1 : fulladd port map(a(0), b(0), cin, sum(0), tcout1);
U2 : fulladd port map(a(1), b(1), tcout1, sum(1), tcout2);
U3 : fulladd port map(a(2), b(2), tcout2, sum(2), tcout3);
U4 : fulladd port map(a(3), b(3), tcout3, sum(3), cout);
end a;
