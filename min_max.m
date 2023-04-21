function [ out ] = min_max(robot, joints )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

out(1,:) = [min(joints(2 : size(joints,1), 1)) max(joints(2 : size(joints,1), 1))];
out(2,:) = [min(joints(2 : size(joints,1), 2)) max(joints(2 : size(joints,1), 2))];
out(3,:) = [min(joints(2 : size(joints,1), 3)) max(joints(2 : size(joints,1), 3))];
out(4,:) = [min(joints(2 : size(joints,1), 4)) max(joints(2 : size(joints,1), 4))];

correct = 1;
lim = robot.qlim;
for i = 1 : 4
	if (out(i,1) < lim(i,1) || out(i,2) > lim(i,2))
	
        sprintf('%d: Limit: %f %f \nOverflow: %f %f', i-1, lim(i,1),lim(i,2),out(i,1),out(i,2))
		
		correct = 0;
	end
end

if (correct == 1)
	sprintf('SUCCESS');
end

end

