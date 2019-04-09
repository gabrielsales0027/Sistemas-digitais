library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity modulo is
	port(a,b:in std_logic_vector(3 downto 0);
		  cin: in  std_logic;
	     c : out std_logic_vector(3 downto 0);
		  Ps :out std_logic_vector(3 downto 0);
		  Psaida,Gsaida,CoutSaida : out std_logic);
end modulo;

architecture arq of modulo is

component halfadder is
port(a,b: in std_logic;
	  P,G: out std_logic);
end component;

signal p,g : std_logic_vector(3 downto 0);
signal temp1,temp2,temp3: std_logic;

begin

x: halfadder port map(a(0),b(0),p(0),g(0));
x2: halfadder port map(a(1),b(1),p(1),g(1));
x3: halfadder port map(a(2),b(2),p(2),g(2));
x4: halfadder port map(a(3),b(3),p(3),g(3));

c(0) <= g(0) or (p(0) and cin);
c(1) <= g(1) or (p(1) and g(0)) or ((p(1)and p(0))and cin);
c(2) <= g(2) or (p(2) and g(1)) or ((p(2)and p(1))and g(0)) or (((p(2)and p(1))and p(0))and cin);
c(3) <= g(3) or (p(3) and g(2)) or ((p(3)and p(2))and g(1)) or (((p(3)and p(2))and p(1))and g(0)) or ((((p(3)and p(2))and p(1))and p(0))and cin);

Ps(0) <= p(0);
Ps(1) <= p(1);
Ps(2) <= p(2);
Ps(3) <= p(3);

temp1 <= g(3) or (p(3) and g(2)) or ((p(3)and p(2))and g(1)) or (((p(3)and p(2))and p(1))and g(0));
temp2 <= (((p(3)and p(2))and p(1))and p(0))and cin;
temp3 <=g(3) or (p(3) and g(2)) or ((p(3)and p(2))and g(1)) or (((p(3)and p(2))and p(1))and g(0)) or ((((p(3)and p(2))and p(1))and p(0))and cin);
Psaida <= temp2;
Gsaida <= temp1;
CoutSaida <= temp3;
end arq;
