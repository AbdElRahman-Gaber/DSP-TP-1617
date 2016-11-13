%% Ex. 1 
x = [1 2 3 4];
h1 = Dirac(7, 5);
h2 = Step(7,5);
h3 = exponential(10,5);
h4 = [-1 1];


dirac_conv = convFn (x, h1)
step_conv = convFn (x, h2)
exp_conv = convFn(x,h3)
conv_4 = convFn (x, h4)


%% Ex. 1 

lena = imread('lena-grey.bmp');
lena = im2double(lena);
figure; imshow(lena);
title('Lena Original')

k = (1.0/256) .* [1 4 6 4 1 ; 4 16 24 16 4 ; 6 24 36 24 6 ; 4 16 24 16 4; 1 4 6 4 1];
sobel = [-1 0 1; -2 0 2; -1 0 1];

out_gaus = Conv2Fn(lena, k);
figure; imshow(out_gaus);
title('Lena applying gaussian filter')

out_sobel = Conv2Fn(lena, sobel);
figure; imshow(out_sobel);
title('Lena applying sobel in x direction')


%% Ex. 3
a = imread('a.png', 'png');
text = imread('text.png', 'png');
whos
a = rgb2gray(a);
figure; imshow(a);
figure; imshow(text);

level_a = graythresh(a);
level_text = graythresh(text);

BW_a = im2bw(a, level_a);
figure; imshow(BW_a);
title('letter "a" binary')

BW_text = im2bw(text, level_text);
%BW_text2 = 1.0 - BW_text;
figure; imshow(BW_text);
title('text in binary')

correlation = normxcorr2(BW_a, BW_text);


[ypeak, xpeak] = find(correlation==max(correlation(:)));

yoffSet = ypeak-size(BW_a,1);
xoffSet = xpeak-size(BW_a,2);

figure;
hAx  = axes;
imshow(BW_text,'Parent', hAx);
imrect(hAx, [xoffSet+1, yoffSet+1, size(BW_a,2), size(BW_a,1)]);


