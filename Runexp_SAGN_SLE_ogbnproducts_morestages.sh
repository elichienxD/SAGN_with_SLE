pretrain_path=../../proc_data_xrt/ogbn-products/X.all.xrt-emb.npy
data_root_dir=../../dataset

cd "$(dirname $0)" 
if [ ! -n "$1" ] ; then
    gpu="0"
else
    gpu="$1"
fi
echo "gpu: $gpu"
python -u src/sagn.py \
    --dataset ogbn-products \
    --gpu $gpu \
    --aggr-gpu -1 \
    --model sagn \
    --seed 0 \
    --num-runs 10 \
    --threshold 0.95 0.95 0.999 \
    --epoch-setting 1000 500 500 500\
    --lr 0.001 \
    --zero-inits \
    --batch-size 50000 \
    --num-hidden 512 \
    --num-heads 1 \
    --dropout 0.5 \
    --attn-drop 0.4 \
    --input-drop 0.2 \
    --label-drop 0.5 \
    --K 3 \
    --label-K 14 \
    --use-labels \
    --weight-decay 0 \
    --warmup-stage -1 \
    --data_root_dir $data_root_dir \
    --pretrain_path $pretrain_path \
    |& tee ./${hidden_channels}.${mlp_layer}.${K}.Ptrn.uselabels.morestage.log