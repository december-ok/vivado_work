library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_4bit_tb is
end add_4bit_tb;

architecture Behavioral of add_4bit_tb is
    component add_4bits
        port( a, b : in std_logic_vector(3 downto 0); 
         cin  : in std_logic;
         sum : out std_logic_vector(3 downto 0);
         cout : out std_logic
        );
    end component;
    
    signal a, b ,sum: std_logic_vector(3 downto 0);
    signal cin, cout : std_logic;
begin
    UUT: add_4bits port map (a,b,cin,sum,cout);
    
    process
    begin        
        a <= "0001";
        b <= "0011";
        cin <= '0';
        wait for 20 ns;
        
        a <= "0001";
        b <= "0011";
        cin <= '1';
        wait for 20 ns;
        
        a <= "0101";
        b <= "0011";
        cin <= '1';
        wait for 20 ns;
        
        a <= "0101";
        b <= "1011";
        cin <= '1';
        wait;
   end process;
   
end Behavioral;
