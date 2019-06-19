program xadrez;
var
 Tabuleiro: array[1..8, 1..8] of string;
 TabuleiroCores: array[1..8, 1..8] of string;
 i, j, l1,c1,l2,c2,loop : integer;
 cor : string; 

procedure InicializaTabuleiro();
	begin

	for i := 1 to 8 do
		for j:= 1 to 8 do
			Tabuleiro[i,j] := '**';
	for i := 1 to 8 do
		for j:= 1 to 8 do
			if((i+j) mod 2 = 0) then
			begin
				TabuleiroCores[i,j] := 'B';
	    end
	    else
	    begin
	    	TabuleiroCores[i,j] := 'P';
	    end;
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
	          		write('   ',TabuleiroCores[i,j]);
	        	writeln(' ');
	    	end;
			
			for i:= 1 to 8 do
	  		begin
	       		for j:= 1 to 8 do
	          		write('   ',Tabuleiro[i,j]);
	        	writeln(' ');
	    	end;
	end;



//logica para mover torre
function moverTorre(var l1, c1, l2 , c2 : integer): boolean;
begin
	moverTorre := true;
	//mover na coluna pra frente
	if ((l1 = l2) and (c2 > c1)) then
	begin
		i := l1;
		j := c1 + 1;
		while(j <= c2)do
		begin
			if (((i < 1) or (i > 8)) or ((j < 1) or (j > 9))) then
			 	begin
			 		moverTorre := false;
			    break;
			  end;
			if(Tabuleiro[i,j] <> '**')then
			begin
				moverTorre := false;
				break;
			end;
			j := j + 1;
		end;
	end;
	
	//mover na coluna pra tr·s
	if ((l1 = l2) and (c1 > c2)) then
	begin
		i := l1;
		j := c1 - 1;
		while(j >= 1)do
		begin
			if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverTorre := false;
			    break;
			  end;
			if(Tabuleiro[i,j] <> '**')then
			begin
				moverTorre := false;
				break;
			end;
			j := j - 1;
		end;
	end;
	
	//mover na linha para frente
	if ((l1 < l2) and (c2 = c1)) then
	begin
		i := l1 + 1;
		j := c1;
		while(i <= l2)do
		begin
			if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverTorre := false;
			    break;
			  end;
			if(Tabuleiro[i,j] <> '**')then
			begin
				moverTorre := false;
				break;
			end;
			i := i + 1;
		end;
	end;
	
	//mover na linha para tr·s
	if ((l1 > l2) and (c2 = c1)) then
	begin
		i := l1 - 1;
		j := c1;
		while(i > 0)do
		begin
			if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverTorre := false;
			    break;
			  end;
			if(Tabuleiro[i,j] <> '**')then
			begin
				moverTorre := false;
				break;
			end;
			i := i - 1;
		end;
	end;
	
end;
//logica para mover o bispo
function moverBispo(var l1,c1, l2, c2 : integer; cor : string): boolean;
begin
	moverBispo := true;
	
	//bispo na cor branca
	if (cor = 'B') then
	begin
	  //se o bispo da casa B for para frente e direita
		if ((l2 > l1) and (c2 < c1)) then
		begin
		 	i := l1 + 1;
		 	j := c1 - 1;
			while ((i <= l2) and (j >= 1)) do
			begin
			  if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverBispo := false;
			    break;
			  end;
			  
				if(((i + j) mod 2 = 0) and (Tabuleiro[i,j] <> '**'))then
				begin
					moverBispo := false;
					break;
				end;
				i := i + 1;
				j := j - 1;
			end;
		end;
		
		//se o bispo da casa B for para frente e esquerda
		if ((l2 > l1) and (c2 > c1)) then
		begin
		 	i := l1 + 1;
		 	j := c1 + 1;
			while ((i <= l2) and (j >= 1)) do
			begin
			  if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverBispo := false;
			    break;
			  end;
				
				if(((i + j) mod 2 = 0) and (Tabuleiro[i,j] <> '**'))then
				begin
					moverBispo := false;
					break;
				end;
				i := i + 1;
				j := j + 1;
			end;
		end;
		
		//se o bispo da casa B for para tr·s e direita
		if ((l2 < l1) and (c2 < c1)) then
		begin
		 	i := l1 - 1;
		 	j := c1 - 1;
			while ((i >= 1) and (j >= 1)) do
			begin
			 	if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverBispo := false;
			    break;
			  end;
			     
				if(((i + j) mod 2 = 0) and (Tabuleiro[i,j] <> '**'))then
				begin
					moverBispo := false;
					break;
				end;
				i := i - 1;
				j := j - 1;
			end;
		end;
		
		
		//se o bispo da casa B for para tr·s e esquerda
		if ((l2 < l1) and (c2 > c1)) then
		begin
		 	i := l1 - 1;
		 	j := c1 + 1;
			while ((i >= 1) and (j <= 12)) do
			begin
			 	if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverBispo := false;
			    break;
			  end;
			     
				if(((i + j) mod 2 = 0) and (Tabuleiro[i,j] <> '**'))then
				begin
					moverBispo := false;
					break;
				end;
				i := i - 1;
				j := j + 1;
			end;
		end;
		
		
	end;
	
	//bispo na cor preta
	if (cor = 'P') then
	begin
		//se o bispo da casa P for para frente e direita
		if ((l2 > l1) and (c2 < c1)) then
		begin
		 	i := l1 + 1;
		 	j := c1 - 1;
			while ((i <= l2) and (j >= 1)) do
			begin
				if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverBispo := false;
			    break;
			  end;
			     
				if(((i + j) mod 2 = 1) and (Tabuleiro[i,j] <> '**'))then
				begin
					moverBispo := false;
					break;
				end;
				i := i + 1;
				j := j - 1;
			end;
		end;	
		//se o bispo da casa P for para frente e esquerda
		if ((l2 > l1) and (c2 > c1)) then
		begin
		 	i := l1 + 1;
		 	j := c1 + 1;
			while ((i <= l2) and (j <= c2)) do
			begin
				if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverBispo := false;
			    break;
			  end;
			     
				if(((i + j) mod 2 = 1) and (Tabuleiro[i,j] <> '**'))then
				begin
					moverBispo := false;
					break;
				end;
				i := i + 1;
				j := j + 1;
			end;
		end;
			
		//se o bispo da casa P for para tr·s e esquerda
		if ((l2 < l1) and (c2 > c1)) then
		begin
	 		i := l1 - 1;
	 		j := c1 + 1;
			while ((i >= 1) and (j <= c2)) do
			begin
				if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverBispo := false;
			    break;
			  end;
			     
				if(((i + j) mod 2 = 1) and (Tabuleiro[i,j] <> '**'))then
				begin
					moverBispo := false;
					break;
				end;
					i := i - 1;
					j := j + 1;
			end;
		end;
				
				
		//se o bispo da casa P for para tr·s e direita
		if ((l2 < l1) and (c2 < c1)) then
		begin
		 	i := l1 - 1;
		 	j := c1 - 1;
			while ((i >= 1) and (j >= 1)) do
			begin
				if (((i < 1) or (i > 8)) or ((j < 1) or (j > 8))) then
			 	begin
			 		moverBispo := false;
			    break;
			  end;
				     
				if(((i + j) mod 2 = 1) and (Tabuleiro[i,j] <> '**'))then
				begin
					moverBispo := false;
					break;
				end;
				i := i - 1;
				j := j - 1;
			end;
		end;	
			
	end;
		
			
