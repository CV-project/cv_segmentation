## Experiment Overview

2 tasks:

* environment segmentation: color image -> image labels (37 classes)
* lanemark identification: color image (only road) -> lane marks (12 classes)

todo: input and output image

## Methods

* Dataset:

res: 846x678

sheet:
train test val
env_seg: 500, 200, 200
lanemark_iden: 500, 200, 200

* Deep learnning models
    * FCN
    * DeepLabV3 + Resnet
    * DeepLabV3 Plus + Resnet

* parameters
  * optimizer
  * epoch
  * environment
    * hardware: 32 cores CPU, GPU (Titan)
    * software: ubuntu, tensorflow

## Experiment results

### 1. Env seg 

accuracy, IoU curve, loss

pred_result: input, output, ground_truth

### 2. Lanemarks ind

IoU curve, pred_result, loss
pred_result: input, output, ground_truth

## Discussion

* model with frontend have higher accuracy
* more data

## Combined demo application

an segmented image with lanemarks

high_resolution, low_resolution

