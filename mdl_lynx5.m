Lynx = SerialLink([0 2 0 pi/2; 0 0 11 0; 0 0 10 0; 0 0 14 0], 'name', 'lynx5');
Lynx.tool = trotx(-pi/2)*Lynx.tool;
Lynx.qlim(1,:) = [-(pi/2-pi/8), pi/2-pi/8];
Lynx.qlim(2,:) = [pi/8, 7*pi/8];
Lynx.qlim(3,:) = [-7*pi/8, -pi/8];
Lynx.qlim(4,:) = [-(pi/2-pi/8), pi/2-pi/8];

bounds = [-pi/2,pi/2; 0,pi; -pi,0; -pi/2,pi/2];
initial = [0 pi/2 -pi/2 0];
Lynx.teach(initial)

