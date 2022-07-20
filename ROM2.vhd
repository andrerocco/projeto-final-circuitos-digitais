library ieee;
use ieee.std_logic_1164.all;

entity ROM2 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(79 downto 0));
    
end ROM2;

architecture Rom_Arch of ROM2 is
  
type memory is array (00 to 15) of std_logic_vector(79 downto 0);
constant my_Rom : memory := (

	00 => x"2DB76EB8C0B4ED761D03",  --BIN- L: 11000000 10111000 01101110 10110111 00101101  R: 00000011 00011101 01110110 11101101 10110100
	01 => x"61687479835158646973",  --BCD- L: 83 79 74 68 61  R: 73 69 64 58 51
   02 => x"AC58B060C0351A0D0603",  --BIN- L: 11000000 01100000 10110000 01011000 10101100  R: 00000011 00000110 00001101 00011010 00110101
	03 => x"61555046435145403633",  --BCD- L: 43 46 50 55 61  R: 33 36 40 45 51
	04 => x"6DB6D86080B66D1B0601",  --BIN- L: 10000000 01100000 11011000 10110110 01101101  R: 00000001 00000110 00011011 01101101 10110110
	05 => x"17130905011814100602",  --BCD- L:  1  5  9 13 17  R:  2  6 10 14 18
	06 => x"33CC330C03CC33CC30C0",  --BIN- L: 00000011 00001100 00110011 11001100 00110011  R: 11000000 00110000 11001100 00110011 11001100
	07 => x"20242832361518212427",  --BCD- L: 36 32 28 24 20  R: 27 24 21 18 15
	08 => x"D8B060C080361B0D0603",  --BIN- L: 10000000 11000000 01100000 10110000 11011000  R: 00000011 00000110 00001101 00011011 00110110
	09 => x"45362718093024181206",  --BCD- L:  9 18 27 36 45  R:  6 12 18 24 30
   10 => x"0F070381C0F0E0C08103",  --BIN- L: 11000000 10000001 00000011 00000111 00001111  R: 00000011 10000001 11000000 11100000 11110000
	11 => x"07050302010102030507",  --BCD- L:  1  2  3  5  7  R:  7  5  3  2  1
	12 => x"DCB870E0C03B1D0E0703",  --BIN- L: 11000000 11100000 01110000 10111000 11011100  R: 00000011 00000111 00001110 00011101 00111011
	13 => x"15120906032520151005",  --BCD- L:  3  6  9 12 15  R:  5 10 15 20 25
	14 => x"CC9860C0803319060301",  --BIN- L: 10000000 11000000 01100000 10011000 11001100  R: 00000001 00000011 00000110 00011001 00110011
	15 => x"16080402010408163264"); --BCD- L:  1  2  4  8 16  R: 64 32 16  8  4
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
