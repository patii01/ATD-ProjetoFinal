d_e1u1 = importdata("acc_exp01_user01.txt");
d_e2u1 = importdata("acc_exp02_user01.txt");
d_e3u2 = importdata("acc_exp03_user02.txt");
d_e4u2 = importdata("acc_exp04_user02.txt");
d_e5u3 = importdata("acc_exp05_user03.txt");
d_e6u3 = importdata("acc_exp06_user03.txt");
d_e7u4 = importdata("acc_exp07_user04.txt");
d_e8u4 = importdata("acc_exp08_user04.txt");

array_data = {d_e1u1(:,:); d_e2u1(:,:); d_e3u2(:,:); d_e4u2(:,:); d_e5u3(:,:); d_e6u3(:,:); d_e7u4(:,:); d_e8u4(:,:)};

labels = importdata("labels.txt");  

activity_lbl = ["W", "W_U", "W_D","SIT", "STAND","LAY", "STAND_SIT", "SIT_STAND", "SIT_LAY", "LAY_SIT", "STAND_LAY", "LAY_STAND"];
exp_us = [1 1; 2 1; 3 2; 4 2; 5 3; 6 3; 7 4; 8 4];  % experiencia utilizador

fs = 50; % frequencia de amostragem

Ts = 1/fs; % periodo de amostragem

for i=1:length(exp_us)
   fich = strcat('acc_exp0', num2str(exp_us(i,1)), '_user0', num2str(exp_us(i,2)), '.txt');
   d = importdata(fich);
   exercicio2(fs, activity_lbl, labels, d, exp_us(i,:))
   dft(exp_us(i,:), fs, d, labels, "retangular", activity_lbl, 1)
end

dft(exp_us(1,:), fs, d_e1u1, labels, "retangular", activity_lbl, 2)

CalcMediaDP(labels, array_data, fs);
diferenciaEstaticas(fs, array_data, labels);
stft(d_e1u1(:,3), fs);



 

