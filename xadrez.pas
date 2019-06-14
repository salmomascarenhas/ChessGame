program xadrez;
var
 Tabuleiro: array[1..8, 1..8] of string;
 i, j, l1,c1,l2,c2,loop : integer;

procedure InicializaTabuleiro();
	begin

	for i := 1 to 8 do
		for j:= 1 to 8 do
			Tabuleiro[i,j] := '**';
	
	Tabuleiro[1,1] := 'T1';
	Tabuleiro[1,2] := 'C1';
	Tabuleiro[1,3] := 'B1';
	Tabuleiro[1,4] := 'D1';
	Tabuleiro[1,5] := 'R1';
	Tabuleiro[1,6] := 'B1';
	Tabuleiro[1,7] := 'C1';
	Tabuleiro[1,8] := 'T1';

	Tabuleiro[2,1] := 'P1';
	Tabuleiro[2,2] := 'P1';
	Tabuleiro[2,3] := 'P1';
	Tabuleiro[2,4] := 'P1';
	Tabuleiro[2,5] := 'P1';
	Tabuleiro[2,6] := 'P1';
	Tabuleiro[2,7] := 'P1';
	Tabuleiro[2,8] := 'P1'; 

	Tabuleiro[8,1] := 'T2';
	Tabuleiro[8,2] := 'C2';
	Tabuleiro[8,3] := 'B2';
	Tabuleiro[8,4] := 'D2';
	Tabuleiro[8,5] := 'R2';
	Tabuleiro[8,6] := 'B2';
	Tabuleiro[8,7] := 'C2';
	Tabuleiro[8,8] := 'T2';

	Tabuleiro[7,1] := 'P2';
	Tabuleiro[7,2] := 'P2';
	Tabuleiro[7,3] := 'P2';
	Tabuleiro[7,4] := 'P2';
	Tabuleiro[7,5] := 'P2';
	Tabuleiro[7,6] := 'P2';
	Tabuleiro[7,7] := 'P2';
	Tabuleiro[7,8] := 'P2';
	
	end;	

	procedure showTabuleiro();
	begin
		
		writeln('==========================================');
		writeln('       	  Tabuleiro          		   ');
		writeln('==========================================');	 
				
	  	for i:= 1 to 8 do
	  		begin
	       		for j:= 1 to 8 do
	          		write('   ',Tabuleiro[i,j]);
	        	writeln(' ');
	    	end;
	end;
	
	 procedure moverPeca(var l1,c1, l2, c2 : integer);
	

	begin
		if(Tabuleiro[l1,c1] <> '**')  then
		begin
			if((Tabuleiro[l1,c1] = 'P1') or (Tabuleiro[l1,c1] = 'P2')) then

			begin
			 	if(  ((l2 = (l1 +1)) and (c2 = c1)) or (( l2 = (l1 +1) ) and ((c2 = (c1 +1)) or (c2 = (c1 - 1) )) and (Tabuleiro[l2,c2] <> '*') ) )then
					begin //falta inserir a parte de verificar se tem uma peca do proprio jogador na frente da torre
					
					Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
					Tabuleiro[l1,c1] := '**';
					end
					else
						writeln('erro vc nao pode jogar aqui com o peao');
			end;
			if((Tabuleiro[l1,c1] = 'C1') or (Tabuleiro[l1,c1] = 'C2')) then
			begin
				if(((l2 = l1 + 2) and ((c2 = c1 + 1) or (c2 = c1 -1) )) or  ((l2 = l1 - 2) and ((c2 = c1 + 1) or (c2 = c1 -1) ))  ) then
				begin
					Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
					Tabuleiro[l1,c1] := '**';
				end				
				else
					writeln('erro vc nao pode jogar aqui com o cavalo');
			end;
			if((Tabuleiro[l1,c1] = 'T1') or (Tabuleiro[l1,c1] = 'T2')) then
			begin//falta inserir a parte de verificar se tem uma peca do proprio jogador na frente da torre
				if((l1 = l2)  or (c1 = c2)) then
					begin
					Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
					Tabuleiro[l1,c1] := '**';
					end
					else
						writeln('erro vc nao pode jogar aqui com a torre');
			end;
			
		end 
		else 	
		begin
			writeln('Erro - não tem nenhuma peca nessa posicao ');
		end;				

	end;
begin
	//Obs Falta tratar o caso em
loop := 1;
InicializaTabuleiro();
showTabuleiro();
while( loop = 1) do
begin
writeln('-----------------------------------------');
writeln('Digite a origem da peca vc quer mover');
readln(l1,c1);
writeln('Digite o destino da peca vc quer mover');
readln(l2,c2);
moverPeca(l1,c1,l2,c2);
	

showTabuleiro();
end;
							// Falta tratar
// 1-Não permitir que o jogador jogue mais de uma vez de forma seguida (essencial)
// 2-Verificar se a posicao de origem e destino existe dentro da matriz (essencial)
// 3-Tratar a questao de um jogador não conseguir comer a própria peca (melhor criar uma função ai a gente chama na lógica de cada peça) (essencial)
// 4-Lógica do bispo (Bispo so come em diagonal tipo um X) (essencial)
// 5-A dama so precisa tratar a questão de ela não comer uma  peca do mesmo grupo dela que é  a questao 3 
// 6- Tratar a questao quando tiver em xeque (detalhes finais)
// 7- Mostrar as posições onde o jogador pode jogar (detalhes finais)
End.