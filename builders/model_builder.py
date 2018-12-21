import sys, os
import tensorflow as tf
import subprocess

sys.path.append("models")
from models.FC_DenseNet_Tiramisu import build_fc_densenet
from models.DeepLabV3 import build_deeplabv3
from models.DeepLabV3_plus import build_deeplabv3_plus
from models.custom_model import build_custom

SUPPORTED_MODELS = ["FC-DenseNet56", "FC-DenseNet67", "FC-DenseNet103", "custom"]
SUPPORTED_FRONTENDS = ["ResNet101"]

def download_checkpoints(model_name):
    subprocess.check_output(["python", "utils/get_pretrained_checkpoints.py", "--model=" + model_name])

def build_model(model_name, net_input, num_classes, crop_width, crop_height, frontend="ResNet101", is_training=True):
	# Get the selected model. 
	# Some of them require pre-trained ResNet

	print("Preparing the model ...")

	if model_name not in SUPPORTED_MODELS:
		raise ValueError("The model you selected is not supported. The following models are currently supported: {0}".format(SUPPORTED_MODELS))

	if frontend not in SUPPORTED_FRONTENDS:
		raise ValueError("The frontend you selected is not supported. The following models are currently supported: {0}".format(SUPPORTED_FRONTENDS))


	if "ResNet101" == frontend and not os.path.isfile("models/resnet_v2_101.ckpt"):
	    download_checkpoints("ResNet101")

	network = None
	init_fn = None
	if model_name == "FC-DenseNet56" or model_name == "FC-DenseNet67" or model_name == "FC-DenseNet103":
	    network = build_fc_densenet(net_input, preset_model = model_name, num_classes=num_classes)
	elif model_name == "DeepLabV3":
	    # DeepLabV requires pre-trained ResNet weights
	    network, init_fn = build_deeplabv3(net_input, preset_model = model_name, frontend=frontend, num_classes=num_classes, is_training=is_training)
	elif model_name == "DeepLabV3_plus":
	    # DeepLabV3+ requires pre-trained ResNet weights
	    network, init_fn = build_deeplabv3_plus(net_input, preset_model = model_name, frontend=frontend, num_classes=num_classes, is_training=is_training)
	elif model_name == "custom":
	    network = build_custom(net_input, num_classes)
	else:
	    raise ValueError("Error: the model %d is not available. Try checking which models are available using the command python main.py --help")

	return network, init_fn