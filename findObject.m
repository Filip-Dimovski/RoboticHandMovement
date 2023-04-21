function [ T ] = findObject( x,y )
%RESOLUTION: 640x480
xx=x*33/640; 
xx=xx-16.5;
yy=y*26/480; 
yy=yy-13;
z= 35.5;
T = [-xx;yy;z;1];
end

