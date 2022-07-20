library ieee;
use ieee.std_logic_1164.all;

entity ButtonPlay is port(

    KEY1, KEY0: in  std_logic;
    Reset, clk: in  std_Logic;
    BTN1, BTN0: out std_logic); 
    
end ButtonPlay;

architecture arc_btn of ButtonPlay is 

type STATES is (EsperaApertar, Apertado);
signal BTN1_state, BTN0_state: STATES := EsperaApertar;
signal BTN1_next, BTN0_next: STATES := EsperaApertar;

begin
    
    process (clk, Reset) 
	begin
		
		if Reset = '1' then
			BTN1_state <= EsperaApertar;
			BTN0_state <= EsperaApertar;
			
		elsif clk'event and clk = '1' then
			BTN1_state <= BTN1_next;
			BTN0_state <= BTN0_next;
		end if;
	end process;
	
	
	process (key1, BTN1_state)
	begin
		case BTN1_state is
			when EsperaApertar =>
				BTN1 <= '0';
				if key1 = '0' then BTN1_next <= Apertado; else BTN1_next <= EsperaApertar; end if;
				
			when Apertado =>
				BTN1 <= '1';
				BTN1_next <= Apertado;
			
		end case;		
	end process;
	
	
	process (key0, BTN0_state)
	begin
		case BTN0_state is
			when EsperaApertar =>
				BTN0 <= '0';
				if key0 = '0' then BTN0_next <= Apertado; else BTN0_next <= EsperaApertar; end if;
				
			when Apertado =>
				BTN0 <= '1';
				BTN0_next <= Apertado;
			
		end case;		
	end process;
end arc_btn;
