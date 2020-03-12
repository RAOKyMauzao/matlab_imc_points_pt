%AM2: At01ParticipaçãoDistância - Calcular o IMC
%12/3/2020

%Renato Craveiro - 2018011392 - Licenciatura em Engenharia Informática

clc; %limpa a command window
clear; %limpa possíveis variáveis guardadas anteriormente

while(1) %enquanto o utilizador não colocar os dados pretendidos da forma pretendida repete este processo
    prompt={'Introduza o seu peso (em kg):','Introduza a sua altura (em m):','Introduza o seu nome:'};
    %prepara o texto a aparecer no input dialog (uma janela gráfica) e onde
    %o utilizador coloca os dados
    titulo='Cálculo de IMC'; 
    %O título da input dialog
    resposta=inputdlg(prompt,titulo);
    %O que for introduzido vai ser guardado na variável resposta
    if isempty(resposta)
        return; %caso o utilizador clique em cancelar, sai do programa
    end 
    peso = str2num(resposta{1}); %transforma o que for introduzido na input dialog de string para número
    altura = str2num(resposta{2}); %transforma o que for introduzido na input dialog de string para número
    nome = resposta{3}; %O nome mantém-se a String
    imc = peso/altura^2; %fórmula do IMC

    if(isempty(peso) || isempty(altura)) %caso o utilizador não insira números, as variáveis peso e altura
        %estarão vazias, caso que não queremos. Ou seja será apresentada
        %uma mensagem de erro a informar do mesmo acontecimento
       errordlg("O peso e a altura têm que ser números reais.", "ERRO: VALORES NÃO NUMÉRICOS!");
    else
       break;  %caso contrário sai do ciclo while
    end    
end

if(imc<16.9) %a seguinte cadeia de if's e else's assinala em mcres o que o resultado do IMC pode significar
    mcres= 'IMC muito abaixo do peso';
else
    if(17<=imc && imc<18.4)
        mcres= 'IMC abaixo do peso';
    else
       if(18.4<=imc && imc<24.9)
         mcres= 'Peso normal';
       else
           if(24.9<=imc && imc<29.9)
            mcres= 'Acima do peso normal';
           else
              if(29.9<=imc && imc<34.9)
                 mcres= 'Obesidade nível I';
              else
                 if(34.9<=imc && imc<40)
                    mcres= 'Obesidade nível II';
                 else
                     if(imc>=40)
                        mcres= 'Obesidade nível III';
                     end
                     
                 end
              end
           end           
           
       end       
    end    
    
end


%junta todos os dados obtidos anteriormentes e junta-os numa string
%mensagem
mensagem = strcat(nome, ' o seu IMC é:  ', num2str(imc),' kg/m^2.  ',mcres);
%que apresenta numa msgbox
msgbox(mensagem,titulo);

