import cv2

def get_image_filenames(fname):
    with open(fname) as f:
        content = f.readlines()
    content = [x.strip() for x in content]
    return content

images = get_image_filenames('image_list_ts')

image_ts = images(0);
color_image = cv2.imread('ColorImage\%s_Camera_5.jpg' % image_ts)
depth_image = cv2.imread('Depth\%s' % image_ts)
label_image = cv2.imread('Label\%s' % image_ts)
lane_label_image = cv2.imread('Lane_label\%s' % image_ts)
