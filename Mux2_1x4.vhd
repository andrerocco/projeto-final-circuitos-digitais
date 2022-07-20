library ieee;
use ieee.std_Logic_1164.all;

entity Mux2_1x4 is port(

    S     : in  std_logic;
    L0, L1: in  std_logic_vector(3 downto 0);
    D     : out std_logic_vector(3 downto 0));
    
end Mux2_1x4;

architecture arcmux4_1 of Mux2_1x4 is begin

    D <= L0 when S = '0' else
         L1;
         
end arcmux4_1;
