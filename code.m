%lab7
############imread########
test1=imread('test1.tif');
test1=test1(:,:,1);
test2=imread('test2.png');
test3=imread('test3.jpg');
test4=imread('test4.bmp');
test5=imread('test5.png');
test6=imread('test6.jpg');
########################
S1=edge(test_im,'sobel');
figure;
imshow(S1);
title('sobel算子');
hold on
P1=edge(test_im,'Prewitt');
figure;
imshow(P1);
title('Prewitt算法');
hold on
C1=edge(test_im,'canny');
figure;
imshow(C1);
title('canny算法');
hold on
######################
function []=line_detect(test_im)

#sobel算子
S1=edge(test_im,'sobel');
figure;
imshow(S1);
title('sobel算子');
hold on
[H,T,R]=hough(S1,'Theta',-90:0.5:89);
P=houghpeaks(H,25);
lines=houghlines(test_im,T,R,P);
for k=1:length(lines)
    xy=[lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
end
#canny算法
C1=edge(test_im,'canny');
figure;
imshow(C1);
title('canny算法');
hold on
[H,T,R]=hough(C1,'Theta',-90:0.5:89);
P=houghpeaks(H,25);
lines=houghlines(test_im,T,R,P);
for k=1:length(lines)
    xy=[lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
end