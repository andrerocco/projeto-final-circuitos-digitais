library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--para uso com o clock de 500Hz do FPGAEmu (CLK_500Hz)

entity Div_Freq_Emu is

	port (	clk: in std_logic;
			reset: in std_logic;
			CLK_1Hz: out std_logic;
			Sim_1Hz: out std_logic);
			
end Div_Freq_Emu;

architecture divisor of Div_Freq_Emu is
	signal cont: std_logic_vector(11 downto 0) := x"000"; -- Registra valor da contagem 
	-- O sinal de cont foi editado para começar em 0
	
	begin
		P1: process(clk, reset, cont)
		begin
			
			 if reset= '1' then
				 cont <= x"000";
				 CLK_1Hz <= '0';
				 Sim_1Hz <= '1';
				 
			 elsif clk'event and clk = '1' then

				--1Hz = 1s = 500Hzx1 = 500
				if cont = x"1F3" then  --se contador = 499 (1F3 em hexadecimal)
					CLK_1Hz <= '1';
					cont <= x"000";
					
				else
					CLK_1Hz <= '0';
					cont <= cont + 1;
					
				end if;
				
			   if cont < x"0F9" then  --se contador < 249 (0F9 em hexadecimal)
					Sim_1Hz <= '1';
					
				else Sim_1Hz <= '0';
			 
				end if;
			 end if;
		end process;
			
end architecture;
