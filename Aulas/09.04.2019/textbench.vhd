library ieee;
use ieee.std_logic_1164.all;

entity textbench is
end textbench;

architecture test of textbench is
component cla is
	port(a,b:in std_logic_vector(3 downto 0);
	     s:out std_logic_vector(3 downto 0);
	     cin : in std_logic;
		  Psaida,Gsaida,CoutSaida : out std_logic);
end component;

signal a,b,s : std_logic_vector(3 downto 0);
signal cin,Psaida,Gsaida,CoutSaida : std_logic;

begin

test : cla port map(a,b,s,cin,Psaida,Gsaida,CoutSaida);

a <= "0001",
		"0011" after 10 ns,
		"0100" after 20 ns,
		"0111" after 30 ns,
		"0000" after 40 ns,
		"0110" after 50 ns,
		"0000" after 60 ns;
b <= "0001",
		"0001" after 10 ns,
		"0100" after 20 ns,
		"0001" after 30 ns,
		"1111" after 40 ns,
		"0011" after 50 ns,
		"0000" after 60 ns;
		
		cin <= '0';
end test;
