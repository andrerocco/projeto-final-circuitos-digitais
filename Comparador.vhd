-- Comparador.vhd é um comparador de igualdade, confere se duas entradas de 8 bits são iguais
-- Caso forem iguais, a saída S irá ser '1', caso contrário será '0'

library ieee;
use ieee.std_logic_1164.all;

entity comparador is port(
	in0, in1: in  std_logic_vector(7 downto 0);
    S: out std_logic
	);
end comparador;

architecture comparador_igualdade of comparador is
begin
    
    s <= '1' when in0 = in1 else
         '0';

end comparador_igualdade;