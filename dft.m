% Método definido para, recebendo um array com [nºexperiência nªutilizador] por linha,
% a frequência de amostragem, o conteúdo dos ficheiros activity_labels.txt e labels.txt,
% o sinal a repesentar, o tipo de janela que se quer implementar e o número de atividade
% que se quer analisar (0 significa que se quer ver todas as atividades),
% vai calcular a DFT do sinal aplicando a janela passada como parâmetro

function dft(exp_us, fs, data, labels, window, activity_lbl, num_atividade)

    time = (0:length(data)-1)./(60*fs);

    for i = 1:length(labels)
        if labels(i, 1) == exp_us(1) & labels(i,3) == num_atividade || num_atividade == 0
            figure()
            for j=1:3
                
                if j ==1 
                    eixo = "ACC_X";
                elseif j ==2
                    eixo = "ACC_Y";
                else
                    eixo = "ACC_Z";
                end
                
                janela = labels(i,4) : labels(i,5);

                N = numel(janela);
                
                detrended = detrend(data(janela,j));

                % calcular o vetor de frequências
                if (mod(N,2)==0)
                    % se o número de pontos do sinal for par
                    f = -fs/2:fs/N:fs/2-fs/N;
                else
                    % se o número de pontos do sinal for ímpar
                    f = -fs/2+fs/(2*N):fs/N:fs/2-fs/(2*N);
                end

                if(window =="retangular")
                    janelaRetangular = rectwin(length(f));
                    novo_sinal = detrend(data(janela,j)).*janelaRetangular;

                elseif(window =="hamming")
                    janelaHamming = hamming(length(f)); % janela hamming
                    novo_sinal = detrend(data(janela,j)).*janelaHamming;

                elseif(window =="blackman")
                    janelaBlackman = blackman(length(f)); % janela blackman
                    novo_sinal = detrend(data(janela,j)).*janelaBlackman;

                else (window =="gaussiana")
                    janelaGaussiana = gausswin(length(f)); % janela gaussiana
                    novo_sinal = detrend(data(janela,j)).*janelaGaussiana;   
                end

                dftNovo_sinal = abs(fftshift(fft(novo_sinal)));
                subplot(3,1,j);
                plot(f, dftNovo_sinal);
                axis tight
                xlabel('f [Hz]')
                ylabel('Magnitude = |X|')
                Nome_sub = strcat('DFT da experiencia: ', num2str(labels(i,1)), ' - utilizador: ', num2str(labels(i,2)), ' - atividade: ', activity_lbl(labels(i,3)), ' - janela: ', window, ' - eixo: ', eixo);
                title(Nome_sub)
            end
            subplot(3,1,1);
        end
    end
    
     
end







