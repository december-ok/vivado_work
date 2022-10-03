library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sample_gate_tb is
--  Port ( );
end sample_gate_tb;

architecture Behavioral of sample_gate_tb is
    component fulladd
        port(a, b, cin : in std_logic; s, cout: out std_logic);
    end component;
    
    signal a,b,cin,s,cout : std_logic;
begin
    UUT: fulladd port map (a => a, b=>b, cin=>cin, s=>s, cout=>cout);
    
    process
    begin        
        a <= '0';
        b <= '0';
        cin <= '0';
        wait for 20 ns;
        
        a <= '0';
        b <= '0';
        cin <= '1';
        wait for 20 ns;
        
        a <= '0';
        b <= '1';
        cin <= '0';
        wait for 20 ns;
        
        a <= '0';
        b <= '1';
        cin <= '1';
        wait for 20 ns;
        
        a <= '1';
        b <= '0';
        cin <= '0';
        wait for 20 ns;
        
        a <= '1';
        b <= '0';
        cin <= '1';
        wait for 20 ns;
        
        a <= '1';
        b <= '1';
        cin <= '0';
        wait for 20 ns;
        
        a <= '1';
        b <= '1';
        cin <= '1';
        wait;
   end process;
   
end Behavioral;
