library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Digit4_Display is
    Port ( Clk : in STD_LOGIC;
           clk_sel : in STD_LOGIC_VECTOR (1 downto 0);
           Digit3, Digit2, Digit1, Digit0 : in STD_LOGIC_VECTOR (3 downto 0);   
           Digit_En_out : out STD_LOGIC_VECTOR (3 downto 0);  
           Seg7_out : out STD_LOGIC_VECTOR (7 downto 0));  
end Digit4_Display;

architecture Behavioral of Digit4_Display is
    component decoder2to4 is
        Port( A : in STD_LOGIC_VECTOR (1 downto 0);
              Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    component mux_4b_4to1 is
        Port ( I1, I2, I3, I4 : in STD_LOGIC;
               S : in STD_LOGIC_VECTOR (1 downto 0);
               O : out STD_LOGIC);
    end component;
    component mux_4v_4to1 is
        Port ( I1,I2,I3,I4 : in STD_LOGIC_VECTOR(3 downto 0);
               S : in STD_LOGIC_VECTOR (1 downto 0);
               O : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    component Seg7_Display is
        Port ( BCD_sw : in STD_LOGIC_VECTOR (3 downto 0);
               Seg_dot_sw : in STD_LOGIC;
               Digit_En_sw : in STD_LOGIC_VECTOR (3 downto 0);
               Digit_En : out STD_LOGIC_VECTOR (3 downto 0);
               Seg7 : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    component clk_div is
        Port ( Clk : in STD_LOGIC;
               f_0, f_1, f_2, f_3 : out STD_LOGIC);
    end component;
    component CNT_2bits is
        Port ( clk : in STD_LOGIC;
               cnt_out : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    signal clk0, clk1, clk2, clk3, clk_disp : std_logic;
    signal cnt2 : std_logic_vector (1 downto 0);
    signal dec_outs : std_logic_vector (3 downto 0); 
    signal digit_sel : std_logic_vector(3 downto 0);
begin
    DFRQ: clk_div port map (Clk, clk0, clk1, clk2, clk3);
    RTL_MUX: mux_4b_4to1 port map(clk0, clk1, clk2, clk3, clk_sel, clk_disp);
    DCNT : CNT_2bits port map(clk_disp, cnt2);
    DDEC : decoder2to4 port map(cnt2, digit_sel);
    DMUX : mux_4v_4to1 port map(Digit0, Digit1, Digit2, Digit3, cnt2, dec_outs);
    DSEGDIS : Seg7_Display port map(dec_outs,'0', digit_sel, Digit_En_out, Seg7_out);
end Behavioral;
