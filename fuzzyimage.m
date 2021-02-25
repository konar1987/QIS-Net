%function fuzzy_image
function fuzzyimage(im,i)
%im=imread ('/home/Debanjan_cse/MUSIG Function Modified/SkullStripped/72.png');
%im=rgb2gray(im);
%im =imread(str);
%q0=str2;
%for q0 = 0.1:0.9 step 0.1
 %for q0 = 1.0:-0.01:0.01
 
 fileID = fopen('output.txt','w');
 
fprintf(fileID,'%6s   %12s\n','q0','corelation'); % this for naming the variables
 
 %for lamb = 1:10% for lambda = 0.23 to 0.24
 %for lamb = 0.1:0.01:0.2
 for lamb = 0.25:-0.001:0.24
 %q0=0.24
%for q0 = 0.1:0.01:0.2      
pi=22./7;

%in_matrix = imresize (rgb2gray(im),[128,128]);  % just for resize
%in_matrix =im;

wt=size(im,2); % dimention of matrix
ht=size(im,1);  % dimention of matrix

int_matrix = zeros(ht,wt); % new matrix intermediate matrix
out_matrix=zeros(ht,wt);    % new matrix intermediate matrix
y=zeros(ht,wt);           % cardianlity matrix

%in_matrix = rgb2gray(im);
in_matrix = im;

inp =in_matrix;  % takng input gray image not doing anything


in_matrix = double (in_matrix)./255; % fuzzy_set
%l=in_matrix;
in_matrix = double((pi/2)*in_matrix);

x=zeros (ht,wt);
w1=zeros (ht,wt);
w2=zeros (ht,wt);

a=0;
[int_matrix,x]=Transit(in_matrix,ht,wt,lamb);     % I1 -> I2
[out_matrix,x]=Transit(int_matrix,ht,wt,lamb);  % I2 -> I3
[int_matrix,x]=Transit(out_matrix,ht,wt,lamb);  % I3->I2
[out_matrix,w1]=Transit(int_matrix,ht,wt,lamb);  % I2 -> I3

count=0;
    
  while(a==0)
        [int_matrix,x]=Transit(out_matrix,ht,wt,lamb);
        [out_matrix,w2]=Transit(int_matrix,ht,wt,lamb); 
       a=check(w1,w2,ht,wt);
       w1=w2; 
       count=count+1;
       disp(count); 
       
       if(count>50)
       break;
       end
   end

%subplot (1,3,1), imshow(im); title ('Original Image');
%subplot (1,3,2), imshow(l); title ('Gray Image');
%subplot (1,3,3), imshow(out_matrix); title ('segmented Image')
%figure, imshow(out_matrix,[]);

filename=sprintf('%d_C8_S2_%f.png',i, lamb);
%out_matrix=out_matrix*(2/pi);
%imwrite(out_matrix,strcat(output_loc,filename));

imwrite(out_matrix,filename);

out=out_matrix;  %output matrix
r=corr2(inp,out);

ka = [lamb  r ];

fprintf(fileID,'%6.8f   %12.8f\n',ka);    

end

     % this for printing values
fclose(fileID);

r
 
%end

end

    