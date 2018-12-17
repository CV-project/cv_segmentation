## Train

```
python train.py --crop_height=512 --crop_width=512 --batch_size=10
CUDA_VISIBLE_DEVICES=3 python train.py --crop_height=512 --crop_width=512 --model=DeepLabV3_plus --dataset=data/apollo_lane
```


## Predict

```
 python predict.py --image=Images/0001TP_008550.png --checkpoint_path='./checkpoints/latest_model_FC-DenseNet56_CamVid.ckpt' --model=FC-DenseNet56
```
