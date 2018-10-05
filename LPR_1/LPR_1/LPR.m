function ANS=LPR(path)
image=imread(path);
I1=RGBtoGray(image);
I2=uint8(I1);
I2=histeq(I2);
S=[-1,0,1;-2,0,2;-1,0,1];
I3=double(I2);
I3=Sobel(S,I3);
V=medfilt2(I3);
I3=medfilt2(V);
I4=I3;
T=200;
z=find(I4<=T);
I4(z)=0;
one=find(I4>T);
I4(one)=1;
A=ones(4,15);
B=ones(2,20);
I4_2=I4;
I4_2=imdilate(I4_2,A);
I4_2=imerode(I4_2,B);
I4_2=imerode(I4_2,B);
I4_2=imdilate(I4_2,A);
I4_2=imdilate(I4_2,A);
[x1,x2,y1,y2]=FindLicensePlant(I4_2);
I5=I2(y1:y2,x1:x2);
I5=double(I5);
T2=120;
I6=I5;
N=find(I6<=T2);
I6(N)=1;
N=find(I6>T2)
I6(N)=0;
I7=I6;
ix=size(I7,1);
iy=size(I7,2);
W=sum(I7);
N=find(W>(0.95*ix));
I7(:,N)=[];
ix=size(I7,1);
iy=size(I7,2);
H=zeros(ix,1);
m=1;
M=ix;
for i=1:ix
    H(i,1)=sum(I7(i,1:iy));
end
for i=1:floor(ix/2)
    if(H(i,1)<floor(iy/10))
        m=i;
    end
end
for i=ix:-1:floor(ix/2)
    if(H(i,1)<floor(iy/10))
        M=i;
    end
end
I7=I7(m:M,:);
ix=size(I7,1);
iy=size(I7,2);
W=sum(I7);
A=[1,1;1 1];
I8=imerode(I7,A);
I8=imdilate(I8,A);
ix=size(I8,1);
iy=size(I8,2);
W=sum(I8);
Number=zeros(10,3);
pixel=ix*iy;
summ=0;
j=1;
S=0;
for k=1:10
    for i=j:iy
        if(summ==0)
            if (W(1,i)~=0)
                summ=summ+W(1,i);
                Number(k,1)=i;
            end
        else
            summ=summ+W(1,i);
            if(W(1,i)==0)
                j=i;
                break;
            end
        end
    end
    Number(k,2)=i-1;
    Number(k,3)=summ;
    if(summ>pixel/6/10)
        S=S+1;
    end
    summ=0;
    if(S==6)
        break;
    end
end
T=[];
for i=1:10
    if(Number(i,3)<(pixel/6/10))
        T=[T,i];
    end
end
Number(T,:)=[];
    Ch_1=I8(:,Number(1,1):Number(1,2));
    Ch_2=I8(:,Number(2,1):Number(2,2));
    Ch_3=I8(:,Number(3,1):Number(3,2));
    Ch_4=I8(:,Number(4,1):Number(4,2));
    Ch_5=I8(:,Number(5,1):Number(5,2));
    Ch_6=I8(:,Number(6,1):Number(6,2));
