% Método criado para auxiliar o método que calcula  a média e o desvio padrão 
% do número médio de passos de cada atividade. Recebendo um segmento de um
% sinal e a frequência de amostragem vai obter a frequência máxima e
% multiplicá-la por 60 (para passar para minutos)

function spm = StepsPerMinute(janela, fs)
    N = numel(janela); % Periodo Fundamental

    % calcular o vetor de frequências
    if (mod(N,2)==0)
        % se o número de pontos do sinal for par
        f = -fs/2:fs/N:fs/2-fs/N;
    else
        % se o número de pontos do sinal for ímpar
        f = -fs/2+fs/(2*N):fs/N:fs/2-fs/(2*N);
    end
    
    detrended = detrend(janela);
    dft = abs(fftshift(fft(detrended))); % DFT
    
    maximo = max(abs(dft));
    ind_max = (abs(dft) == maximo);
    
    frequencia_max = f(ind_max);
    
    frequencia_max = abs(frequencia_max(1));
    
    spm = frequencia_max *60;


end

