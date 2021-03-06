
# 1. preprocess dataset by the following. It will produce data_process/sparc_data_removefrom/

python3 preprocess.py --dataset=sparc --remove_from

# please change glove_embeddings for your own path.
GLOVE_PATH="/dev/shm/glove_embeddings.pkl" 
LOGDIR="log/sparc"


CUDA_VISIBLE_DEVICES=1 python3 run.py --raw_train_filename="data_process/sparc_data_removefrom/train.pkl" \
    --raw_validation_filename="data_process/sparc_data_removefrom/dev.pkl" \
    --database_schema_filename="data_process/sparc_data_removefrom/tables.json" \
    --embedding_filename=$GLOVE_PATH \
    --data_directory="processed_data_sparc_removefrom" \
    --input_key="utterance" \
    --state_positional_embeddings=1 \
    --discourse_level_lstm=1 \
    --use_previous_query=1 \
    --use_query_attention=1 \
    --use_copy_switch=1 \
    --use_schema_encoder=1 \
    --use_schema_attention=1 \
    --use_encoder_attention=1 \
    --use_bert=1 \
    --bert_type_abb=uS \
    --fine_tune_bert=1 \
    --use_schema_self_attention=1 \
    --use_schema_encoder_2=1 \
    --interaction_level=1 \
    --reweight_batch=1 \
    --freeze=1 \
    --train=1 \
    --logdir=$LOGDIR \
    --evaluate=1 \
    --evaluate_split="valid" \
    --use_transformer_relation=1 \
    --use_predicted_queries=1 \
    --seed=141

