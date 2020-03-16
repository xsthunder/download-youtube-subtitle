python ../main.py 5tKOV0KqPlg --save_to_file=False
python ../main.py 5tKOV0KqPlg --output_file='test.txt'
python ../main.py 5tKOV0KqPlg --to_json=True 
python ../main.py 5tKOV0KqPlg --translation 'ja' --output_file='test.ja.txt'
python ../main.py 5tKOV0KqPlg --translation 'ja' --translation 'jp'  --output_file='test.ja.json'
python ../main.py 5tKOV0KqPlg --translation False --output_file='test.none.json'
