clear; clc;

% Reference: http://ad-apolloscape.bj.bcebos.com/public%2FApolloScape%20Dataset.pdf
class_map =  {'solid_single', [200, 204, 218, 219, 210], 30;
    'solid_double', [213, 209], 50;
    'broken_single', [201, 203], 70;
    'broken_double', [208, 211], 90;
    'solid_broken', [207, 206], 110;
    'crosswalk', [214, 215], 130;
    'arrow', [225, 224, 222, 221, 220, 202, 226], 150;
    'symbol', [212], 170;
    'bump', [205], 190;
    'visible_old_marking', [223], 210;
    'void', [255], 255;
};

value_map = zeros(1, 255);
for ind = 1:length(class_map)
    value_map(class_map{ind, 2}) = class_map{ind, 3};
end
value_map = uint8(value_map);

relabel('old/train_labels/', 'train_labels/', value_map);
relabel('old/test_labels/', 'test_labels/', value_map);
relabel('old/val_labels/', 'val_labels/', value_map);


function relabel(src_dir, dest_dir, value_map)
    img_files = dir(strcat([src_dir, '*.png']));
    for ind = 1:length(img_files)
        filename = img_files(ind).name;
        fprintf('ind: %d\n', ind);

        img = imread(strcat([src_dir, filename]));
        new_img = img;
        [m, n] = size(img);
        for i=1:m
            for j=1:n
                val = img(i, j);
                if val > 0
                    new_img(i, j) = value_map(val);
                end
            end
        end
        imwrite(new_img, strcat([dest_dir, filename]));
    end
end


