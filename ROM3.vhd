library ieee;
use ieee.std_logic_1164.all;

entity ROM3 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(79 downto 0));
    
end ROM3;

architecture Rom_Arch of ROM3 is
  
type memory is array (00 to 15) of std_logic_vector(79 downto 0);
constant my_Rom : memory := (

	00 => x"FF00FF00FF00FF00FF00",  --BIN- L:  R:
	01 => x"FF00FF00FF00FF00FF00",  --BCD- L:  R:
   02 => x"FF00FF00FF00FF00FF00",  --BIN- L:  R:
	03 => x"FF00FF00FF00FF00FF00",  --BCD- L:  R:
	04 => x"FF00FF00FF00FF00FF00",  --BIN- L:  R:
	05 => x"FF00FF00FF00FF00FF00",  --BCD- L:  R:
	06 => x"FF00FF00FF00FF00FF00",  --BIN- L:  R:
	07 => x"FF00FF00FF00FF00FF00",  --BCD- L:  R:
	08 => x"FF00FF00FF00FF00FF00",  --BIN- L:  R:
	09 => x"FF00FF00FF00FF00FF00",  --BCD- L:  R:
   10 => x"FF00FF00FF00FF00FF00",  --BIN- L:  R:
	11 => x"FF00FF00FF00FF00FF00",  --BCD- L:  R:
	12 => x"FF00FF00FF00FF00FF00",  --BIN- L:  R:
	13 => x"FF00FF00FF00FF00FF00",  --BCD- L:  R:
	14 => x"FF00FF00FF00FF00FF00",  --BIN- L:  R:
	15 => x"FF00FF00FF00FF00FF00"); --BCD- L:  R: 
	    -- a ordem eh da direita pra esquerda: 5<-4<-3<-2<-1      5<-4<-3<-2<-1
    	 -- e de baixo pra cima, a primeira rodada eh a linha 15, depois a 14, etc. 
	 
	
begin
   process (address)
   begin
       case address is
       when "0000" => data <= my_rom(00);
       when "0001" => data <= my_rom(01);
       when "0010" => data <= my_rom(02);
       when "0011" => data <= my_rom(03);
       when "0100" => data <= my_rom(04);
       when "0101" => data <= my_rom(05);
       when "0110" => data <= my_rom(06);
       when "0111" => data <= my_rom(07);
       when "1000" => data <= my_rom(08);
       when "1001" => data <= my_rom(09);
	    when "1010" => data <= my_rom(10);
	    when "1011" => data <= my_rom(11);
       when "1100" => data <= my_rom(12);
	    when "1101" => data <= my_rom(13);
	    when "1110" => data <= my_rom(14);
	    when others => data <= my_rom(15);
     end case;
  end process;
end architecture Rom_Arch;
