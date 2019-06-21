program xadrez;
var
Tabuleiro: array[1..8, 1..8] of string;
TabuleiroCores: array[1..8, 1..8] of string;
i, j, l1, c1, l2, c2, loop, cont : integer;
peca1, peca2 : string;
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
  
  writeln('=======================================================');
  writeln('|                        Tabuleiro                    |');
  writeln('=======================================================');
  
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

//*********************************************VERIFICAR PECA INIMIGA******************************************
function pecaInimiga (var l1, c1, l2, c2: integer): boolean;
begin
	peca1 := copy(Tabuleiro[l1,c1], 2, 1);
	peca2 := copy(Tabuleiro[l2,c2], 2, 1);
 	if(((peca1 = '1') and (peca2 = '2')) or ((peca1 = '2') and (peca2 = '1')))then
	begin
		pecaInimiga := true;
	end;
end;

// ****************************************************CAVALO***************************************************
//logica para mover o cavalo
function moverCavalo(l1, c1, l2, c2 : integer): boolean;
begin
	moverCavalo := false;
	//mover para frente e direita
	if (((l1 + 2) = l2) and ((c1 - 1) = c2)) then
	begin
		if ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)) then
		begin
			moverCavalo := true;
		end;
	end;
	
	//mover para frente e esquerda
	if (((l1 + 2) = l2) and ((c1 + 1) = c2)) then
	begin
		if ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)) then
		begin
			moverCavalo := true;
		end;
	end;
	
	//mover para trás e esquerda
	if (((l1 - 2) = l2) and ((c1 + 1) = c2)) then
	begin
		if ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)) then
		begin
			moverCavalo := true;
		end;
	end;
	
	//mover para trás e direita
	if (((l1 - 2) = l2) and ((c1 - 1) = c2)) then
	begin
		if ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)) then
		begin
			moverCavalo := true;
		end;
	end;
	
	//mover para lado direito e frente
	if (((l1 + 1) = l2) and ((c1 - 2) = c2)) then
	begin
		if ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)) then
		begin
			moverCavalo := true;
		end;
	end;
	
	//mover para lado direito e trás
	if (((l1 - 1) = l2) and ((c1 - 2) = c2)) then
	begin
		if ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)) then
		begin
			moverCavalo := true;
		end;
	end;
	
	//mover para lado esquerdo e trás
	if (((l1 - 1) = l2) and ((c1 + 2) = c2)) then
	begin
		if ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)) then
		begin
			moverCavalo := true;
		end;
	end;
	
	//mover para lado esquerdo e frente
	if (((l1 + 1) = l2) and ((c1 + 2) = c2)) then
	begin
		if ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)) then
		begin
			moverCavalo := true;
		end;
	end;
end;

// ****************************************************PEÃO***************************************************
//logica para mover o peão
function moverPeao(l1, c1, l2, c2 : integer): boolean;
begin
	moverPeao := false;
	//mover para frente - primeiro movimento
	if ((l1 + 2 = l2 ) and (c1 = c2) and (l1 = 2)) then
	begin
		moverPeao := true;
	end;
	//mover para trás - primeiro movimento
	if ((l1 - 2 = l2 ) and (c1 = c2) and (l1 = 7)) then
	begin
		moverPeao := true;
	end;
	
	//mover para frente
	if ((Tabuleiro[l1,c1] = 'P1') and (l1 + 1 = l2) and (c1 = c2) and (Tabuleiro[l2,c2] = '**')) then
	begin
		moverPeao := true;
	end;
	//mover para tras
	if ((Tabuleiro[l1,c1] = 'P2') and (l1 - 1 = l2) and (c1 = c2) and (Tabuleiro[l2,c2] = '**')) then
	begin
		moverPeao := true;
	end;
	
	//mover para frente e direita capturar
	if ((l1 + 1 = l2) and ((c1 - 1) = c2) and (Tabuleiro[l1,c1] = 'P1') and pecaInimiga(l1,c1,l2,c2)) then
	begin
		moverPeao := true;
	end;
	//mover para frente e esqerda capturar
	if ((l1 + 1 = l2) and ((c1 + 1) = c2) and (Tabuleiro[l1,c1] = 'P1') and pecaInimiga(l1,c1,l2,c2)) then
	begin
		moverPeao := true;
	end;
	//mover para trás e direita capturar
	if ((l1 - 1 = l2) and ((c1 - 1) = c2) and (Tabuleiro[l1,c1] = 'P2') and pecaInimiga(l1,c1,l2,c2)) then
	begin
		moverPeao := true;
	end;
	//mover para trás e esqerda capturar
	if ((l1 - 1 = l2) and ((c1 + 1) = c2) and (Tabuleiro[l1,c1] = 'P2') and pecaInimiga(l1,c1,l2,c2)) then
	begin
		moverPeao := true;
	end;
