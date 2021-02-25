inpu_loc = '/home/Debanjan_cse/MUSIG Function Modified/SkullStripped/';
%output_loc='/home/Debanjan_cse/MUSIG Function Modified/Matlabcode/Output_QIMUSIG_QACO/';
for i=1:80
    path = strcat(inpu_loc, strcat( int2str(i),'.png'));
    respath=strcat(inpu_loc, strcat( int2str(i),'.png'));
    sprintf( path);
im=imread (path);
%imshow(im);
fuzzyimage(im,i);
end