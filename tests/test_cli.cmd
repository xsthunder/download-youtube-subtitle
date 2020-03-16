REM python ../main.py 5tKOV0KqPlg --save_to_file=False
REM python ../main.py 5tKOV0KqPlg --output_file='test.txt'
REM python ../main.py 5tKOV0KqPlg --to_json=True 
REM python ../main.py 5tKOV0KqPlg --translation 'ja' --output_file='test.ja.txt'
REM python ../main.py 5tKOV0KqPlg --translation 'ja' --translation 'jp'  --output_file='test.ja.json'
python ../main.py 5tKOV0KqPlg --translation False --to_json=True  --output_file='test.none.json'
