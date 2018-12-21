clear; clc;

resize_image('old/train/', 'train/', 'jpg')
resize_image('old/train_labels/', 'train_labels/', 'png')
resize_image('old/test/', 'test/', 'jpg')
resize_image('old/test_labels/', 'test_labels/', 'png')
resize_image('old/val/', 'val/', 'jpg')
resize_image('old/val_labels/', 'val_labels/', 'png')

function resize_image(src_path, dest_path, type)
    scale = 4;
    myfiles = dir(strcat([src_path, '/*.', type]));
    for ind = 1:length(myfiles)
        fprintf('train %d', ind);
        img_file = myfiles(ind);
        img = imread(strcat([src_path, img_file.name]));
        resize_img = img(1:scale:end, 1:scale:end, :);
        imwrite(resize_img, strcat([dest_path, img_file.name]));
    end
end