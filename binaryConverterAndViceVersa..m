%Read Readme.md for help
%-------------------------------------------------------------------------
%clear all;
close all;
%displaying the initial image
%figure, imshow('C:\Users\Divyanshu kumar\Desktop\tenet.jpg');
%opening the file to read as 8-bit data
fid = fopen('C:\Users\Divyanshu kumar\Desktop\tenet.jpg');
bytes = fread(fid, inf, 'ubit8', 'b');
fclose(fid);

%converting ubit8(8-bit) to stream of 0s and 1s
for i = bytes
    temp=dec2bin(i,8);
end;
bits=zeros(size(temp(:)));
for j=1:(size(temp(:,1)))
    for k=1:8
     bits(((j-1)*8+k))= str2double(temp(j,k));
    end;
end;
%-------------------------------------WORK--------------------------------


recieved_bits=bits;
%-------------------------------------------------------------------------
%converting stream of 0 and 1 into ubit8
byte_size=(size(recieved_bits));
recieved_bytes=zeros(int32(byte_size/8));


for i=1:size(recieved_bytes)
    recieved_bytes(i)=bin2dec(convertCharsToStrings(int2str(recieved_bits((i-1)*8+1:i*8))));
end;

%saving to file
fileID = fopen('C:\Users\Divyanshu kumar\Desktop\tenet2.jpg','wb');
fwrite(fileID,recieved_bytes,'ubit8');
fclose(fileID);
%displaying obtained image
%figure, imshow('C:\Users\Divyanshu kumar\Desktop\tenet2.jpg')
