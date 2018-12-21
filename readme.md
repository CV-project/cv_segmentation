## Train

```
python train.py --crop_height=512 --crop_width=512 --batch_size=10
CUDA_VISIBLE_DEVICES=3 python train.py --crop_height=512 --crop_width=512 --model=DeepLabV3_plus --dataset=data/apollo_lane
```


## Predict

```
 python predict.py --image=data/apollo_envseg_data/test/170927_070142290_Camera_5.jpg --checkpoint_path='./checkpoints/latest_model_FC-DenseNet56_data_baidu_apollo_envseg.ckpt' --model=FC-DenseNet56 --dataset='data/apollo_envseg_data'
```

## Test 

```
python test.py --checkpoint_path='./checkpoints/latest_model_FC-DenseNet56_data_baidu_apollo_envseg.ckpt' --model=FC-DenseNet56 --dataset='data/apollo_envseg_data'
```