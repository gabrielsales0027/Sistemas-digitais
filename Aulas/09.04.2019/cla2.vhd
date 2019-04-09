library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cla is
	port(a,b:in std_logic_vector(3 downto 0);
	     s:out std_logic_vector(3 downto 0);
	     cin : in std_logic;
		  Psaida,Gsaida,CoutSaida : out std_logic);
end cla;

architecture arq of cla is

component modulo is
	port(a,b:in std_logic_vector(3 downto 0);
	     cin : in std_logic;
	    c : out std_logic_vector(3 downto 0);
		 Ps :out std_logic_vector(3 downto 0);
		 Psaida,Gsaida,CoutSaida : out std_logic);
end component;

signal P: std_logic_vector(3 downto 0);

signal couts : std_logic_vector(3 downto 0);
begin


x1 : modulo port map (a,b,cin,couts,P,Psaida,Gsaida,CoutSaida);

s(0) <= couts(0) xor P(0);
s(1) <= couts(1) xor P(1);
s(2) <= couts(2) xor P(2);
s(3) <= couts(3) xor P(3);


end arq;