end;
// ****************************************************REI***************************************************
//logica para mover o Rei
function moverRei(var l1, c1, l2, c2: integer): boolean;
begin
	moverRei := false;
	//mover para frente
	if(((l1 + 1) = l2) and (c1 = c2) and ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)))then
	begin
		moverRei := true;
	end;
	//mover para frente e direita
	if(((l1 + 1) = l2) and ((c1 - 1) = c2) and ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)))then
	begin
		moverRei := true;
	end;
	//mover para frente esquerda
	if(((l1 + 1) = l2) and ((c1 + 1) = c2) and ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)))then
	begin
		moverRei := true;
	end;
	//mover para trás
	if(((l1 - 1) = l2) and (c1 = c2) and ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)))then
	begin
		moverRei := true;
	end;
	//mover para trás e direita
	if(((l1 - 1) = l2) and ((c1 - 1) = c2) and ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)))then
	begin
		moverRei := true;
	end;
	//mover para trás e esquerda
	if(((l1 - 1) = l2) and ((c1 + 1) = c2) and ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)))then
	begin
		moverRei := true;
	end;
	//mover para lado esquerdo
	if((l1 = l2) and ((c1 + 1) = c2) and ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)))then
	begin
		moverRei := true;
	end;
	//mover para lado direito
	if(((l1 = l2) and ((c1 - 1) = c2)) and ((Tabuleiro[l2,c2] = '**') or pecaInimiga(l1,c1,l2,c2)))then
	begin
		moverRei := true;
	end;
end;


// ****************************************************TORRE***************************************************
//logica para mover torre
function moverTorre(var l1, c1, l2 , c2 : integer): boolean;
begin
  moverTorre := true;
  //mover na coluna pra frente
  if ((l1 < l2) and (c2 = c1)) then
  begin
    i := l1 + 1;
    j := c1;
    while(i <= l2)do
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
      i := i + 1;
    end;
    if(pecaInimiga(l1,c1,l2,c2)) then
    begin
    	moverTorre := true;
    end;
  end;
  
  //mover na coluna pra trás
  if ((l1 > l2) and (c1 = c2)) then
  begin
    i := l1 - 1;
    j := c1;
    while(i >= l2)do
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
    if(pecaInimiga(l1,c1,l2,c2)) then
    begin
    	moverTorre := true;
    end;
  end;
  
  //mover na linha para frente
  if ((l1 = l2) and (c2 > c1)) then
  begin
    i := l1;
    j := c1 + 1;
    while(j <= c2)do
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
      j := j + 1;
    end;
    if(pecaInimiga(l1,c1,l2,c2)) then
    begin
    	moverTorre := true;
    end;
  end;
  
  //mover na linha para trás
  if ((l1 = l2) and (c2 < c1)) then
  begin
    i := l1;
    j := c1 - 1;
    while(j >= c2)do
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
    if(pecaInimiga(l1,c1,l2,c2)) then
    begin
    	moverTorre := true;
    end;
  end;
  
end;

