import os

def get_image_filenames(fname):
    with open(fname) as f:
        content = f.readlines()
    content = [x.strip() for x in content]
    return content

color_images = get_image_filenames('./color_image_list.txt')
label_images = get_image_filenames('./label_image_list.txt')
lane_label_images = get_image_filenames('./lane_label_image_list.txt')
depth_images = get_image_filenames('./depth_image_list.txt')

color_ts = list(map(lambda x: x[0:16], color_images))
label_ts = list(map(lambda x: x[0:16], label_images))
lane_label_ts = list(map(lambda x: x[0:16], lane_label_images))
depth_ts = list(map(lambda x: x[0:16], depth_images))

# find images with no labels
assert(set(color_ts) == 3592)
assert(set(label_ts) == 3347)
assert(set(color_ts) == set(depth_ts))
assert(set(color_ts) == set(lane_label_ts))


none_ts = list(set(color_ts) - set(label_ts))
assert(len(none_ts) == 245)
print('\n'.join(none_ts))

## rm image with no labels

for x in none_ts:
    os.system('del ColorImage\%s*' % x)
    os.system('del Depth\%s*' % x)
    os.system('del Lane_label\%s*' % x)
