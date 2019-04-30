library ieee;
use ieee.std_logic_1164.all;

entity mul is
generic(m: integer := 8);--tamanho do multiplicador
port(a,b: in std_logic_vector(m-1 downto 0);
     s: out std_logic_vector((2*m)-1 downto 0));
end mul;

architecture mul of mul is

component adder is
generic(n: integer := m);
port(a,b: in std_logic_vector(n-1 downto 0);
     s: out std_logic_vector(n-1 downto 0);
	  cout: out std_logic);
end component;

type matrix is array(0 to m-1) of std_logic_vector(m-1 downto 0);
signal prods: matrix;--multiplicaçao de todos os bits de a com todos de b
signal ss: matrix;--saídas dos somadores
signal as: matrix;--entradas dos somadores
signal couts: std_logic_vector(m-1 downto 0);--carry out de todos os somadores

begin

loop1: for linha in 0 to m-1 generate
	loop2: for coluna in 0 to m-1 generate
		prods(linha)(coluna) <= a(linha) and b(coluna);
	end generate;
end generate;

ss(0) <= prods(0);
couts(0) <= '0';


loop3: for i in 0 to m-2 generate
	as(i) <= couts(i) & ss(i)(m-1 downto 1);
	add: adder port map(a => as(i),
	                    b => prods(i+1),
							  s => ss(i+1),
							  cout => couts(i+1));
	s(i) <= ss(i)(0);
end generate;
s(2*m-1) <= couts(m-1);
s(2*m-2 downto 2*m-2-(m-1)) <= ss(m-1);

end mul;