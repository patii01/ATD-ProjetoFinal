% Método definido para, recebendo frequência de amostragem,
% o conteúdo dos ficheiros activity_labels.txt e labels.txt,
% o sinal a repesentar e um array com [nºexperiência nªutilizador]
% por linha, representar graficamente o sinal segmentado em atividades
% escrevendo a que atividade se refere cada porção de espetro

function exercicio2(fs, activities, labels, data, exp_us)

    %Representa o tamanho do sinal em minutos
    time = (0:length(data)-1)./(60*fs); 
    figure(exp_us(1));
    for j=1:3
        if j ==1 
            eixo = "ACC_X";
        elseif j ==2
            eixo = "ACC_Y";
        else
            eixo = "ACC_Z";
        end
        
        subplot(3,1,j);
        axis([0 time(end) min(data(:,j)) max(data(:,j))])
        plot(time,data(:,j), 'k');
        hold on;
        for i = 1:length(labels)
            if labels(i,1) == exp_us(1) & labels(i,2) == exp_us(2)
                num_atividade = labels(i,3);
                janela = labels(i,4) : labels(i,5);
                plot(time(janela),data(janela,j));
                atividade_txt(data(:,j), num_atividade, i, activities, labels(i,4), time);
            end

        end
        xlabel('Time (min)')
        ylabel(eixo)
    end
end


%Método criado para escrever nos plots
function atividade_txt(data, num_atividade, it, activities, pos, time)
    x = time(pos);

    y_min = min(data);
    y_max = max(data);
    
    if mod(it, 2) == 0
        y = y_max + (0.25 * y_min);
    else
        y = y_min - (0.2 * y_min);
    end
    
    text(x, y, activities(num_atividade));
        
end

