function [ new_joints ] = transform_joints( robot, joints, bounds)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
new_joints(:,1) = joints(:,1) - bounds(1,1);
new_joints(:,2) = joints(:,2) - bounds(2,1);
new_joints(:,3) = joints(:,3) - bounds(3,1);
new_joints(:,4) = joints(:,4) - bounds(4,1);

end

