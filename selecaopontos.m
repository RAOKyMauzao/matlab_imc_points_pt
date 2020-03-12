%AM2: At01ParticipaçãoDistância -selecionar pontos de um gráfico
%12/3/2020

%Renato Craveiro - 2018011392 - Licenciatura em Engenharia Informática

clc; %limpa a command window
clear; %limpa possíveis variáveis guardadas anteriormente

while(1) %enquanto o utilizador não colocar os dados pretendidos da forma pretendida repete este processo
   prompt={'Inserir função de x para selecionar pontos: '};
   %prepara o texto a aparecer no input dialog (uma janela gráfica) e onde
   %o utilizador coloca os dados
   titulo='Insira uma função'; 
   %O título da input dialog
   resposta=inputdlg(prompt,titulo);
   %O que for introduzido vai ser guardado na variável resposta
   if isempty(resposta)
        return; %caso o utilizador clique em cancelar, sai do programa
   end
   try
      f=@(x) eval(vectorize(resposta{1})); %vetoriza a função que foi introduzida pelo utilizador e coloca-a em f
      x = 0:0.01:100; %limita o gráfico de 0 a 100 com passos de 0.01
      figure(1); %cria uma nova figura para colocar o gráfico
      plot(f(x)); %apresenta o gráfico da função f
      [x_coord, y_coord] = ginput(2); %obtém as coordenadas através do input do utilizador
      break; %correu tudo bem então sai do ciclo while
   catch erro;
       errordlg("Não foi possível calcular com a função pretendida. Tente novamente.");
       %caso exista algum erro, abre uma janela de erro a indicar o mesmo
       %ao utilizador, que terá que introduzir os dados novamente
   end    
end

msgbox(["As coordenadas do ponto que foram indicadas pelo utilizador são", newline,"x:", x_coord(1),"y:",y_coord(1)],...
    "Coordenadas obtidas");
    %no final apresenta as coordenadas assinaladas, apresentando assim o
    %ponto indicado pelo user
