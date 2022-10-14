library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seg7_Decoder is
    port(
        BCD: in std_logic_vector(3 downto 0);
        Seg_a, Seg_b, Seg_c, Seg_d, Seg_e,
        Seg_f, Seg_g: out std_logic
    );
end Seg7_Decoder;

architecture Behavioral of Seg7_Decoder is
    signal Seg7_LEDs : STD_LOGIC_VECTOR (6 downto 0);
begin    
    Seg7_LEDs <= "0111111" when BCD = "0000" else
                 "0000110" when BCD = "0001" else
                 "1011011" when BCD = "0010" else
                 "1001111" when BCD = "0011" else
                 "1100110" when BCD = "0100" else
                 "1101101" when BCD = "0101" else
                 "1111101" when BCD = "0110" else
                 "0000111" when BCD = "0111" else
                 "1111111" when BCD = "1000" else
                 "1101111" when BCD = "1001"
                 else "0000000";
                 
    Seg_a <= Seg7_LEDs(0);
    Seg_b <= Seg7_LEDs(1);
    Seg_c <= Seg7_LEDs(2);
    Seg_d <= Seg7_LEDs(3);
    Seg_e <= Seg7_LEDs(4);
    Seg_f <= Seg7_LEDs(5);
    Seg_g <= Seg7_LEDs(6);
    
end Behavioral;