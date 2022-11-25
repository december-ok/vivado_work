library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_USR is
end tb_USR;

architecture Behavioral of tb_USR is
   component USR
      Port ( clk : in STD_LOGIC; -- clock
             clear : in STD_LOGIC; -- clear
             s : in STD_LOGIC_VECTOR (1 downto 0);                     
             d_in : in STD_LOGIC;
             p_in : in STD_LOGIC_VECTOR (3 downto 0); 		  Q : out STD_LOGIC_VECTOR (3 downto 0));
   end component ;
   signal clk : std_logic := '0';
   signal clear : std_logic;
   signal s : std_logic_vector (1 downto 0);
   signal d_in : std_logic := '1';
   signal p_in : std_logic_vector (3 downto 0):="1111";
   signal Q : std_logic_vector (3 downto 0); 
begin
   clk <= not clk after 20 ns;
    
   UUT: USR port map (clk, clear, s, d_in, p_in, Q);
   tb: process
   begin
        clear <= '0';
        s <= "00"; -- no change
        wait for 200 ns;
        
        clear <= '0';
        s <= "01"; -- shift right
        wait for 200 ns;
        
        clear <= '0';
        d_in <= '0';
        s <= "10"; -- shift left
        wait for 200 ns;
        
        clear <= '0';
        s <= "11"; -- parallel load
        wait for 200 ns;
        
        clear <= '1';
        s <= "00"; -- no change
        wait ;
        
    end process;
end Behavioral;
