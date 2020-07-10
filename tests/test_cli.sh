set -e
if test $TRAVIS
then
    source $HOME/miniconda/etc/profile.d/conda.sh
    conda activate test
fi
python ../main.py 5tKOV0KqPlg --save_to_file=False
python ../main.py 5tKOV0KqPlg --output_file='test.txt'
python ../main.py 5tKOV0KqPlg --to_json=True 
python ../main.py 5tKOV0KqPlg --translation 'ja' --output_file='test.ja.txt'
python ../main.py 5tKOV0KqPlg  --to_json=True  --output_file='test.cn.json'
python ../main.py 5tKOV0KqPlg --translation False --to_json=True  --output_file='test.none.json'
python ../main.py "https://www.youtube.com/watch?v=EozTm6ZVf1U" --caption_num=1
python ../main.py https://www.youtube.com/watch?v=aNwBqfcluyM&t=187s
python ../main.py https://www.youtube.com/watch?v=aNwBqfcluyM