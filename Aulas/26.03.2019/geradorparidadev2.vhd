entity geradorparidade is
generic (n: in integer :=4 );
port(input: in bit_vector(n-1 downto 0);
	  output: out bit);
end geradorparidade;

architecture gerador of geradorparidade is
signal s : bit_vector(n downto 0);
begin
laco : for i  in 0 to n-1 generate
		s(i+1) <= s(i) xor input(i);
end generate;
s(0) <= '0';
output <= s(n);

end gerador;
