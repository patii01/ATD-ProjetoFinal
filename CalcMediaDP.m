% Método definido para recebendo o conteúdo do ficheiro labels.txt, um
% array com os sinais a analisar e s frequência de amostragem vai calcular
% a média e o desvio padrão do número médio de passos de cada atividade

function spm = CalcMediaDP(labels, array_data, fs)
    w_x = [];
    w_y = [];
    w_z = [];
    wd_x = [];
    wd_y = [];
    wd_z = [];
    wu_x = [];
    wu_y = [];
    wu_z = [];
    
    for k=1:length(array_data)
        for i = 1:length(labels)
            if labels(i, 1) == k & (k ==7 || k == 8)
                for j=1:3
                    janela = labels(i,4) : labels(i,5);

                    if labels(i,3) <= 3
                        spm = StepsPerMinute(array_data{k}(janela,j), fs);
                        if labels(i,3) == 1 & j == 1
                            w_x(end+1) = spm;
                        elseif labels(i,3) == 1 & j == 2
                            w_y(end+1) = spm;
                        elseif labels(i,3) == 1 & j == 3
                            w_z(end+1) = spm;
                        elseif labels(i,3) == 2 & j == 1
                            wd_x(end+1) = spm;
                        elseif labels(i,3) == 2 & j == 2
                            wd_y(end+1) = spm;
                        elseif labels(i,3) == 2 & j == 3
                            wd_z(end+1) = spm;
                        elseif labels(i,3) == 3 & j == 1
                            wu_x(end+1) = spm;
                        elseif labels(i,3) == 3 & j == 2
                            wu_y(end+1) = spm;
                        elseif labels(i,3) == 3 & j == 3
                            wu_z(end+1) = spm;
                        end  
                    end

                end
            end
        end
    end
    
    
    
    media_w_x = mean(w_x);
    disp(media_w_x);
    media_w_y = mean(w_y);
    disp(media_w_y);
    media_w_z = mean(w_z);
    disp(media_w_z);
    media_wd_x = mean(wd_x);
    disp(media_wd_x);
    media_wd_y = mean(wd_y);
    disp(media_wd_y);
    media_wd_z = mean(wd_z);
    disp(media_wd_z);
    media_wu_x = mean(wu_x);
    disp(media_wu_x);
    media_wu_y = mean(wu_y);
    disp(media_wu_y);
    media_wu_z = mean(wu_z);
    disp(media_wu_z);
    dp_w_x = std(w_x);
    disp(dp_w_x);
    dp_w_y = std(w_y);
    disp(dp_w_y);
    dp_w_z = std(w_z);
    disp(dp_w_z);
    dp_wd_x = std(wd_x);
    disp(dp_wd_x);
    dp_wd_y = std(wd_y);
    disp(dp_wd_y);
    dp_wd_z = std(wd_z);
    disp(dp_wd_z);
    dp_wu_x = std(wu_x);
    disp(dp_wu_x);
    dp_wu_y = std(wu_y);
    disp(dp_wu_y);
    dp_wu_z = std(wu_z);
    disp(dp_wu_z);
     
end