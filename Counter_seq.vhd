library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity Counter_seq is
port(
	R: in std_logic; -- A entrada reset define o contador para o valor 0
	E: in std_logic; -- É o enable e funciona de forma síncrona
	CLK: in std_logic; 
	tc_eq4: out std_logic; -- A saída "tc equals 4" é ativada quando o valor do contador for igual a 4 decimal
	T_out: out std_logic_vector(1 downto 0) -- É a saída da contagem
	);
end Counter_seq;

architecture arch of Counter_seq is
    
    signal counter: std_logic_vector(1 downto 0) := "00"; -- É um sinal de 2 bits cujo valor inicial é 0

begin
    
    process(CLK, R)
    begin
    if (R = '1') then -- O reset define o valor do contador para 0 decimal de forma assíncrona
       counter <= "00";
       tc_eq4 <= '0';
    end if;
    if (E = '1') then -- Se o enable estiver ativado, funciona de forma assíncrona
      if (CLK'event and CLK = '1') then 
        if (counter = "11") then -- Se o contador atingir o 4, ativará o sinal tc_eq4 será '1', mas counter continuará somando 1
          counter <= counter + "01";
          tc_eq4 <= '1'; -- Ativa o sinal que simboliza que o valor atual é igual a 4
        else
          counter <= counter + "01"; -- Aumenta a contagem em 1
          tc_eq4 <= '0';
        end if;
      end if;
    end if;
    end process;
    T_out <= counter; -- A saída recebe o valor do contador sempre

end arch;
