# download youtube subtitle

python version of [algolia/youtube-captions-scraper: Fetch youtube user submitted or fallback to auto-generated captions](https://github.com/algolia/youtube-captions-scraper)
 
## run

1. download [download_youtube_subtitle-0.0.1-py3-none-any.whl](https://github.com/xsthunder/download-youtube-subtitle/releases)
2. pip install download_youtube_subtitle-0.0.1-py3-none-any.whl
3. `dl-youtube-cc -h`

### usage example

```
SYNOPSIS
    dl-youtube-cc VIDEOID <flags>

DESCRIPTION
    Examples:
    dl-youtube-cc 5tKOV0KqPlg --save_to_file=False # print stuff in console
    dl-youtube-cc 5tKOV0KqPlg --output_file='test.txt' # print stuff in named file
    dl-youtube-cc 5tKOV0KqPlg --to_json=True # print stuff in json
    dl-youtube-cc 5tKOV0KqPlg --translation 'ja' # print stuff in named file
    dl-youtube-cc 5tKOV0KqPlg --translation False # without translation

POSITIONAL ARGUMENTS
    VIDEOID
        string, the id of youtube video, the string after 'v=' in a youtube video link

FLAGS
    --output_file=OUTPUT_FILE
        string, default to vidio title
    --save_to_file=SAVE_TO_FILE
        bool, default to True, True or False
    --translation=TRANSLATION
        bool or string, default to 'zh-Hans' for simplified Chinese, False or lang code, see ./lang_code.json for full list
    --to_json=TO_JSON
        bool, default to False, export caption to json
```

### example

```
https://youtube.com/get_video_info?video_id=5tKOV0KqPlg
---------00:01----------
All right, well, uh,
let's get back to real life
好吧，恩，让我们回到现实生活中

---------00:04----------
or whatever we're calling
this thing now.
或我们现在所说的这个东西。 
...
```

`--to_json=True`

```
[
    {
        "start": "1.367",
        "dur": "3.137",
        "text": "All right, well, uh,\nlet's get back to real life"
    },
    {
	...
```

## development

### env setup

[for conda](./config/create-env.sh)

```
pip install 'fire' 'requests' 'IPython'
```

### usage

```
python main.py VIDEOID
```

### test

```
cd test
./run.sh
./test_cli.sh
```

#### ref 

[deployment - How can I use setuptools to generate a console_scripts entry point which calls `python -m mypackage`? - Stack Overflow](https://stackoverflow.com/questions/27784271/how-can-i-use-setuptools-to-generate-a-console-scripts-entry-point-which-calls)

[Packaging Python Projects — Python Packaging User Guide](http://packaging.python.org/tutorials/packaging-projects/)