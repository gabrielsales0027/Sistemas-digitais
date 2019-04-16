library ieee;
use ieee.std_logic_1164.all;

entity textbench is
end textbench;

architecture test of textbench is

component sub1b is
port(A,B : in std_logic_vector(3 downto 0);
	  M: in std_logic;
	  cout: out std_logic;
	  S : out std_logic_vector(3 downto 0));
end component;

signal a,b,s : std_logic_vector(3 downto 0);
signal m,cout : std_logic;

begin

test : sub1b port map(a,b,m,cout,s);

a <= "1111",
		"0011" after 10 ns,
		"0101" after 20 ns,
		"0111" after 30 ns,
		"0111" after 40 ns,
		"0000" after 50 ns;
b <= "0111",
		"0011" after 10 ns,
		"0001" after 20 ns,
		"0010" after 30 ns,
		"0111" after 40 ns,
		"0000" after 50 ns;
			
		m <= '1';
end test;
