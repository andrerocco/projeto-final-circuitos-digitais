library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_signed.all; -- Biblioteca para o funcionamento da comparação tc<1 (compara considerando o valor contado como um complemento de 2)

entity Counter_time is
port(
	Set: in std_logic; -- A entrada Set define o contador para o valor 99
	E: in std_logic; -- É o enable e funciona de forma síncrona
	LOAD: in std_logic_vector(7 downto 0); -- Define qual vai ser o intervalo de variação do valor a cada clock
	CLK: in std_logic; 
	tc_lt1: out std_logic; -- A saída "tc less than 1" é ativada quando o valor do contador for menor do que 1
	T_out: out std_logic_vector(7 downto 0) -- É a saída da contagem
	);
end Counter_time;

architecture arch of Counter_time is
    
    signal counter: std_logic_vector(7 downto 0) := "01100011"; -- É um sinal de 7 bits cujo valor inicial é "01100011" ou 99 decimal

begin

    process(CLK, Set)
    begin
    if (Set = '1') then -- O Set define o valor do contador para 99 decimal de forma assíncrona
       counter <= "01100011";
    end if;
    if (CLK'event and CLK = '1') then 
      if (E = '1') then -- Se o enable estiver ativado, funciona de forma síncrona
        if (counter < "00000001") then -- Se o contador atingir o 0, ficará parado em 0 até que Set seja ativado (pelo bloco de controle)
          counter <= counter + LOAD;
          tc_lt1 <= '1'; -- Ativa o sinal que simboliza que o valor atual é menor que 1
        else
          counter <= counter + LOAD; -- Diminui a contagem com o valor de LOAD(STEP)
        end if;
      end if;
    end if;
    end process;
    T_out <= counter; -- A saída recebe o valor do contador sempre

end arch;

