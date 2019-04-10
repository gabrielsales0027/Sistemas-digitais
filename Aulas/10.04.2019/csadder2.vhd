library ieee;
use ieee.std_logic_1164.all;

entity csadder is
port(a,b,c,d : in std_logic_vector(7 downto 0);
	cin : in std_logic;
	cout: out std_logic;
	s1,sfim: out std_logic_vector(7 downto 0));
end csadder;

architecture arq of csadder is

component mux is
port(a,b,c: in std_logic;
		s:out std_logic);
end component;

component addnbits is
generic(n : integer := 8);
port(a,b : in std_logic_vector(n-1 downto 0);
		s : out std_logic_vector(n-1 downto 0);
		cin : in std_logic;
		cout : out std_logic);
end component;

signal carry : std_logic;
signal c1,c2 : std_logic;
signal cout1,cout2,smux: std_logic;
signal sx,sx2: std_logic_vector(7 downto 0);
signal s2 :std_logic_vector(7 downto 0);

begin
c1 <= '0';
c2 <= '1';

somador1 : addnbits port map(a,b,s1,cin,carry);

somador2 : addnbits port map(c,d,sx,c1,cout1);
somador3 : addnbits port map(c,d,sx2,c2,cout2);

mux1: mux port map(cout1,cout2,carry,smux);
cout <= smux;

muxf1: mux port map(sx(0),sx2(0),carry,s2(0));
muxf2: mux port map(sx(1),sx2(1),carry,s2(1));
muxf3: mux port map(sx(2),sx2(2),carry,s2(2));
muxf4: mux port map(sx(3),sx2(3),carry,s2(3));
muxf5: mux port map(sx(4),sx2(4),carry,s2(4));
muxf6: mux port map(sx(5),sx2(5),carry,s2(5));
muxf7: mux port map(sx(6),sx2(6),carry,s2(6));
muxf8: mux port map(sx(7),sx2(7),carry,s2(7));

sfim <= s2;

end arq;
-------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity textbench is
end textbench;

architecture test of textbench is

component csadder is
port(a,b,c,d : in std_logic_vector(7 downto 0);
	cin : in std_logic;
	cout: out std_logic;
	s1,sfim: out std_logic_vector(7 downto 0));
end component;

signal a,b,c,d,s1,sfim : std_logic_vector(7 downto 0);
signal cin,cout : std_logic;

begin

test : csadder port map(a,b,c,d,cin,cout,s1,sfim);

a <=  "00000000",
		"00000000" after 10 ns,
		"00000000" after 20 ns,
		"00000000" after 30 ns,
		"00000000" after 40 ns,
		"00000000" after 50 ns;
b <=  "00011111",
		"10001111" after 10 ns,
		"01001111" after 20 ns,
		"00011111" after 30 ns,
		"01111111" after 40 ns,
		"00001111" after 50 ns;
		
c <= "11001110",
		"00111111" after 10 ns,
		"01001111" after 20 ns,
		"00111111" after 30 ns,
		"00011111" after 40 ns,
		"00000000" after 50 ns;
d <= "00010000",
		"11000000" after 10 ns,
		"01000000" after 20 ns,
		"00010000" after 30 ns,
		"01110000" after 40 ns,
		"00000000" after 50 ns;
		
		cin <= '0';
end test;
