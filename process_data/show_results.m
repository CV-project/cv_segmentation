clear; clc; close all;

% define colormap
c_map_lane = hsv(256);
c_map_lane(1, :) = 0;
c_map_all = colorcube(256);
c_map_all(1, :) = 0;

% all seg
% show_with_colormap(c_map_all, ...
%     '/Users/zhangyong/projects/cv_segmentation/tmp/170927_064336282_Camera_5_gt.png');
% show_with_colormap(c_map_all, ...
%     '/Users/zhangyong/projects/cv_segmentation/tmp/170927_064336282_Camera_5_pred.png');

% lane seg
img1 = show_with_colormap(c_map_lane, ...
    '/Users/zhangyong/projects/cv_segmentation/tmp/170927_064255997_Camera_5_gt.png');
img2 = show_with_colormap(c_map_lane, ...
    '/Users/zhangyong/projects/cv_segmentation/tmp/170927_064255997_Camera_5_pred.png');


function img = show_with_colormap(c_map, img_name)
    figure
    img = imread(img_name);
    imshow(img, c_map);
end