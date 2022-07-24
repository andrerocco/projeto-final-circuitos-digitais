library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity Counter_round is
port(
	Set: in std_logic; -- A entrada Set define o contador para o valor 15
	E: in std_logic; -- É o enable e funciona de forma síncrona
	CLK: in std_logic; 
	tc_eq0: out std_logic; -- A saída "tc equals 1" é ativada quando o valor do contador for igual a zero
	T_out: out std_logic_vector(3 downto 0) -- É a saída da contagem
	);
end Counter_round;

architecture arch of Counter_round is
    
    signal counter: std_logic_vector(3 downto 0) := "1111"; -- É um sinal de 4 bits cujo valor inicial é "1111" ou 15 decimal

begin

    process(CLK, Set)
    begin
    if (Set = '1') then -- O Set define o valor do contador para 15 decimal de forma assíncrona
       counter <= "1111";
    end if;
    if (CLK'event and CLK = '1') then 
      if (E = '1') then -- Se o enable estiver ativado, funciona de forma síncrona
        if (counter = "0000") then -- Se o contador atingir o 0, ficará parado em 0 até que Set seja ativado (pelo bloco de controle)
          counter <= "0000";
          tc_eq0 <= '1'; -- Ativa o sinal que simboliza que o valor atual é menor que 1
        else
          counter <= counter - "0001"; -- Diminui a contagem em 1
        end if;
      end if;
    end if;
  end process;
  T_out <= counter; -- A saída recebe o valor do contador sempre

end arch;
