library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FLIP_FLOP_BD is
  port(Clk : in std_logic;
       DATA_INPUT : in std_logic;
       DATA_OUTPUT : out std_logic;
       NOT_DATA_OUTPUT : out std_logic);
end D_FLIP_FLOP_BD;

architecture Behavioral of D_FLIP_FLOP_BD is
   component clk_div is
        Port ( Clk : in STD_LOGIC;
               f_0 : out STD_LOGIC;
               f_1 : out STD_LOGIC;
               f_2 : out STD_LOGIC;
               f_3 : out STD_LOGIC);
    end component;
    signal CLOCK : std_logic ;
    signal clk0, clk1, clk2, clk3 : std_logic; -- 4 cases of Clock division from clk_div
begin
    DF: clk_div port map (Clk, clk0, clk1, clk2, clk3); -- 보드의 Clk 를 입력으로 하여 주파수 분기
    CLOCK <= clk0; -- 가장 느린 클럭인 clk0 을 이용

    process(CLOCK)
    begin
        if rising_edge(CLOCK) then
            DATA_OUTPUT <= DATA_INPUT;
            NOT_DATA_OUTPUT <= not DATA_INPUT;
        end if;
    end process;
end Behavioral; 
