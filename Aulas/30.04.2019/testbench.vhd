library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is

component mul is
generic(m: integer := 8);
port(a,b: in std_logic_vector(m-1 downto 0);
     s: out std_logic_vector((2*m)-1 downto 0));
end component;

signal a,b: std_logic_vector(7 downto 0);
signal s: std_logic_vector(15 downto 0);

begin

mult: mul port map(a,b,s);

a <= "00000010",
     "00000100" after 100 ns,
	  "00000011" after 200 ns,
	  "00000011" after 300 ns,
	  "00000000" after 400 ns;
	  
b <= "00000000",
     "00000001" after 100 ns,
	  "00000111" after 200 ns,
	  "00000010" after 300 ns,
	  "00000000" after 400 ns;

end test; 