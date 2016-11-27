%% 1.1 
% Synthetic image
img = zeros(301,301);
img(100:200, 140:160) = 255;
%% 1.2
imgFreq = fftshift(fft2(img));
figure(1);
subplot(131);  imagesc(img); colormap('gray'); title('Image');
subplot(132); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude');
subplot(133); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase');

%% 1.3
% translation
imgTrans = zeros(301,301);
imgTrans(150:250, 160:180) = 255;
% Rotation
imgRot = imrotate(img, 45);
% 2 slots
img2 = zeros(301,301);
img2(20:120, 140:160) = 255;
img2(180:280, 140:160) = 255;
%  thiner and taller
img3 = zeros(301,301);
img3(100:200, 145:155) = 255;

imgFreqTrns = fftshift(fft2(imgTrans));
imgFreqRot = fftshift(fft2(imgRot));
imgFreq2 = fftshift(fft2(img2));
imgFreq3 = fftshift(fft2(img3));

figure(2);
subplot(431); imshow(imgTrans); colormap('gray'); title('Img Translated');
subplot(432); imagesc(abs(imgFreqTrns)); colormap('gray'); title('Trans Magnitude');
subplot(433); imagesc(angle(imgFreqTrns)/pi*180); colormap('gray'); title('Trans Phase');

subplot(434); imshow(imgRot); colormap('gray'); title('image Rotated');
subplot(435); imagesc(abs(imgFreqRot)); colormap('gray'); title('Rot Magnitude');
subplot(436); imagesc(angle(imgFreqRot)/pi*180); colormap('gray'); title('Rot Phase');

subplot(437); imshow(img2); colormap('gray'); title('image 2');
subplot(438); imagesc(abs(imgFreq2)); colormap('gray'); title('Trans Magnitude');
subplot(439); imagesc(angle(imgFreq2)/pi*180); colormap('gray'); title('Trans Phase');

subplot(4,3,10); imshow(img3); colormap('gray'); title('image 3');
subplot(4,3,11); imagesc(abs(imgFreq3)); colormap('gray'); title('Rot Magnitude');
subplot(4,3,12); imagesc(angle(imgFreq3)/pi*180); colormap('gray'); title('Rot Phase');

%% 1.4

Im=0;
N=64;
T=1;
Ts=T/N;
Fs=1/Ts;
df=Fs/N;

Im(N/8:N/4,N/4+1:N/2)=1;
Im(1:N/4,N/2+1:N)=Im;
Im(N/4+1:N/2,:) = Im;
Im(N/2+1:3*N/4,:) = Im(1:N/4,:);
Im(3*N/4+1:N,:) = Im(1:N/4,:);

If = fftshift(fft2(Im));
figure;
subplot(131); imagesc(Im); colormap('gray'); title('Image');
subplot(132); imagesc(abs(If)); colormap('gray'); title('Magnitude');
subplot(133); imagesc(angle(If)/pi*180); colormap('gray'); title('Phase');

center = If(N/2+1 , N/2+1)/(N^2);
fprintf('Normalized Center Frequency is: %d \n',center);

%% 1.5
u = N/2+1;
v = N/2+1;

x = abs(If(u,:));
y = abs(If(:,v));

figure;
subplot(121); plot(x); title('x');
subplot(122); plot(y); title('y');

% This output represent cutting the 2D FFT output horizontally and
% vertically to a line (1D FFT) in the middle of the spectrum 
% We can see that cutting horizontally produce a spectrum with higher
% frequencr >> small spacing between peaks, while cutting vertically has a
% slightly bigger spacing between peaks.

%% 1.6
lena = imread('lena-grey.bmp');
lenaSpectrum = fftshift(fft2(lena));
figure;
subplot(131); imagesc(lena); colormap('gray'); title('Image');
subplot(132); imagesc(abs(lenaSpectrum)); colormap('gray'); title('Magnitude');
subplot(133); imagesc(angle(lenaSpectrum)/pi*180); colormap('gray'); title('Phase');

% Reconstruct from the phase
lenaD = im2double(lena);
lenaSpectD = fft2(lenaD);
phase = abs(angle(lenaSpectD)/pi*180); 
reconst = ifft2(phase); 
reconst = im2uint8(reconst);

figure
imshow(reconst) 
title('Reconstructed image from phase');

% Good resources:
% http://stackoverflow.com/questions/7763092/matlab-inverse-fft-from-phase-magnitude-only
% https://fr.mathworks.com/matlabcentral/answers/93573-why-do-i-receive-unexpected-results-when-using-fft2-ifft2-with-a-sequence-of-image-arithmetic-functi

%% 1.7
% Working on lena image .. we need padding to both lena and the filter

h = fspecial('sobel'); % sobel filter
h = h'; %% vertical 
[xs,ys] = size(lena);
Paddedx = 2*xs;  %% the new image after padding will be twice the original
Paddedy = 2*ys;  %% the new image after padding will be twice the original

F = fft2(double(lena), Paddedx, Paddedy);
H = fft2(double(h), Paddedx, Paddedy);
FilteredImage = H.*F;
ffi = abs(ifft2(FilteredImage)); 
ffi = ffi(2:size(lena,1)+1, 2:size(lena,2)+1); % cropped

figure, imshow(ffi,[]), title('Sobel filter in Frequency domain');

% Very good Resource:
% http://www.cs.uregina.ca/Links/class-info/425/Lab5/
% https://fr.mathworks.com/help/images/ref/fspecial.html

