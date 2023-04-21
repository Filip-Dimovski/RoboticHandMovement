function [ byteJoints2 ] = joints_to_bytes( Lynx, joints, bounds)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

newjoints = transform_joints(Lynx,joints,bounds);

byteJoints2(:,1) = uint8((newjoints(:,1)-pi/8) * (254 / (6*pi/8)));
byteJoints2(:,2) = uint8((newjoints(:,2)-pi/8) * (254 / (6*pi/8)));
byteJoints2(:,3) = uint8((newjoints(:,3)-pi/8) * (254 / (6*pi/8)));
byteJoints2(:,4) = uint8((newjoints(:,4)-pi/8) * (254 / (6*pi/8)));


end

