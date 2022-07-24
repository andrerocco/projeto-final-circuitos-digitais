library ieee;
use ieee.std_logic_1164.all;

entity Registrador4Bits is port(
    CLK: in std_logic;
	R: in std_logic;
	E: in std_logic;
    ValorBinario_in: in std_logic_vector(3 downto 0);
    ValorBinario_out: out std_logic_vector(3 downto 0)
	);
end Registrador4Bits;

architecture registrador4 of Registrador4Bits is
begin
    
    process(CLK,R)
    begin
        if (R = '1') then -- Se o reset estiver ativado, define a saída como "0000"
            ValorBinario_out <= "0000";
        elsif (CLK'event and CLK = '1' and E = '1') then -- Se ocorrer um clock e o enable estiver ativado, transmite o valor
            ValorBinario_out <= ValorBinario_in;
        end if;
    end process;

end registrador4;