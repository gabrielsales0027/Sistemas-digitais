library ieee;
use ieee.std_logic_1164.all;

entity textbench is
end textbench;

architecture test of textbench is

component csadder is
port(a,b,c,d : in std_logic_vector(3 downto 0);
	cin : in std_logic;
	cout: out std_logic;
	s1,sfim: out std_logic_vector(3 downto 0));
end component;

signal a,b,c,d,s1,sfim : std_logic_vector(3 downto 0);
signal cin,cout : std_logic;

begin

test : csadder port map(a,b,c,d,cin,cout,s1,sfim);

a <=  "0000",
		"0000" after 10 ns,
		"0000" after 20 ns,
		"0000" after 30 ns,
		"0000" after 40 ns,
		"0000" after 50 ns;
b <=  "0001",
		"1000" after 10 ns,
		"0100" after 20 ns,
		"0001" after 30 ns,
		"0111" after 40 ns,
		"0000" after 50 ns;
		
c <= "1100",
		"0011" after 10 ns,
		"0100" after 20 ns,
		"0011" after 30 ns,
		"0001" after 40 ns,
		"0000" after 50 ns;
d <= "0001",
		"1000" after 10 ns,
		"0100" after 20 ns,
		"0001" after 30 ns,
		"0111" after 40 ns,
		"0000" after 50 ns;
		
		cin <= '0';
end test;
