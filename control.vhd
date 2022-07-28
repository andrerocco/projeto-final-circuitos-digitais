library ieee;
use ieee.std_logic_1164.all;

entity control is port(
    end_game, end_sequence, end_round, enter_left, enter_right: in std_logic; -- Entradas de status (recebidos do datapath)
    enter, reset, clk: in std_logic; -- Entradas de controle
    R1, E1, E2, E3, E4, E5, E6: out std_logic -- Saídas de comandos
);
end control;

architecture rtl of control is

    type STATES is (Init, Setup, Sequence, Play, Check, Espera, Result);
    signal EstadoAtual, ProximoEstado: STATES := Init; -- O sistema começa no estado Init

begin

    process(clk, reset)
    begin
    
        if reset = '1' then
            EstadoAtual <= Init;
        elsif (clk'event and clk = '1') then
            EstadoAtual <= ProximoEstado;
        end if;
    
    end process;

    process(EstadoAtual, enter, end_game, end_sequence, end_round, enter_left, enter_right)
    begin
    
        case EstadoAtual is
            when Init =>
                ProximoEstado <= Setup; -- Init vai direto para Setup
                R1 <= '1';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
                E6 <= '0';
            
            when Setup =>
                if enter = '1' then 
                    ProximoEstado <= Sequence; -- Vai para o estado Sequence quando enter for pressionado
                else
                    ProximoEstado <= Setup; -- Se não, fica no Setup
                end if;
                R1 <= '0';
                E1 <= '1';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
                E6 <= '0';
                
            when Sequence =>
                if (end_sequence = '1') then
                    ProximoEstado <= Play;
                else
                    ProximoEstado <= Sequence;
                end if;
                R1 <= '0';
                E1 <= '0';
                E2 <= '1';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
                E6 <= '0';
            
            when Play =>
                if (enter_left = '1') and (enter_right = '1') then
                    ProximoEstado <= Check;
                else
                    ProximoEstado <= Play; -- Se não, fica em Play
                end if;
                R1 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '1';
                E4 <= '0';
                E5 <= '0';
                E6 <= '0';
            
            when Check =>
                ProximoEstado <= Espera; -- Vai direto para o estado Espera
                R1 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '1';
                E5 <= '0';
                E6 <= '0';
            
            when Espera =>
                if (end_round = '1' or end_game = '1') then
                    ProximoEstado <= Result;
                elsif (enter = '1') then
                    ProximoEstado <= Sequence; -- Vai para o Sequence quando o enter for clicado
                else
                    ProximoEstado <= Espera; -- Se enter não for pressionado, fica no Espera
                end if;
                R1 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '1';
                E6 <= '0';
            
            when Result =>
                if (enter = '1') then
                    ProximoEstado <= Init; -- Se enter for pressionado, vai para o Init
                else
                    ProximoEstado <= Result; -- Se enter não for pressionado, fica no Result
                end if;
                R1 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
                E6 <= '1';
                
        end case;
        
    end process;

end rtl;
