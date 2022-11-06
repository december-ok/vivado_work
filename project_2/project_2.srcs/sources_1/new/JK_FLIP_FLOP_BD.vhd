library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FLIP_FLOP_BD is
  port(Clk : in std_logic;
       J_INPUT : in std_logic;
       K_INPUT : in std_logic;
       ENABLE : in std_logic;
       Q : out std_logic;
       NOT_Q : out std_logic);
end JK_FLIP_FLOP_BD;

architecture Behavioral of JK_FLIP_FLOP_BD is
   component clk_div is
        Port ( Clk : in STD_LOGIC;
               f_0 : out STD_LOGIC;
               f_1 : out STD_LOGIC;
               f_2 : out STD_LOGIC;
               f_3 : out STD_LOGIC);
    end component;
    signal CLOCK : std_logic ;
    signal clk0, clk1, clk2, clk3 : std_logic;
begin
  DF: clk_div port map (Clk, clk0, clk1, clk2, clk3);
  CLOCK <= clk0;
  process(CLOCK)
  variable Q_TEMP: std_logic := '0';
  variable FORMER_J, FORMER_K: std_logic;
  begin
    if falling_edge(CLOCK) then
        if ENABLE = '0' then
            Q_TEMP := '0';
        elsif FORMER_J = '0' and FORMER_K = '0' then
            Q_TEMP := Q_TEMP;
        elsif FORMER_J = '1' and FORMER_K = '0' then
            Q_TEMP := '1';
        elsif FORMER_J = '0' and FORMER_K = '1' then
            Q_TEMP := '0';
        else
            Q_TEMP := not Q_TEMP; 
        end if;
    end if;
    Q <= Q_TEMP;
    NOT_Q <= not Q_TEMP;
    
    FORMER_J := J_INPUT;
    FORMER_K := K_INPUT;
  end process;
end Behavioral;