// ****************************************************BISPO***************************************************
//logica para mover o bispo
function moverBispo(var l1,c1, l2, c2 : integer; cor : string): boolean;
begin
  moverBispo := false;
  
	//bispo na cor branca
  if ((cor = 'B') and ((l2 + c2) mod 2 = 0)) then
  begin
    moverBispo := true;
    //se o bispo da casa B for para frente e direita
    if ((l2 > l1) and (c2 < c1)) then
    begin
      i := l1 + 1;
      j := c1 - 1;
      while ((i <= l2) and (j >= c2)) do
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
    	if(pecaInimiga(l1,c1,l2,c2)) then
	    begin
	    	moverBispo := true;
	    end;
		end;
    
    //se o bispo da casa B for para frente e esquerda
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
        
        if(((i + j) mod 2 = 0) and (Tabuleiro[i,j] <> '**'))then
        begin
          moverBispo := false;
          break;
        end;
        i := i + 1;
        j := j + 1;
      end;
    	if(pecaInimiga(l1,c1,l2,c2)) then
	    begin
	    	moverBispo := true;
	    end;
    end;
    
    //se o bispo da casa B for para trás e direita
    if ((l2 < l1) and (c2 < c1)) then
    begin
      i := l1 - 1;
      j := c1 - 1;
      while ((i >= l2) and (j >= c2)) do
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
    	if(pecaInimiga(l1,c1,l2,c2)) then
	    begin
	    	moverBispo := true;
	    end;
    end;
    
    
    //se o bispo da casa B for para trás e esquerda
    if ((l2 < l1) and (c2 > c1)) then
    begin
      i := l1 - 1;
      j := c1 + 1;
      while ((i >= l2) and (j <= c2)) do
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
    	if(pecaInimiga(l1,c1,l2,c2)) then
	    begin
	    	moverBispo := true;
	    end;
    end;
  end;
  
  //bispo na cor preta
  if ((cor = 'P') and ((l2 + c2) mod 2 = 1)) then
  begin
    moverBispo := true;
    //se o bispo da casa P for para frente e direita
    if ((l2 > l1) and (c2 < c1)) then
    begin
      i := l1 + 1;
      j := c1 - 1;
      while ((i <= l2) and (j >= c2)) do
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
      if(pecaInimiga(l1,c1,l2,c2)) then
	    begin
	    	moverBispo := true;
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
      if(pecaInimiga(l1,c1,l2,c2)) then
	    begin
	    	moverBispo := true;
	    end;
    end;
    
    //se o bispo da casa P for para trás e esquerda
    if ((l2 < l1) and (c2 > c1)) then
    begin
      i := l1 - 1;
      j := c1 + 1;
      while ((i >= l2) and (j <= c2)) do
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
      if(pecaInimiga(l1,c1,l2,c2)) then
	    begin
	    	moverBispo := true;
	    end;
    end;
    
    
    //se o bispo da casa P for para trás e direita
    if ((l2 < l1) and (c2 < c1)) then
    begin
      i := l1 - 1;
      j := c1 - 1;
      while ((i >= l2) and (j >= c2)) do
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
      if(pecaInimiga(l1,c1,l2,c2)) then
	    begin
	    	moverBispo := true;
	    end;
    end;
  end;
end;
//***************************************************RAINHA*******************************************
//logica mover a rainha
function moverRainha(l1,c1,l2,c2 : integer; cor: string): boolean;
begin
  if((l1 = l2) or (c1 = c2))then
  begin
  	moverRainha := moverTorre(l1,c1,l2,c2);
  end;
  if((l1 <> l2) and (c1 <> c2))then
  begin
  	moverRainha := moverBispo(l1,c1,l2,c2,cor);
  end;
end;

// ************************************************MOVER PEÇAS******************************************************
//mover as peças
function moverPeca(var l1,c1, l2, c2 : integer): boolean;
begin
  	if(Tabuleiro[l1,c1] <> '**')  then
 	begin
    
    //logica peão
	    if((Tabuleiro[l1,c1] = 'P1') or (Tabuleiro[l1,c1] = 'P2')) then
	    begin
	      if(moverPeao(l1, c1, l2, c2)) then
	      begin
	      	Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
	        Tabuleiro[l1,c1] := '**';
	        moverPeca := true;
	      end
	      else
	      begin
	      	writeln('Erro vc nao pode jogar aqui com o peao');
	      	moverPeca := false;
	      end;
	    end;
	    
	    //logica cavalo
	    if((Tabuleiro[l1,c1] = 'C1') or (Tabuleiro[l1,c1] = 'C2')) then
	    begin
	      if(moverCavalo(l1, c1, l2, c2)) then
	      begin
	        Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
	        Tabuleiro[l1,c1] := '**';
	        moverPeca := true;
	      end
	      else
	      begin
	     	 writeln('Erro vc nao pode jogar aqui com o cavalo');
	     	 moverPeca := false;
	     	end;
	    end;
	    
	    //logica torre
	    if((Tabuleiro[l1,c1] = 'T1') or (Tabuleiro[l1,c1] = 'T2')) then
	    begin
	      if(moverTorre(l1,c1,l2,c2)) then
	      begin
	        Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
	        Tabuleiro[l1,c1] := '**';
	        moverPeca := true;
	      end
	      else
	      begin
	      	writeln('Erro vc nao pode jogar aqui com a torre');
	      	moverPeca := false;
	      end;
	    end;
	    
	    //logica bispo
	    if((Tabuleiro[l1,c1] = 'B1') or (Tabuleiro[l1,c1] = 'B2')) then
	    begin
	      cor := TabuleiroCores[l1,c1];
	      if(moverBispo(l1,c1,l2,c2,cor)) then
	      begin
	        Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
	        Tabuleiro[l1,c1] := '**';
	        moverPeca := true;
	      end
	      else
	      begin
	      	writeln('Erro vc nao pode jogar aqui com o bispo');
	      	moverPeca := false;
	      end;
	    end;
	    
	    //logica rei
	    if((Tabuleiro[l1,c1] = 'R1') or (Tabuleiro[l1,c1] = 'R2')) then
	    begin
	      if(moverRei(l1,c1,l2,c2)) then
	      begin
	        Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
	        Tabuleiro[l1,c1] := '**';
	        moverPeca := true;
	      end
	      else
	      begin
	      	writeln('Erro vc nao pode jogar aqui com o Rei');
	      	moverPeca := false;
	      end;
	    end;
	    
	    //logica Rainha
	    if((Tabuleiro[l1,c1] = 'D1') or (Tabuleiro[l1,c1] = 'D2')) then
	    begin
	      cor := TabuleiroCores[l1,c1];
	      if(moverRainha(l1, c1, l2, c2, cor)) then
	      begin
	        Tabuleiro[l2,c2] := Tabuleiro[l1,c1];
	        Tabuleiro[l1,c1] := '**';
	        moverPeca := true;
	      end
	      else
	      begin
	       writeln('Erro vc nao pode jogar aqui com a Rainha');
	       moverPeca := false;
	      end;
	    end;
  
    end
    else
    begin
       writeln('Erro - não tem nenhuma peca nessa posicao ');
       moverPeca := false;
  	end;
  
