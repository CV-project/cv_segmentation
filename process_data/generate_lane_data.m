clear; clc;

resize_data('train/', 'train_labels/', 'train_lane_labels/', 'new/train/', 'new/train_labels/');
resize_data('val/', 'val_labels/', 'val_lane_labels/', 'new/val/', 'new/val_labels/');
resize_data('test/', 'test_labels/', 'test_lane_labels/', 'new/test/', 'new/test_labels/');

function resize_data(color_src_path, label_src_path, lane_label_src_path, ...
    color_dest_path, lane_label_dest_path)
    scale = 4;
    road_value = 49;
    myfiles = dir(strcat([color_src_path, '/*.', 'jpg']));
    for ind = 1:length(myfiles)
        img_file = myfiles(ind);
        
        fprintf('ind: %d\n', ind);
        img = imread(strcat([color_src_path, img_file.name]));
        label_img = imread(strcat([label_src_path, img_file.name(1:16), '_Camera_5_bin.png']));
        lane_label_img = imread(strcat([lane_label_src_path, img_file.name(1:16), '_Camera_5_bin.png']));

        img = img(1:scale:end, 1:scale:end, :);
        label_img = label_img(1:scale:end, 1:scale:end, :);
        lane_label_img = lane_label_img(1:scale:end, 1:scale:end, :);

        road_pixels_pos = uint8(label_img == road_value);
        new_train_img = img .* road_pixels_pos;

        imwrite(new_train_img, strcat([color_dest_path, img_file.name]));
        imwrite(lane_label_img, strcat([lane_label_dest_path, img_file.name(1:16), '_Camera_5_bin.png']));
    end
end