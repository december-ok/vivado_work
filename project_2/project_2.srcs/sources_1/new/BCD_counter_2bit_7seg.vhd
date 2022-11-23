library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCD_counter_2bit_7seg is 
   port( clk: in std_logic;
 	     rst: in std_logic;
 	     Digit_En_Out: out std_logic_vector(3 downto 0);
 	     Seg7_out: out std_logic_vector(7 downto 0));
end BCD_counter_2bit_7seg;
 
architecture Behavioral of BCD_counter_2bit_7seg is
 
    component clk_div is
        Port ( Clk : in std_logic;
               f_0, f_1, f_2, f_3 : out std_logic);
    end component;
    component BCD_counter_2bit is
        Port( Clock: in std_logic;
 	          Reset: in std_logic;
 	          OutputL, OutputH: out std_logic_vector(3 downto 0));
    end component;
    component CNT_2bits is
        Port ( clk : in std_logic;
               cnt_out : out std_logic_vector (1 downto 0));
    end component;
    component mux_4v_4to1 is
        Port ( I1,I2,I3,I4 : in STD_LOGIC_VECTOR(3 downto 0);
               S : in STD_LOGIC_VECTOR (1 downto 0);
            O : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    component decoder2to4 is
        Port( A : in std_logic_vector (1 downto 0);
              Y : out std_logic_vector (3 downto 0));
    end component;
    component Seg7_Display is
        Port ( BCD_sw : in std_logic_vector (3 downto 0);
               Seg_dot_sw : in std_logic;
               Digit_En_sw : in std_logic_vector (3 downto 0);
               Digit_En : out std_logic_vector (3 downto 0);
               Seg7 : out std_logic_vector (7 downto 0));
    end component;

    signal clk0, clk1, clk2, clk3, clk_disp : std_logic;
    signal tempL, tempH: std_logic_vector(3 downto 0);
    signal cnt2 : std_logic_vector (1 downto 0);
    signal digit_sel : std_logic_vector (3 downto 0);
    signal dec_outs : std_logic_vector (3 downto 0);

begin   
   DFRQ: clk_div port map (clk, clk0, clk1, clk2, clk3);
   DBCDCNT: BCD_counter_2bit port map (clk1, rst, tempL, tempH);
   DCNT: CNT_2bits port map (clk3, cnt2);
   DMUX: mux_4v_4to1 port map (tempL, tempH, "0000", "0000",cnt2, digit_sel);
   DDEC: decoder2to4 port map (cnt2, dec_outs);
   DSEGDIS: Seg7_display port map (digit_sel, '0', dec_outs, Digit_En_out, Seg7_out);

end Behavioral;