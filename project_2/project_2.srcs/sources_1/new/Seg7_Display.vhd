library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seg7_Display is
    Port ( BCD_sw : in STD_LOGIC_VECTOR (3 downto 0);
           Seg_dot_sw : in STD_LOGIC;
           Digit_En_sw : in STD_LOGIC_VECTOR (3 downto 0);
           Digit_En : out STD_LOGIC_VECTOR (3 downto 0);
           Seg7 : out STD_LOGIC_VECTOR (7 downto 0));
end Seg7_Display;

architecture Behavioral of Seg7_Display is
    component Seg7_Decoder
        port(
            BCD: in std_logic_vector(3 downto 0);
            Seg_a, Seg_b, Seg_c, Seg_d, Seg_e,
            Seg_f, Seg_g: out std_logic
        );
    end component;
    signal Seg_a, Seg_b, Seg_c, Seg_d, Seg_e, Seg_f, Seg_g : std_logic;    

begin
    SEGD: Seg7_Decoder port map (
        BCD_sw, 
        Seg_a, Seg_b, Seg_c, Seg_d, Seg_e, Seg_f, Seg_g
        );

    Seg7 <= (not Seg_dot_sw) & (not Seg_g) & (not Seg_f) & (not Seg_e) & (not Seg_d) & (not Seg_c) 
             & (not Seg_b) & (not Seg_a);

    Digit_En <= not Digit_En_sw;

end Behavioral;
