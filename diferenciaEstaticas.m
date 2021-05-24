% Método criado para, recebendo a frequência de amostragem, array com os 
% sinais a analisar e o conteúdo do ficheiro labels.txt, calcular a média 
% das componentes frequência e amplitude de cada atividade e de seguida 
% representar graficamente
% Para escolher as experiências basta descomentar as linhas 86 e 254 


function diferenciaEstaticas(fs, array_dados, labels) 

    AwX = [];
    AwdX = [];
    AwuX = [];
    AsitX = [];
    AlayX = [];
    AstandX = [];
    Ast_t_siX = [];
    Asi_t_stX = [];
    Asi_to_lieX = [];
    Alie_to_siX = [];
    Ast_t_lieX = [];
    Alie_t_stX = [];
    AwY = [];
    AwdY = [];
    AwuY = [];
    AsitY = [];
    AlayY = [];
    AstandY = [];
    Ast_t_siY = [];
    Asi_t_stY = [];
    Asi_to_lieY = [];
    Alie_to_siY = [];
    Ast_t_lieY = [];
    Alie_t_stY = [];
    AwZ = [];
    AwdZ = [];
    AwuZ = [];
    AsitZ = [];
    AlayZ = [];
    AstandZ = [];
    Ast_t_siZ = [];
    Asi_t_stZ = [];
    Asi_to_lieZ = [];
    Alie_to_siZ = [];
    Ast_t_lieZ = [];
    Alie_t_stZ = [];
    FwX = [];
    FwdX = [];
    FwuX = [];
    FsitX = [];
    FlayX = [];
    FstandX = [];
    Fst_t_siX = [];
    Fsi_t_stX = [];
    Fsi_to_lieX = [];
    Flie_to_siX = [];
    Fst_t_lieX = [];
    Flie_t_stX = [];
    FwY = [];
    FwdY = [];
    FwuY = [];
    FsitY = [];
    FlayY = [];
    FstandY = [];
    Fst_t_siY = [];
    Fsi_t_stY = [];
    Fsi_to_lieY = [];
    Flie_to_siY = [];
    Fst_t_lieY = [];
    Flie_t_stY = [];
    FwZ = [];
    FwdZ = [];
    FwuZ = [];
    FsitZ = [];
    FlayZ = [];
    FstandZ = [];
    Fst_t_siZ = [];
    Fsi_t_stZ = [];
    Fsi_to_lieZ = [];
    Flie_to_siZ = [];
    Fst_t_lieZ = [];
    Flie_t_stZ = [];
    
     
    for k=1:length(array_dados)
        
        %if k == 1 || k == 2
        
            for i = 1:length(labels)
                if labels(i, 1) == k
                    janela = labels(i,4) : labels(i,5);

                    for j = 1:3

                        if j ==1 
                            eixo = "ACC_X";
                        elseif j ==2
                            eixo = "ACC_Y";
                        else
                            eixo = "ACC_Z";
                        end

                        detrended = detrend(array_dados{k}(janela,j));
                        dft = abs(fftshift(fft(detrended))); % DFT

                        N = numel(array_dados{k}(janela,j));
                        Omega0 = (2*pi)/N;
                        
                        % calcular o vetor de frequências
                        if (mod(N,2)==0)
                            % se o número de pontos do sinal for par
                            f = -fs/2:fs/N:fs/2-fs/N;
                        else
                            % se o número de pontos do sinal for ímpar
                            f = -fs/2+fs/(2*N):fs/N:fs/2-fs/(2*N);
                        end
                        
                        if (mod(N,2)==0)
                            Omega = -Omega0*N/2:Omega0:Omega0*N/2-Omega0; % em rad
                        else
                            Omega = -Omega0*N/2+Omega0/2:Omega0:Omega0*N/2-Omega0/2;
                        end

                        maximo=max(dft);
                        
                        locs=find(dft>0.8*maximo);
                        f_relev = f(locs);
                        freq = f_relev(f_relev>0);
                        
                        cs = dft(dft > 0.8*maximo);
                        cs = cs ./  N;
                        
                        ms = Omega(locs);
                        
                        cd0s = find(ms > 0);
                         
                        cs(cd0s) = 2 .* cs(cd0s);

                        c = cs;

                        if labels(i,3) == 1 & j == 1
                            AwX = [AwX c'];
                            FwX = [FwX freq];
                        elseif labels(i,3) == 2 & j == 1
                            AwuX = [AwuX c'];
                            FwuX = [FwuX freq];
                        elseif labels(i,3) == 3 & j == 1
                            AwdX = [AwdX c'];
                            FwdX = [FwdX freq];
                        elseif labels(i,3) == 4 & j == 1
                            AsitX = [AsitX c'];
                            FsitX = [FsitX freq];
                        elseif labels(i,3) == 5 & j == 1
                            AstandX = [AstandX c'];
                            FstandX = [FstandX freq];
                        elseif labels(i,3) == 6 & j == 1
                            AlayX = [AlayX c'];
                            FlayX = [FlayX freq];
                        elseif labels(i,3) == 7 & j == 1
                            Ast_t_siX = [Ast_t_siX c'];
                            Fst_t_siX = [Fst_t_siX freq];
                        elseif labels(i,3) == 8 & j == 1
                            Asi_t_stX = [Asi_t_stX c'];
                            Fsi_t_stX = [Fsi_t_stX freq];
                        elseif labels(i,3) == 9 & j == 1
                            Asi_to_lieX = [Asi_to_lieX c'];
                            Fsi_to_lieX = [Fsi_to_lieX freq];
                        elseif labels(i,3) == 10 & j == 1
                            Alie_to_siX = [Alie_to_siX c'];
                            Flie_to_siX = [Flie_to_siX freq];
                        elseif labels(i,3) == 11 & j == 1
                            Ast_t_lieX = [Ast_t_lieX c'];
                            Fst_t_lieX = [Fst_t_lieX freq];
                        elseif labels(i,3) == 12 & j == 1
                            Alie_t_stX = [Alie_t_stX c'];
                            Flie_t_stX = [Flie_t_stX freq];
                        elseif labels(i,3) == 1 & j == 2
                            AwY = [AwY c'];
                            FwY = [FwY freq];
                        elseif labels(i,3) == 2 & j == 2
                            AwuY = [AwuY c'];
                            FwuY = [FwuY freq];
                        elseif labels(i,3) == 3 & j == 2
                            AwdY = [AwdY c'];
                            FwdY = [FwdY freq];
                        elseif labels(i,3) == 4 & j == 2
                            AsitY = [AsitY c'];
                            FsitY = [FsitY freq];
                        elseif labels(i,3) == 5 & j == 2
                            AstandY = [AstandY c'];
                            FstandY = [FstandY freq];
                        elseif labels(i,3) == 6 & j == 2
                            AlayY = [AlayY c'];
                            FlayY = [FlayY freq];
                        elseif labels(i,3) == 7 & j == 2
                            Ast_t_siY = [Ast_t_siY c'];
                            Fst_t_siY = [Fst_t_siY freq];
                        elseif labels(i,3) == 8 & j == 2
                            Asi_t_stY = [Asi_t_stY c'];
                            Fsi_t_stY = [Fsi_t_stY freq];
                        elseif labels(i,3) == 9 & j == 2
                            Asi_to_lieY = [Asi_to_lieY c'];
                            Fsi_to_lieY = [Fsi_to_lieY freq];
                        elseif labels(i,3) == 10 & j == 2
                            Alie_to_siY = [Alie_to_siY c'];
                            Flie_to_siY = [Flie_to_siY freq];
                        elseif labels(i,3) == 11 & j == 2
                            Ast_t_lieY = [Ast_t_lieY c'];
                            Fst_t_lieY = [Fst_t_lieY freq];
                        elseif labels(i,3) == 12 & j == 2
                            Alie_t_stY = [Alie_t_stY c'];
                            Flie_t_stY = [Flie_t_stY freq];
                        elseif labels(i,3) == 1 & j == 3
                            AwZ = [AwZ c'];
                            FwZ = [FwZ freq];
                        elseif labels(i,3) == 2 & j == 3
                            AwuZ = [AwuZ c'];
                            FwuZ = [FwuZ freq];
                        elseif labels(i,3) == 3 & j == 3
                            AwdZ = [AwdZ c'];
                            FwdZ = [FwdZ freq];
                        elseif labels(i,3) == 4 & j == 3
                            AsitZ = [AsitZ c'];
                            FsitZ = [FsitZ freq];
                        elseif labels(i,3) == 5 & j == 3
                            AstandZ = [AstandZ c'];
                            FstandZ = [FstandZ freq];
                        elseif labels(i,3) == 6 & j == 3
                            AlayZ = [AlayZ c'];
                            FlayZ = [FlayZ freq];
                        elseif labels(i,3) == 7 & j == 3
                            Ast_t_siZ = [Ast_t_siZ c'];
                            Fst_t_siZ = [Fst_t_siZ freq];
                        elseif labels(i,3) == 8 & j == 3
                            Asi_t_stZ = [Asi_t_stZ c'];
                            Fsi_t_stZ = [Fsi_t_stZ freq];
                        elseif labels(i,3) == 9 & j == 3
                            Asi_to_lieZ = [Asi_to_lieZ c'];
                            Fsi_to_lieZ = [Fsi_to_lieZ freq];
                        elseif labels(i,3) == 10 & j == 3
                            Alie_to_siZ = [Alie_to_siZ c'];
                            Flie_to_siZ = [Flie_to_siZ freq];
                        elseif labels(i,3) == 11 & j == 3
                            Ast_t_lieZ = [Ast_t_lieZ c'];
                            Fst_t_lieZ = [Fst_t_lieZ freq];
                        elseif labels(i,3) == 12 & j == 3
                            Alie_t_stZ = [Alie_t_stZ c'];
                            Flie_t_stZ = [Flie_t_stZ freq];
                        end

                    end
                end
               
            end
        %end
    end
    
    Aw = {AwX; AwY; AwZ};
    Awu = {AwuX; AwuY; AwuZ};
    Awd = {AwdX; AwdY; AwdZ};
    Asit = {AsitX; AsitY; AsitZ};
    Alay = {AlayX; AlayY; AlayZ};
    Astand = {AstandX; AstandY; AstandZ};
    Ast_t_si = {Ast_t_siX; Ast_t_siY; Ast_t_siZ};
    Asi_t_st = {Asi_t_stX; Asi_t_stY; Asi_t_stZ};
    Asi_to_lie = {Asi_to_lieX; Asi_to_lieY; Asi_to_lieZ};
    Alie_to_si = {Alie_to_siX; Alie_to_siY; Alie_to_siZ};
    Ast_t_lie = {Ast_t_lieX; Ast_t_lieY; Ast_t_lieZ};
    Alie_t_st = {Alie_t_stX; Alie_t_stY; Alie_t_stZ};
    
    Fw = {FwX; FwY; FwZ};
    Fwu = {FwuX; FwuY; FwuZ};
    Fwd = {FwdX; FwdY; FwdZ};
    Fsit = {FsitX; FsitY; FsitZ};
    Flay = {FlayX; FlayY; FlayZ};
    Fstand = {FstandX; FstandY; FstandZ};
    Fst_t_si = {Fst_t_siX; Fst_t_siY; Fst_t_siZ};
    Fsi_t_st = {Fsi_t_stX; Fsi_t_stY; Fsi_t_stZ};
    Fsi_to_lie = {Fsi_to_lieX; Fsi_to_lieY; Fsi_to_lieZ};
    Flie_to_si = {Flie_to_siX; Flie_to_siY; Flie_to_siZ};
    Fst_t_lie = {Fst_t_lieX; Fst_t_lieY; Fst_t_lieZ};
    Flie_t_st = {Flie_t_stX; Flie_t_stY; Flie_t_stZ};
    
    disp(mean(Fw{1}(:,:)));
    disp(mean(Fw{2}(:,:)));
    disp(mean(Fw{3}(:,:)));
    disp(mean(Fwu{1}(:,:)));
    disp(mean(Fwu{2}(:,:)));
    disp(mean(Fwu{3}(:,:)));
    disp(mean(Fwd{1}(:,:)));
    disp(mean(Fwd{2}(:,:)));
    disp(mean(Fwd{3}(:,:)));
    disp(mean(Fsit{1}(:,:)));
    disp(mean(Fsit{2}(:,:)));
    disp(mean(Fsit{3}(:,:)));
    disp(mean(Flay{1}(:,:)));
    disp(mean(Flay{2}(:,:)));
    disp(mean(Flay{3}(:,:)));
    disp(mean(Fstand{1}(:,:)));
    disp(mean(Fstand{2}(:,:)));
    disp(mean(Fstand{3}(:,:)));
    disp(mean(Fst_t_si{1}(:,:)));
    disp(mean(Fst_t_si{2}(:,:)));
    disp(mean(Fst_t_si{3}(:,:)));
    disp(mean(Fsi_t_st{1}(:,:)));
    disp(mean(Fsi_t_st{2}(:,:)));
    disp(mean(Fsi_t_st{3}(:,:)));
    disp(mean(Fsi_to_lie{1}(:,:)));
    disp(mean(Fsi_to_lie{2}(:,:)));
    disp(mean(Fsi_to_lie{3}(:,:)));
    disp(mean(Flie_to_si{1}(:,:)));
    disp(mean(Flie_to_si{2}(:,:)));
    disp(mean(Flie_to_si{3}(:,:)));
    disp(mean(Fst_t_lie{1}(:,:)));
    disp(mean(Fst_t_lie{2}(:,:)));
    disp(mean(Fst_t_lie{3}(:,:)));
    disp(mean(Flie_t_st{1}(:,:)));
    disp(mean(Flie_t_st{2}(:,:)));
    disp(mean(Flie_t_st{3}(:,:)));
   
 
    figure(1);
    
    for i=1:3
        if i == 1
            eixo = 'ACC_X';
        elseif i == 2
            eixo = 'ACC_Y';
        else
            eixo = 'ACC_Z';
        end
        
        subplot(3,1,i)
        hold on;
        grid on;
        
        l1 = plot(1, mean(Aw{i}(:,:)), 'o ', 'Color', [1, 0, 0], 'DisplayName', 'WALKING');
        l2 = plot(2, mean(Awu{i}(:,:)), 'o ', 'Color', [0, 1, 0], 'DisplayName', 'WALKING_UPSTAIRS');
        l3 = plot(3, mean(Awd{i}(:,:)), 'o ', 'Color', [0, 0, 1], 'DisplayName', 'WALKING_DOWNSTAIRS');
        l4 = plot(4, mean(Asit{i}(:,:)), '+', 'Color', [1, 1, 0], 'DisplayName', 'SITTING');
        l5 = plot(5, mean(Alay{i}(:,:)), '+', 'Color', [1, 0, 1], 'DisplayName', 'STANDING');
        l6 = plot(6, mean(Astand{i}(:,:)), '+', 'Color', [0, 1, 1], 'DisplayName', 'LAYING');
        l7 = plot(7, mean(Ast_t_si{i}(:,:)), '*', 'Color', [0, 0, 0], 'DisplayName', 'STAND_TO_SIT');
        l8 = plot(8, mean(Asi_t_st{i}(:,:)), '*', 'Color', [0.522, 1, 0.839], 'DisplayName', 'SIT_TO_STAND');
        l9 = plot(9, mean(Asi_to_lie{i}(:,:)), '*', 'Color', [0.734, 0.510, 0.741], 'DisplayName', 'SIT_TO_LIE');
        l10 = plot(10, mean(Alie_to_si{i}(:,:)), '*', 'Color', [0.910, 0.6, 0.063], 'DisplayName', 'LIE_TO_SIT');
        l11 = plot(11, mean(Ast_t_lie{i}(:,:)), '*', 'Color', [0.710, 0.475, 0.518], 'DisplayName', 'STAND_TO_LIE');
        l12 = plot(12, mean(Alie_t_st{i}(:,:)), '*', 'Color', [0.486, 0.639, 0.565], 'DisplayName', 'LIE_TO_STAND');
        
        xlabel('Número da atividade');
        ylabel(eixo);
    end
    
    legenda = [l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12];
    legend(legenda);
    
    subplot(3,1,1);
    title('Média das amplitudes mais relevantes de cada atividade');
    
    figure(2);
    
    for i=1:3
        if i == 1
            eixo = 'ACC_X';
        elseif i == 2
            eixo = 'ACC_Y';
        else
            eixo = 'ACC_Z';
        end
        
        subplot(3,1,i)
        hold on;
        grid on;

        
        l1 = plot(1, mean(Fw{i}(:,:)), 'o ', 'Color', [1, 0, 0], 'DisplayName', 'WALKING');
        l2 = plot(2, mean(Fwu{i}(:,:)), 'o ', 'Color', [0, 1, 0], 'DisplayName', 'WALKING_UPSTAIRS');
        l3 = plot(3, mean(Fwd{i}(:,:)), 'o ', 'Color', [0, 0, 1], 'DisplayName', 'WALKING_DOWNSTAIRS');
        l4 = plot(4, mean(Fsit{i}(:,:)), '+', 'Color', [1, 1, 0], 'DisplayName', 'SITTING');
        l5 = plot(5, mean(Flay{i}(:,:)), '+', 'Color', [1, 0, 1], 'DisplayName', 'STANDING');
        l6 = plot(6, mean(Fstand{i}(:,:)), '+', 'Color', [0, 1, 1], 'DisplayName', 'LAYING');
        l7 = plot(7, mean(Fst_t_si{i}(:,:)), '*', 'Color', [0, 0, 0], 'DisplayName', 'STAND_TO_SIT');
        l8 = plot(8, mean(Fsi_t_st{i}(:,:)), '*', 'Color', [0.522, 1, 0.839], 'DisplayName', 'SIT_TO_STAND');
        l9 = plot(9, mean(Fsi_to_lie{i}(:,:)), '*', 'Color', [0.734, 0.510, 0.741], 'DisplayName', 'SIT_TO_LIE');
        l10 = plot(10, mean(Flie_to_si{i}(:,:)), '*', 'Color', [0.910, 0.6, 0.063], 'DisplayName', 'LIE_TO_SIT');
        l11 = plot(11, mean(Fst_t_lie{i}(:,:)), '*', 'Color', [0.710, 0.475, 0.518], 'DisplayName', 'STAND_TO_LIE');
        l12 = plot(12, mean(Flie_t_st{i}(:,:)), '*', 'Color', [0.486, 0.639, 0.565], 'DisplayName', 'LIE_TO_STAND');
        
        xlabel('Número da atividade');
        ylabel(eixo);
    end
    
    legenda = [l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12];
    legend(legenda);
    
    subplot(3,1,1);
    title('Média das frequências mais relevantes de cada atividade');   
    
    figure(3);
    
    for i=1:3
        if i == 1
            eixo = 'ACC_X';
        elseif i == 2
            eixo = 'ACC_Y';
        else
            eixo = 'ACC_Z';
        end
        
        subplot(3,1,i)
        hold on;
        grid on;
    
        l1 = plot(1, mean(Fw{i}(:,:)), 'o ', 'Color', [1, 0, 0], 'DisplayName', 'WALKING');
        l2 = plot(2, mean(Fwu{i}(:,:)), 'o ', 'Color', [0, 1, 0], 'DisplayName', 'WALKING_UPSTAIRS');
        l3 = plot(3, mean(Fwd{i}(:,:)), 'o ', 'Color', [0, 0, 1], 'DisplayName', 'WALKING_DOWNSTAIRS');

        xlabel('Número da atividade');
        ylabel(eixo);
    end
    
    legenda = [l1,l2,l3];
    legend(legenda);
    
    subplot(3,1,1);
    title('Média das frequências mais relevantes de cada atividade dinâmica'); 
    
    figure(4);
    
    for i=1:3
        if i == 1
            eixo = 'ACC_X';
        elseif i == 2
            eixo = 'ACC_Y';
        else
            eixo = 'ACC_Z';
        end
        
        subplot(3,1,i)
        hold on;
        grid on;
    
        l4 = plot(4, mean(Fsit{i}(:,:)), '+', 'Color', [1, 1, 0], 'DisplayName', 'SITTING');
        l5 = plot(5, mean(Flay{i}(:,:)), '+', 'Color', [1, 0, 1], 'DisplayName', 'STANDING');
        l6 = plot(6, mean(Fstand{i}(:,:)), '+', 'Color', [0, 1, 1], 'DisplayName', 'LAYING');

        xlabel('Número da atividade');
        ylabel(eixo);
    end
    
    legenda = [l4,l5,l6];
    legend(legenda);
    
    subplot(3,1,1);
    title('Média das frequências mais relevantes de cada atividade estática'); 
    
    figure(5);
    
    for i=1:3
        if i == 1
            eixo = 'ACC_X';
        elseif i == 2
            eixo = 'ACC_Y';
        else
            eixo = 'ACC_Z';
        end
        
        subplot(3,1,i)
        hold on;
        grid on;
    
        l7 = plot(7, mean(Fst_t_si{i}(:,:)), '*', 'Color', [0, 0, 0], 'DisplayName', 'STAND_TO_SIT');
        l8 = plot(8, mean(Fsi_t_st{i}(:,:)), '*', 'Color', [0.522, 1, 0.839], 'DisplayName', 'SIT_TO_STAND');
        l9 = plot(9, mean(Fsi_to_lie{i}(:,:)), '*', 'Color', [0.734, 0.510, 0.741], 'DisplayName', 'SIT_TO_LIE');
        l10 = plot(10, mean(Flie_to_si{i}(:,:)), '*', 'Color', [0.910, 0.6, 0.063], 'DisplayName', 'LIE_TO_SIT');
        l11 = plot(11, mean(Fst_t_lie{i}(:,:)), '*', 'Color', [0.710, 0.475, 0.518], 'DisplayName', 'STAND_TO_LIE');
        l12 = plot(12, mean(Flie_t_st{i}(:,:)), '*', 'Color', [0.486, 0.639, 0.565], 'DisplayName', 'LIE_TO_STAND');

        xlabel('Número da atividade');
        ylabel(eixo);
    end
    
    legenda = [l7,l8,l9,l10,l11,l12];
    legend(legenda);
    
    subplot(3,1,1);
    title('Média das frequências mais relevantes de cada atividade de transição'); 
    
    
    

    figure(6);
    
    for i=1:3
        if i == 1
            eixo = 'ACC_X';
        elseif i == 2
            eixo = 'ACC_Y';
        else
            eixo = 'ACC_Z';
        end
        
        subplot(3,1,i)
        hold on;
        grid on;
    
        l1 = plot(1, mean(Aw{i}(:,:)), 'o ', 'Color', [1, 0, 0], 'DisplayName', 'WALKING');
        l2 = plot(2, mean(Awu{i}(:,:)), 'o ', 'Color', [0, 1, 0], 'DisplayName', 'WALKING_UPSTAIRS');
        l3 = plot(3, mean(Awd{i}(:,:)), 'o ', 'Color', [0, 0, 1], 'DisplayName', 'WALKING_DOWNSTAIRS');

        xlabel('Número da atividade');
        ylabel(eixo);
    end
    
    legenda = [l1,l2,l3];
    legend(legenda);
    
    subplot(3,1,1);
    title('Média das amplitudes mais relevantes de cada atividade dinâmica'); 
    
    figure(7);
    
    for i=1:3
        if i == 1
            eixo = 'ACC_X';
        elseif i == 2
            eixo = 'ACC_Y';
        else
            eixo = 'ACC_Z';
        end
        
        subplot(3,1,i)
        hold on;
        grid on;
    
        l4 = plot(4, mean(Asit{i}(:,:)), '+', 'Color', [1, 1, 0], 'DisplayName', 'SITTING');
        l5 = plot(5, mean(Alay{i}(:,:)), '+', 'Color', [1, 0, 1], 'DisplayName', 'STANDING');
        l6 = plot(6, mean(Astand{i}(:,:)), '+', 'Color', [0, 1, 1], 'DisplayName', 'LAYING');

        xlabel('Número da atividade');
        ylabel(eixo);
    end
    
    legenda = [l4,l5,l6];
    legend(legenda);
    
    subplot(3,1,1);
    title('Média das amplitudes mais relevantes de cada atividade estática'); 
    
    figure(8);
    
    for i=1:3
        if i == 1
            eixo = 'ACC_X';
        elseif i == 2
            eixo = 'ACC_Y';
        else
            eixo = 'ACC_Z';
        end
        
        subplot(3,1,i)
        hold on;
        grid on;
    
        l7 = plot(7, mean(Ast_t_si{i}(:,:)), '*', 'Color', [0, 0, 0], 'DisplayName', 'STAND_TO_SIT');
        l8 = plot(8, mean(Asi_t_st{i}(:,:)), '*', 'Color', [0.522, 1, 0.839], 'DisplayName', 'SIT_TO_STAND');
        l9 = plot(9, mean(Asi_to_lie{i}(:,:)), '*', 'Color', [0.734, 0.510, 0.741], 'DisplayName', 'SIT_TO_LIE');
        l10 = plot(10, mean(Alie_to_si{i}(:,:)), '*', 'Color', [0.910, 0.6, 0.063], 'DisplayName', 'LIE_TO_SIT');
        l11 = plot(11, mean(Ast_t_lie{i}(:,:)), '*', 'Color', [0.710, 0.475, 0.518], 'DisplayName', 'STAND_TO_LIE');
        l12 = plot(12, mean(Alie_t_st{i}(:,:)), '*', 'Color', [0.486, 0.639, 0.565], 'DisplayName', 'LIE_TO_STAND');

        xlabel('Número da atividade');
        ylabel(eixo);
    end
    
    legenda = [l7,l8,l9,l10,l11,l12];
    legend(legenda);
    
    subplot(3,1,1);
    title('Média das amplitudes mais relevantes de cada atividade de transição'); 
    
end