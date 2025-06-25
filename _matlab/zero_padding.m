fs = 1000;          % Sampling rate (Hz)
f1 = 50; f2 = 52;   % Two close frequencies
amp = 1;

% Short signal (low resolution): 0.2s
T1 = 0.2;
t1 = 0:1/fs:T1-1/fs;
x1 = amp*sin(2*pi*f1*t1) + amp*sin(2*pi*f2*t1);

% Long signal (high resolution): 2s
T2 = 2;
t2 = 0:1/fs:T2-1/fs;
x2 = amp*sin(2*pi*f1*t2) + amp*sin(2*pi*f2*t2);

% FFT with zero-padding
X1 = fft(x1, 4096);
X2 = fft(x2, 4096);
f = (0:4095)*(fs/4096);

% Plot
figure
subplot(2,1,1);
plot(f, abs(X1), "LineWidth", 2); xlim([40 60]);
title('Short signal (0.2s) — Resolution = 5 Hz');
set(gca,'FontSize',15, "FontName","Times New Roman");
subplot(2,1,2);
plot(f, abs(X2), "LineWidth", 2); xlim([40 60]);
title('Long signal (2s) — Resolution = 0.5 Hz');
set(gca,'FontSize',15, "FontName","Times New Roman");