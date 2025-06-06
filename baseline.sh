# CUDA_VISIBLE_DEVICES=0 trl vllm-serve --model Qwen/Qwen2.5-1.5B-Instruct

export CUDA_VISIBLE_DEVICES=4,5,6,7
export HF_ENDPOINT=https://hf-mirror.com

# accelerate launch --config_file recipes/accelerate_configs/zero2.yaml --num_processes 7 src/open_r1/grpo.py\
#     --config recipes/Qwen2.5-1.5B-Instruct/grpo/config_demo.yaml
ACCELERATE_LOG_LEVEL=info accelerate launch --config_file recipes/accelerate_configs/ddp.yaml --main_process_port 29509 \
    src/open_r1/sft.py \
    --config recipes/Qwen2.5-1.5B-Instruct/sft/config_demo.yaml
