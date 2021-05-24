% Método criado para, recebendo o sinal que se quer analisar e a frequência
% de amostragem, calcular a DFT em janelas deslizantes (STFT) utilizando a
% janela de Hammming

function stft(data, fs)
    Ts = 1/fs;  %periodo de amostragem
    N = numel(data);    % numero de pontos
    t = N*Ts;   %tempo total
    Tframe = 0.02*t;    %tamanho de cada janela
    
    Toverlap = Tframe/2;    %sobreposição das janelas
    
    Nframe = round(Tframe/Ts);  % numero de pontos em cada janela
    jan_ham = hamming(Nframe);    % aplica a janela de Hamming 
    
    Noverlap = round(Toverlap*fs);  % numero de pontos em sobreposição de cada janela
    
    if mod(Nframe, 2)==0
        f_frame = -fs/2:fs/Nframe:fs/2-fs/Nframe;
    else 
        f_frame = -fs/2+fs/(2*Nframe):fs/Nframe:...
            fs/2-fs/(2*Nframe);
    end
    
    f_relev = [];
    
    for ii = 1:Nframe-Noverlap:N-Nframe+1
        % aplicar a janela ao sinal do tempo
        x_frame = data(ii:ii+Nframe-1).*jan_ham;

        detrended = detrend(x_frame);
        % obter a magnitude da fft do sinal
        m_X_frame = abs(fftshift(fft(detrended)));

        % obter o máximo da magnitude do sinal
        m_X_frame_max = max(m_X_frame);

        % encontrar os índices do máximo da magnitude do sinal
        ind = find(abs(m_X_frame-m_X_frame_max) < 0.0485);
        
        locs= find(abs(m_X_frame-m_X_frame_max) < 0.0485);
        freq = f_frame(locs);
        f_relev = [f_relev freq(freq>0)];
        
    end
    
    disp(f_relev)
    
%     spectrogram(data,jan_ham,Noverlap,[],fs,'yaxis')
%      [s,f,t,p] = spectrogram(data,Nframe,Noverlap,[],fs);

% Encontrar os máximos em cada janela temporal
%     [I,A] = max(p);
%     f_relev_spect = f(A)
%     
end