library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seg7_Decoder_tb is
end Seg7_Decoder_tb;

architecture Behavioral of Seg7_Decoder_tb is
    component Seg7_Decoder
        port(
            BCD: in std_logic_vector(3 downto 0);
            Seg_a, Seg_b, Seg_c, Seg_d, Seg_e,
            Seg_f, Seg_g: out std_logic
        );
    end component;
    
    signal BCD: std_logic_vector(3 downto 0);
    signal Seg_a, Seg_b, Seg_c, Seg_d, Seg_e, Seg_f, Seg_g : std_logic;    
begin
    UUT: Seg7_Decoder port map (BCD, Seg_a, Seg_b, Seg_c, Seg_d, Seg_e, Seg_f, Seg_g);
    
    process
    begin        
        BCD <= "0000";
        wait for 20 ns;
        
        BCD <= "0001";
        wait for 20 ns;
        BCD <= "0010";
        wait for 20 ns;
        
        BCD <= "0011";
        wait for 20 ns;
        
        BCD <= "0100";
        wait for 20 ns;
        
        BCD <= "0101";
        wait for 20 ns;
        
        BCD <= "0110";
        wait for 20 ns;
        
        BCD <= "0111";
        wait for 20 ns;
        
        BCD <= "1000";
        wait for 20 ns;
        
        BCD <= "1001";
        wait;
   end process;
   
end Behavioral;
