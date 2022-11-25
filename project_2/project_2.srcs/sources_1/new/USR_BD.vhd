library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity USR_BD is
    Port (clk: in std_logic;
          clr: in std_logic;
          mode: in std_logic_vector (1 downto 0);
          DI: in std_logic;
          PI: in std_logic_vector (3 downto 0);
          Q: out std_logic_vector (3 downto 0) );
end USR_BD;

architecture Behavioral of USR_BD is
    component clk_div is
        Port ( clk : in STD_LOGIC;
               f_0 : out STD_LOGIC;
               f_1 : out STD_LOGIC;
               f_2 : out STD_LOGIC;
               f_3 : out STD_LOGIC);
    end component;
    component USR is
        Port ( clk : in STD_LOGIC; -- clock
           clear : in STD_LOGIC; -- clear
           s : in STD_LOGIC_VECTOR (1 downto 0); -- mode select
           d_in : in STD_LOGIC; -- new serial data input
           p_in : in STD_LOGIC_VECTOR (3 downto 0); -- parallel input
           Q : out STD_LOGIC_VECTOR (3 downto 0)); -- register output                
    end component;

    signal clk0, clk1, clk2, clk3 : std_logic ;
begin
    DFRQ: clk_div port map (clk, clk0, clk1, clk2, clk3);
    USR4: USR port map (clk0, clr, mode, DI, PI, Q);  
end Behavioral;
