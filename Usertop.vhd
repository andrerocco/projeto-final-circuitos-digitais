-- O arquivo Usertop.vhd faz a comunicação entre o datapath.vhd e o control.vhd
-- Além disso, faz a ligação entre os componentes ButtonPlay.vhd e ButtonSync.vhd
-- Esses dois componentes são externos ao datapath/control e servem para definir as entradas

library ieee;
use ieee.std_logic_1164.all;

entity usertop is port(
    CLK: in std_logic; -- A entrada CLK precisa ser mapeada no Mapper
	KEY: in std_logic_vector(3 downto 0);
	SW: in std_logic_vector(17 downto 0);
	LEDR: out std_logic_vector(17 downto 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7	: out std_logic_vector(6 downto 0)
	);
end usertop;

architecture rtl of usertop is
    signal R1, E1, E2, E3, E4, E5, E6, end_game, end_sequence, end_round, enter_left, enter_right, enter, reset: std_logic;
    -- Sem uso
    signal end_left, end_right: std_logic;
    
    -- Declaração dos componentes
    component datapath is port(
        SW: in std_logic_vector(17 downto 0); -- Entradas de dados
        CLK: in std_logic;
	    Enter_left, Enter_right: in std_logic; -- Entradas de dados
        R1, E1, E2, E3, E4, E5, E6: in std_logic; -- Entradas de comandos
	    end_game, end_sequence, end_round, end_left, end_right: out std_logic; -- Saídas de status
        HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0: out std_logic_vector(6 downto 0); -- Saídas de dados
        LEDR: out std_logic_vector(17 downto 0) -- Saída de dados
    );
    end component;
    
    component control is port(
        end_game, end_sequence, end_round, enter_left, enter_right: in std_logic; -- Entradas de status (recebidos do datapath)
        enter, reset, clk: in std_logic; -- Entradas de controle
        R1, E1, E2, E3, E4, E5, E6: out std_logic -- Saídas de comandos
    );
    end component;

    component ButtonPlay is port(
        KEY1, KEY0: in  std_logic; 
        Reset, clk: in  std_Logic;
        BTN1, BTN0: out std_logic -- BTN1 corresponde ao 'enter_left' e BTN0 corresponde ao 'enter_right'
    );
    end component;

    component ButtonSync is port(
        KEY1, KEY0, CLK: in  std_logic;
        BTN1, BTN0: out std_logic -- BTN1 corresponde ao 'enter' e BTN0 corresponde ao 'reset'
    );
    end component;

begin
    
    BTNPLAY: ButtonPlay port map(KEY(3), KEY(2), 
                                 E2, CLK,
                                 enter_left, enter_right);
    
    BTNSYNC: ButtonSync port map(KEY(1), KEY(0), CLK,
                                 enter, reset);
    
    BLOCODATAPATH: datapath port map(SW,
                                     CLK,
                                     enter_left, enter_right,
                                     R1, E1, E2, E3, E4, E5, E6,
                                     end_game, end_sequence, end_round, end_left, end_right, -- VER O END LEFT E END RIGHT
                                     HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
                                     LEDR
                                     );
    
    BLOCOCONTROLE: control port map(end_game, end_sequence, end_round, enter_left, enter_right, -- Entradas de status (recebidos do datapath)
                                    enter, reset, CLK, -- Entradas de controle
                                    R1, E1, E2, E3, E4, E5, E6  -- Saídas de comandos
                                    );

end rtl;