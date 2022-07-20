library ieee;
use ieee.std_logic_1164.all;

entity ROM0 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(79 downto 0));
    
end ROM0;

architecture Rom_Arch of ROM0 is

type memory is array (00 to 15) of std_logic_vector(79 downto 0);
constant my_Rom : memory := (

	00 => x"55D5F5FDFF55575F7FFF",  --BIN- L: 11111111 11111101 11110101 11010101 01010101  R: 11111111 01111111 01011111 01010111 01010101
	01 => x"21201110010110112021",  --BCD- L:  1 10 11 20 21  R: 21 20 11 10  1
   02 => x"E3C3C18180C7C3838101",  --BIN- L: 10000000 10000001 11000001 11000011 11100011  R: 00000001 10000001 10000011 11000011 11000111
	03 => x"04081632646432160804",  --BCD- L: 64 32 16  8  4  R:  4  8 16 32 64
	04 => x"55443322111122334455",  --BIN- L: 00010001 00100010 00110011 01000100 01010101  R: 01010101 01000100 00110011 00100010 00010001
	05 => x"32160804020204081632",  --BCD- L:  2  4  8 16 32  R: 32 16  8  4  2
	06 => x"FFE7C3810000183C7EFF",  --BIN- L: 11111111 11100111 11000011 10000001 00000000  R: 00000000 00011000 00111100 01111110 11111111
	07 => x"25201510055045403530",  --BCD- L:  5 10 15 20 25  R: 30 35 40 45 50
	08 => x"11224422118844224488",  --BIN- L: 00010001 00100010 01000100 00100010 00010001  R: 10001000 01000100 00100010 01000100 10001000
	09 => x"15120906032016120804",  --BCD- L:  3  6  9 12 15  R:  4  8 12 16 20
   10 => x"3366CC6633CC663366CC",  --BIN- L: 00110011 01100110 11001100 01100110 00110011  R: 11001100 01100110 00110011 01100110 11001100
	11 => x"50403020105060708090",  --BCD- L: 10 20 30 40 50  R: 90 80 70 60 50
	12 => x"CCEE7733113377EECC88",  --BIN- L: 00010001 00110011 01110111 11101110 11001100  R: 10001000 11001100 11101110 01110111 00110011
	13 => x"05040302011009080706",  --BCD- L:  1  2  3  4  5  R:  6  7  8  9 10
	14 => x"1F0F070301F878381808",  --BIN- L: 00000001 00000011 00000111 00001111 00011111  R: 00001000 00011000 00111000 01111000 11111000
	15 => x"01020304050607080910"); --BCD- L:  5  4  3  2  1  R: 10  9  8  7  6
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
