library ieee;
use ieee.std_logic_1164.all;

entity control is port(
    end_game, end_sequence, end_round, enter_left, enter_right: in std_logic; -- Entradas de status (recebidos do datapath)
    enter, reset, clk: in std_logic; -- Entradas de controle
    R1, E1, E2, E3, E4, E5, E6: out std_logic -- Saídas de comandos
);
end control;

architecture rtl of control is
begin
end rtl;