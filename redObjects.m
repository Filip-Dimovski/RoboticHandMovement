function [ stats ] = redObjects(  )
%redObjects return all coordinates of red objects

%webcamlist %izlistuvanje na site kameri
cam=webcam(2);
%preview(cam)
img = snapshot(cam);
%crvenata komponenta na slikata se odzema od grayscale slikata
diff_im = imsubtract(img(:,:,1), rgb2gray(img));
%koristenje na median filter za da se isfiltira shumot.Se koristi 3x3
%sosedi
diff_im=medfilt2(diff_im,[3 3]);
%pretvoranje vo binarna slika
diff_im=im2bw(diff_im,0.18);
%se brishat site pikseli pomali od 300px
%povrshinata na objektite vo binarna slika
diff_im=bwareaopen(diff_im,300);
%returns the label matrix L that contains labels for the 8-connected objects found in BW
bw=bwlabel(diff_im,8);
%za sekoj labeled region postavuvame svojstva
stats=regionprops(bw,'BoundingBox','Centroid');
imshow(img);

hold on
for object = 1:length(stats)
        bb = stats(object).BoundingBox;
        bc = stats(object).Centroid;
        rectangle('Position',bb,'EdgeColor','r','LineWidth',2);
        plot(bc(1),bc(2), '-m+');
        a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'black');
    
    
    
end
hold off
clear cam

end

