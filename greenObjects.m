function [ stats ] = greenObjects()
%greenObjects return all coordinates of green objects


%webcamlist %list all cameras
cam=webcam(2);
%preview(cam)
img = snapshot(cam);
%the green component of the picture is substracted from the grayscale picture
diff_im = imsubtract(img(:,:,2), rgb2gray(img));
%use median filter to filter the noise out. 
%neighbors
diff_im=medfilt2(diff_im,[3 3]);
%create a binary picture
diff_im=im2bw(diff_im,0.18);
%delete all pixels less than 300px 
%The surface of the objects in the picture
diff_im=bwareaopen(diff_im,300);
%returns the label matrix L that contains labels for the 8-connected objects found in BW
bw=bwlabel(diff_im,8);
%for every labeled region we set properties
stats=regionprops(bw,'BoundingBox','Centroid');
  imshow(img);
hold on
for object = 1:length(stats)
        bb = stats(object).BoundingBox;
        bc = stats(object).Centroid;
        rectangle('Position',bb,'EdgeColor','g','LineWidth',2);
        plot(bc(1),bc(2), '-m+');
        a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'black');
end
    
    hold off
clear cam

end