Ch_1=imresize(Ch_1,[110,60]);
Ch_2=imresize(Ch_2,[110,60]);
Ch_3=imresize(Ch_3,[110,60]);
Ch_4=imresize(Ch_4,[110,60]);
Ch_5=imresize(Ch_5,[110,60]);
Ch_6=imresize(Ch_6,[110,60]);
T=find(Ch_1<0)
Ch_1(T)=0;
T=find(Ch_2<0)
Ch_2(T)=0;
T=find(Ch_3<0)
Ch_3(T)=0;
T=find(Ch_4<0)
Ch_4(T)=0;
T=find(Ch_5<0)
Ch_5(T)=0;
T=find(Ch_6<0)
Ch_6(T)=0;
Ch=zeros(110,60,6);
Ch(:,:,1)=Ch_1;
Ch(:,:,2)=Ch_2;
Ch(:,:,3)=Ch_3;
Ch(:,:,4)=Ch_4;
Ch(:,:,5)=Ch_5;
Ch(:,:,6)=Ch_6;
C=zeros(110,60,34);
c_1=imread('c_1.png');
c_2=imread('c_2.png');
c_3=imread('c_3.png');
c_4=imread('c_4.png');
c_5=imread('c_5.png');
c_6=imread('c_6.png');
c_7=imread('c_7.png');
c_8=imread('c_8.png');
c_9=imread('c_9.png');
c_10=imread('c_0.png');
c_11=imread('c_A.png');
c_12=imread('c_B.png');
c_13=imread('c_C.png');
c_14=imread('c_D.png');
c_15=imread('c_E.png');
c_16=imread('c_F.png');
c_17=imread('c_G.png');
c_18=imread('c_H.png');
c_19=imread('c_J.png');
c_20=imread('c_K.png');
c_21=imread('c_L.png');
c_22=imread('c_M.png');
c_23=imread('c_N.png');
c_24=imread('c_P.png');
c_25=imread('c_Q.png');
c_26=imread('c_R.png');
c_27=imread('c_S.png');
c_28=imread('c_T.png');
c_29=imread('c_U.png');
c_30=imread('c_V.png');
c_31=imread('c_W.png');
c_32=imread('c_X.png');
c_33=imread('c_Y.png');
c_34=imread('c_Z.png');
C(:,:,1)=RGBtoGray(c_1);
C(:,:,2)=RGBtoGray(c_2);
C(:,:,3)=double(c_3);
C(:,:,4)=RGBtoGray(c_4);
C(:,:,5)=double(c_5);
C(:,:,6)=double(c_6);
C(:,:,7)=double(c_7);
C(:,:,8)=RGBtoGray(c_8);
C(:,:,9)=double(c_9);
C(:,:,10)=double(c_10);
C(:,:,11)=RGBtoGray(c_11);
C(:,:,12)=RGBtoGray(c_12);
C(:,:,13)=double(c_13);
C(:,:,14)=RGBtoGray(c_14);
C(:,:,15)=RGBtoGray(c_15);
C(:,:,16)=RGBtoGray(c_16);
C(:,:,17)=double(c_17);
C(:,:,18)=RGBtoGray(c_18);
C(:,:,19)=RGBtoGray(c_19);
C(:,:,20)=double(c_20);
C(:,:,21)=double(c_21);
C(:,:,22)=RGBtoGray(c_22);
C(:,:,23)=double(c_23);
C(:,:,24)=RGBtoGray(c_24);
C(:,:,25)=RGBtoGray(c_25);
C(:,:,26)=RGBtoGray(c_26);
C(:,:,27)=RGBtoGray(c_27);
C(:,:,28)=double(c_28);
C(:,:,29)=RGBtoGray(c_29);
C(:,:,30)=RGBtoGray(c_30);
C(:,:,31)=RGBtoGray(c_31);
C(:,:,32)=RGBtoGray(c_32);
C(:,:,33)=RGBtoGray(c_33);
C(:,:,34)=double(c_34);
C=C/255;
M=zeros(1,6);
score=zeros(34,1);
for c=1:6
    for i=1:34
        B=Ch(:,:,c).*C(:,:,i);
        for j=1:110
            for k=1:60
                score(i,1)=score(i,1)+B(j,k);
            end
        end
    end
    M(c)=find(score==max(score));
    score=zeros(34,1);
end
Zero=C(:,:,10);
Zero=Zero(1:55,31:60);
Six=C(:,:,6);
Six=Six(1:55,31:60);
for i=1:6
    if(M(i)==10||M(i)==6)
       S1=Ch(1:55,31:60,i).*Zero;
       S2=Ch(1:55,31:60,i).*Six;
       S_1=0;
       S_2=0;
       for j=1:55
           for k=1:30
               S_1=S_1+S1(j,k);
               S_2=S_2+S2(j,k);
           end
       end
       if(S_1>S_2)
           M(i)=10;
       elseif(S_2>=S_1)
           M(i)=6;
       end
    end
end
COR=(1:1:34);
COR=[COR;'1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z'];
ANS='';
for i=1:6
    ANS=strcat(ANS,COR(2,M(i)));
end
end