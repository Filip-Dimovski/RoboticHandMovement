%povrzuvanje so robotot
path(path,'D:\VI_Шести семестар\Роботика\rvctools')
startup_rvc
bounds = [-pi/2,pi/2; 0,pi; -pi,0; -pi/2,pi/2];

%crtanje na robotot
Lynx = SerialLink([0 2 0 pi/2 0; 0 0 11 0 0; 0 0 10 0 0; 0 0 14 0 0;0 0 0 0 0;0 0 0 0 0], 'name', 'lynx5');
Lynx.tool = trotx(-pi/2)*Lynx.tool;
Lynx.qlim(1,:) = [-(pi/2-pi/8), pi/2-pi/8];
Lynx.qlim(2,:) = [pi/8, 7*pi/8];
Lynx.qlim(3,:) = [-7*pi/8, -pi/8];
Lynx.qlim(4,:) = [-(pi/2-pi/8), pi/2-pi/8];
%Lynx.qlim(5,:)=[0 0];
%Lynx.qlim(6,:)=[0 0];
Lynx.teach();

%presmetuvanje na pochetna i krajna polozhba
t =0:.25:1;
T=transl([10, 0, -1]);
pochetnaPolozhba=Lynx.ikine(T,[ 0 pi/2 -pi/2 -pi/2 0  0],[0,1,1,1,0,0])
%Lynx.plot(pochetnaPolozhba);
TrobotKamera= transl(23,0,30) * trotx(pi)*trotz(pi/2)

 %--rabota so kamera--
 prompt = 'choose objects color (R\G\B): ';
 color = input(prompt,'s');
 if color == 'R'
 stats=redObjects();
 elseif color == 'G'
 stats=greenObjects();
 
 elseif color == 'B'
 stats=blueObjects();
 else
     error('There was an error. You must enter R,G or B.')
 end
 figure();
 if isempty(stats)
     disp('no objects found')
 else
      bc=stats(1).Centroid;
         x = round(bc(1))
         y=round(bc(2))
    kameraObjekt = findObject(x,y)
    robotObjekt= TrobotKamera * kameraObjekt
    
    krajnaPolozhba= Lynx.ikine(transl(robotObjekt(1:3)),[0 1 1 1 0 0],[0 1 1 1 0 0])
    if krajnaPolozhba(1) > -(pi/2-pi/8)
        if krajnaPolozhba(1) <pi/2-pi/8
            if krajnaPolozhba(2) > pi/8   
        if krajnaPolozhba(2) <7*pi/8
            if krajnaPolozhba(3) > -7*pi/8 
        if krajnaPolozhba(3) <-pi/8
            if krajnaPolozhba(4) >  -(pi/2-pi/8)
        if krajnaPolozhba(4) <pi/2-pi/8
    q=jtraj(pochetnaPolozhba,krajnaPolozhba,t);
    Lynx.plot(q);
    bytes = joints_to_bytes(Lynx, q, bounds);
    s = serial('COM3', 'BaudRate', 9600);
    fopen(s);
    drive_robot(bytes, s, [1 1 1 1], 99999999);
    q=jtraj(krajnaPolozhba,pochetnaPolozhba,t);
    bytes = joints_to_bytes(Lynx, q, bounds);
    drive_robot(bytes, s, [1 1 1 1], 99999999);
    %Lynx.plot(q);
    fclose(s);
    else
        disp('Cannot reach the object 4')
        end
        else
        disp('Cannot reach the object 4')
            end
            else
        disp('Cannot reach the object 3')
        end
        else
        disp('Cannot reach the object 3')
            end
            else
        disp('Cannot reach the object 2')
        end
        else
        disp('Cannot reach the object 2')
            end
            else
        disp('Cannot reach the object 1')
        end
    else
        disp('Cannot reach the object 1')
    end

 end
