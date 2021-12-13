%Read Readme.md for help
%Any work should be done in WORK section as mentioned in code segment. The 
%processed bits must satisfy the file format in which it is being saved. 
%If no WORK is done, this program takes a file, convert to unsigned 8-bit 
%data and then converts to binary(0 and 1) array, then it takes the binary 
%array converts to unsigned 8-bit data and save the file in original format 
%to obtain a COPY of the file.
%-------------------------------------------------------------------------
clear all;
close all;

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
fileID = fopen('C:\Users\Divyanshu kumar\Desktop\tenet2.jpg','w');
fwrite(fileID,recieved_bytes,'ubit8');
fclose(fileID);
