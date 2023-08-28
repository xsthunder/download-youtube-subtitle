python ../download_youtube_subtitle/main_playlist.py --help
python ../download_youtube_subtitle/main_playlist.py PLbpi6ZahtOH7wvHqyW5FP-afBByBW2DAS 0 2

python ../main.py --help
python ../main.py wgNiGj1nGYE --output_file='test.txt'
python ../main.py wgNiGj1nGYE --to_json=True 
python ../main.py wgNiGj1nGYE --translation 'ru' --output_file='test.ja.txt'
python ../main.py wgNiGj1nGYE  --to_json=True  --output_file='test.cn.json'
python ../main.py wgNiGj1nGYE --translation False --to_json=True  --output_file='test.none.json'
python ../main.py wgNiGj1nGYE --caption_num=0 --caption_num_second=2 --output_file="0,2.txt"
python ../main.py "https://www.youtube.com/watch?v=EozTm6ZVf1U" --caption_num=1
python ../main.py https://www.youtube.com/watch?v=aNwBqfcluyM&t=187s
python ../main.py https://www.youtube.com/watch?v=aNwBqfcluyM