end;





//mover as peÁas	
procedure moverPeca(var l1,c1, l2, c2 : integer);
	begin
		if((Tabuleiro[l1,c1] <> '**') and (l1 >= 1) and (l1 <= 8) and (c1 >= 1) and (c1 <= 8))  then
		begin
		
		 	//logica pe„o
			if((Tabuleiro[l1,c1] = 'P1') or (Tabuleiro[l1,c1] = 'P2')) then
			begin
				
				if ((l1 = 2) or (l1 = 7)) then
					begin
					 	if((l2 = (l1 + 2)) or (l2 = (l1 - 2)) and (c2 = c1)) then
						 begin
						 	Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
							Tabuleiro[l1,c1] := '**';
						 end;  
					end;
			 	
				 if(((l2 = (l1 + 1)) and (c2 = c1)) or (( l2 = (l1 +1) ) and (c2 = (c1 +1))) or ((c2 = (c1 - 1)) and (Tabuleiro[l2,c2] <> '**') ))then
					begin
						Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
						Tabuleiro[l1,c1] := '**';
					end
					else
						writeln('erro vc nao pode jogar aqui com o peao');
			end;
			
			//logica cavalo
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
			
			//logica torre
			if((Tabuleiro[l1,c1] = 'T1') or (Tabuleiro[l1,c1] = 'T2')) then
			begin
				if(moverTorre(l1,c1,l2,c2)) then
					begin
							Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
							Tabuleiro[l1,c1] := '**';
					end
					else
						writeln('erro vc nao pode jogar aqui com a torre');
			end;
			
		  //logica bispo
			if((Tabuleiro[l1,c1] = 'B1') or (Tabuleiro[l1,c1] = 'B2')) then
			begin
				cor := TabuleiroCores[l1,c1];
				if(moverBispo(l1,c1,l2,c2,cor)) then
				begin
					Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
					Tabuleiro[l1,c1] := '**';
				end
				else
						writeln('erro vc nao pode jogar aqui com o bispo');
			end;
			
			//logica Rainha
			if((Tabuleiro[l1,c1] = 'D1') or (Tabuleiro[l1,c1] = 'D2')) then
			begin
				cor := TabuleiroCores[l1,c1];
				if(true) then
				begin
					 Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
					 Tabuleiro[l1,c1] := '**';
				end;
			end;
			
			
		end 
		else 	
		begin
			writeln('Erro - n√£o tem nenhuma peca nessa posicao ');
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
// 1-N√£o permitir que o jogador jogue mais de uma vez de forma seguida (essencial)
// 2-Verificar se a posicao de origem e destino existe dentro da matriz (essencial)
// 3-Tratar a questao de um jogador n√£o conseguir comer a pr√≥pria peca (melhor criar uma fun√ß√£o ai a gente chama na l√≥gica de cada pe√ßa) (essencial)
// 4-L√≥gica do bispo (Bispo so come em diagonal tipo um X) (essencial)
// 5-A dama so precisa tratar a quest√£o de ela n√£o comer uma  peca do mesmo grupo dela que √©  a questao 3 
// 6- Tratar a questao quando tiver em xeque (detalhes finais)
// 7- Mostrar as posi√ß√µes onde o jogador pode jogar (detalhes finais)
End.