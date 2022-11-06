library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FLIP_FLOP_BD is
  port(Clk : in std_logic;
       T_INPUT : in std_logic;
       ENABLE : in std_logic;
       Q : out std_logic;
       NOT_Q : out std_logic);
end T_FLIP_FLOP_BD;

architecture Behavioral of T_FLIP_FLOP_BD is
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
  variable FORMER_T: std_logic;
  begin
    if ENABLE = '0' then
        Q_TEMP := '0';
    else
        if rising_edge(CLOCK) then
            if ENABLE = '0' then
                Q_TEMP := '0';
            elsif FORMER_T = '0' then
                Q_TEMP := Q_TEMP;
            elsif FORMER_T = '1' then
                Q_TEMP := not Q_TEMP;
            end if;
        end if;
    end if;
    
    FORMER_T := T_INPUT;
    Q <= Q_TEMP;
    NOT_Q <= not Q_TEMP;
  end process;
end Behavioral;