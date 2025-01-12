# GIANT-XRT+SAGN+SLE

This is the repository for reproducing the results in our paper: [[Node Feature Extraction by Self-Supervised Multi-scale Neighborhood Prediction]](https://arxiv.org/pdf/2111.00064.pdf) for the combination of GIANT-XRT+SAGN+SLE.

## Step 0: Install GIANT and get GIANT-XRT node features.
Please follow the instruction in [[GIANT]](https://github.com/amzn/pecos/tree/mainline/examples/giant-xrt) to get the GIANT-XRT node features. Note that if you generate your own pretrained node features from GIANT-XRT, you should be aware of your save path and modify the --pretrain_path (below in Step 3) accordingly.

## Step 1: Git clone this repo.
After following the steps in [[GIANT]](https://github.com/amzn/pecos/tree/mainline/examples/giant-xrt), go to the folder
`pecos/examples/giant-xrt`

Then git clone this repo in the folder `giant-xrt` directly.

## Step 2: Install additional packages.
If you install and run GIANT correctly, you should only need to additionally install [dgl>=0.5.3](https://github.com/dmlc/dgl). See [here](https://www.dgl.ai/pages/start.html) for pip/conda installation instruction for dgl.

Please also install the following packages
```
pip install matplotlib
pip install seaborn
```

These two packages are inherent in the code of SAGN.

## Step 3: Run the experiment.
Go to the folder `SAGN_with_SLE`.

Run `Runexp_SAGN_SLE_ogbnproducts.sh`(SAGN+SLE original) for reproducing our results for ogbn-products dataset with GIANT-XRT features.

Run `Runexp_SAGN_SLE_ogbnproducts_morestages.sh`(SAGN+SLE morestages) for the new setting provided in the SAGN repo.

For the "+C&S" result, run `Runexp_postprocess_CnS.sh` after running `Runexp_SAGN_SLE_ogbnproducts_morestages.sh`.

```
New arguments

--data_root_dir: path to save ogb datasets.
--pretrain_path: path to load GIANT-XRT features. Set it to 'None' for using ogb default features.
``` 

## Results
If execute correctly, you should have the following performance (using our pretrained GIANT-XRT features).

**(SAGN+SLE original)** Number of params: 1548382

| SAGN+SLE (original) | stage 0 | stage 1 | stage 2 |
|---|---|---|---|
| Average val accuracy (%) | 93.79±0.04 | 93.62±0.06 | 93.54±0.05 |
| Average test accuracy (%) | 84.45±0.12 | 85.46±0.12 | 85.99±0.11 |

**(SAGN+SLE morestages)** Number of params: 1548382

| SAGN+SLE (morestages) | stage 0 | stage 1 | stage 2 | stage 3 | +C&S |
|---|---|---|---|---|---|
| Average val accuracy (%) | 93.78±0.05 | 93.64±0.05 | 93.53±0.02 | 93.63±0.05 | 93.52±0.05 |
| Average test accuracy (%) | 84.53±0.18 | 85.43±0.22 | 85.96±0.22 | 86.22±0.22 | 86.43±0.20 |

**Remark:** We only slightly fine-tune SAGN for our GIANT-XRT. It is possible to achieve higher performance by fine-tune it more carefully.

For more details about SAGN, please check the original README.

## Citation
If you find our code useful, please cite both our GIANT paper and the SAGN references provided in the original repo. Also, if you leverage C&S method, please also cite it.

Our GIANT paper:
```
@inproceedings{chien2021node,
  title={Node Feature Extraction by Self-Supervised Multi-scale Neighborhood Prediction},
  author={Chien, Eli and Chang, Wei-Cheng and Hsieh, Cho-Jui and Yu, Hsiang-Fu and Zhang, Jiong and Milenkovic, Olgica and Dhillon, Inderjit S},
  booktitle={International Conference on Learning Representations (ICLR)},
  year={2022}
}
```

SAGN paper:

```
@article{sun2021scalable,
  title={Scalable and Adaptive Graph Neural Networks with Self-Label-Enhanced training},
  author={Sun, Chuxiong and Wu, Guoshi},
  journal={arXiv preprint arXiv:2104.09376},
  year={2021}
}
```

C&S paper:

```
@inproceedings{
huang2021combining,
title={Combining Label Propagation and Simple Models out-performs Graph Neural Networks},
author={Qian Huang and Horace He and Abhay Singh and Ser-Nam Lim and Austin Benson},
booktitle={International Conference on Learning Representations},
year={2021},
url={https://openreview.net/forum?id=8E1-f3VhX1o}
}
```

Feel free to email me (ichien3@illinois.edu) if you have further questions. My notification of the Github issue does not work properly so make sure to drop me an email when you open a new issue.