end;

// *******************************************CONTROLAR JOGADORES***************************************************
//alternar jogadores
function jogar (var l1, c1, cont : integer): boolean;
begin
  jogar := false;
  if (Tabuleiro[l1,c1] = '**') then
  begin
 	jogar := false;
 	writeln('Nao existe peca nessa posicao');
 end	
 else if ((cont mod 2 = 1) and ((Tabuleiro[l1,c1] = 'P1') or (Tabuleiro[l1,c1] = 'T1') or (Tabuleiro[l1,c1] = 'C1') or (Tabuleiro[l1,c1] = 'R1') or (Tabuleiro[l1,c1] = 'D1') or (Tabuleiro[l1,c1] = 'B1')) ) then
  begin
    jogar := true;
    writeln('------------------------');
    writeln('Vez do jogador 2 jogar ');
    writeln('------------------------');
  end
  else if ((cont mod 2 = 0) and ((Tabuleiro[l1,c1] = 'P2') or (Tabuleiro[l1,c1] = 'T2') or (Tabuleiro[l1,c1] = 'C2') or (Tabuleiro[l1,c1] = 'R2') or (Tabuleiro[l1,c1] = 'D2') or (Tabuleiro[l1,c1] = 'B2')) ) then
  begin
    jogar := true;
    writeln('------------------------');
    writeln('Vez do jogador 1 jogar');
  	writeln('------------------------');
  end
  else
  begin 
  writeln('Vez do outro jogador jogar !!');
  jogar := false;
  end;
end;

function TelaInicial(): boolean;
	var 
	op :integer; 
	begin 
		writeln('=======================================================');
		writeln('|                   Vamos jogar xadrez ?              |');
		writeln('=======================================================');

		writeln('1 - Comecar');
		writeln('2 - Sair');
		readln(op);

		if(op = 1) then
			TelaInicial := true; 
		if(op = 2) then
			TelaInicial := false;	
	end;


//****************************************************PRINCIPAL******************************************************
begin
  loop := 1;
  cont := 1;
  

	if(TelaInicial())then
	 begin 
	 	InicializaTabuleiro();
  		showTabuleiro();	 	
		while( loop = 1) do
		begin
		  writeln('-----------------------------------------');
		  writeln('Digite a origem da peca vc quer mover');
		  readln(l1,c1);
		  writeln('Digite o destino da peca vc quer mover');
		  readln(l2,c2);
		  if ((l1 >= 1) and (l1 <= 8) and (c1 >= 1) and (c1 <= 8) and (l2 >= 1) and (l2 <= 8) and (c2 >=1) and (c2 <= 8)) then
		  begin
			  	
					if (jogar(l1,c1, cont)) then
			  		 if(moverPeca(l1,c1,l2,c2))then
				  			cont := cont + 1;
									
		  end
		  else
		  begin 
		   	writeln('Posicao invalida ');
		  end;
		  showTabuleiro();
		end;
	end;	
  // Falta tratar
  // 3-Tratar a questao de um jogador nÃ£o conseguir comer a prÃ³pria peca (melhor criar uma funÃ§Ã£o ai a gente chama na lÃ³gica de cada peÃ§a) (essencial)
  // 5-A dama so precisa tratar a questÃ£o de ela nÃ£o comer uma  peca do mesmo grupo dela que Ã©  a questao 3
  // 6- Tratar a questao quando tiver em xeque (detalhes finais)
  // 7- Mostrar as posiÃ§Ãµes onde o jogador pode jogar (detalhes finais)

   
End.