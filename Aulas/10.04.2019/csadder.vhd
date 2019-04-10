library ieee;
use ieee.std_logic_1164.all;

entity csadder is
port(a,b,c,d : in std_logic_vector(3 downto 0);
	cin : in std_logic;
	cout: out std_logic;
	s1,sfim: out std_logic_vector(3 downto 0));
end csadder;

architecture arq of csadder is

component mux is
port(a,b,c: in std_logic;
		s:out std_logic);
end component;

component addnbits is
generic(n : integer := 4);
port(a,b : in std_logic_vector(n-1 downto 0);
		s : out std_logic_vector(n-1 downto 0);
		cin : in std_logic;
		cout : out std_logic);
end component;

signal carry : std_logic;
signal c1,c2 : std_logic;
signal cout1,cout2,smux: std_logic;
signal sx,sx2: std_logic_vector(3 downto 0);
signal s2 :std_logic_vector(3 downto 0);

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

sfim <= s2;

end arq;
