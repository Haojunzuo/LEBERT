#CUDA_VISIBLE_DEVICES=5 python3 -m torch.distributed.launch --master_port 13517 --nproc_per_node=1 \
nohup python Trainer.py --do_eval --do_predict --evaluate_during_training \
    --data_dir="data/dataset/NER/msra" \
    --output_dir="data/result/NER/msra/upload" \
    --config_name="data/berts/bert/config.json" \
    --model_name_or_path="data/berts/bert" \
    --vocab_file="data/berts/bert/vocab.txt" \
    --word_vocab_file="data/vocab/tencent_vocab.txt" \
    --max_scan_num=3000000 \
    --max_word_num=5 \
    --label_file="data/dataset/NER/msra/labels.txt" \
    --word_embedding="data/embedding/word_embedding.txt" \
    --saved_embedding_dir="data/dataset/NER/msra" \
    --model_type="WCBertCRF_Token" \
    --seed=106524 \
    --per_gpu_train_batch_size=4 \
    --per_gpu_eval_batch_size=48 \
    --learning_rate=1e-5 \
    --max_steps=-1 \
    --max_seq_length=256 \
    --num_train_epochs=20 \
    --warmup_steps=190 \
    --save_steps=600 \
    --logging_steps=100 > resLogs/msra-no-word.log 2>&1 &
