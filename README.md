# Download Youtube Subtitle [![Build Status](https://travis-ci.com/xsthunder/download-youtube-subtitle.svg?branch=master)](https://travis-ci.com/xsthunder/download-youtube-subtitle)

Download youtube subtitles(closed caption, cc) or srt as txt or json. 

### Features

1. Support exportting translation at the same time which is useful for language study.
3. Support proxy for youtube, follow the step at [Using Anaconda behind a company proxy — Anaconda documentation](https://docs.anaconda.com/anaconda/user-guide/tasks/proxy/).
4. Full test with traivis [![Build Status](https://travis-ci.com/xsthunder/download-youtube-subtitle.svg?branch=master)](https://travis-ci.com/xsthunder/download-youtube-subtitle) to make sure things are on rail.

python version of [algolia/youtube-captions-scraper: Fetch youtube user submitted or fallback to auto-generated captions](https://github.com/algolia/youtube-captions-scraper)
 
 
### Example

`dl-youtube-cc 5tKOV0KqPlg --translation zh-Hans` will saved as `HowSouthAfricaCouldPreparetheU.S.forPresidentTrumpTheDailyShow.txt`

```text
https://youtube.com/get_video_info?video_id=5tKOV0KqPlg
---------00:01----------
All right, well, uh,
let's get back to real life
好吧，恩，让我们回到现实生活中

---------00:04----------
or whatever we're calling
this thing now.
或我们现在所说的这个东西。 
// continue
```

`dl-youtube-cc 5tKOV0KqPlg --translation False --to_json=True` will saved as `HowSouthAfricaCouldPreparetheU.S.forPresidentTrumpTheDailyShow.json`


```json
[
    {
        "start": "1.367",
        "dur": "3.137",
        "text": "All right, well, uh,\nlet's get back to real life"
    },
]
// continue
```

 
## Install and Run

### Install via [download-youtube-subtitle · PyPI](https://pypi.org/project/download-youtube-subtitle/)

1. `pip install download-youtube-subtitle` or `pip install download-youtube-subtitle --user`
2. `dl-youtube-cc -h`


### run in cli

`dl-youtube-cc -h` will show the following.

```bash
DESCRIPTION
    Examples:
    dl-youtube-cc -h # to see this helpful infomation
    dl-youtube-cc 5tKOV0KqPlg --save_to_file=False # print stuff in console
    dl-youtube-cc 5tKOV0KqPlg --output_file='test.txt' # print stuff in named file
    dl-youtube-cc 5tKOV0KqPlg --to_json=True # print stuff in json
    dl-youtube-cc 5tKOV0KqPlg --translation 'ja' # use japanese translation, see ./lang_code for full list
    dl-youtube-cc 5tKOV0KqPlg --translation False # without translation
    dl-youtube-cc 5tKOV0KqPlg --caption_num=1 # choose the caption num

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
    --caption_num=CAPTION_NUM
        number, default to 0, choose the caption
    --remove_font_tag=REMOVE_FONT_TAG
        bool, default to True, remove font tag in transcript
```

### Use in Code

```python
import download_youtube_subtitle.common as common
import download_youtube_subtitle.main as download_youtube_subtitle
# ...
```

## Development

### Environment Setup

[for conda](./config/create-env.sh)

```bash
pip install 'fire' 'requests' 'IPython'
```

### Usage

```bash
python main.py -h
python main.py VIDEOID
```

### Tests

```bash
cd tests
./run.sh
./test_cli.sh
```

#### Ref 

[deployment - How can I use setuptools to generate a console_scripts entry point which calls `python -m mypackage`? - Stack Overflow](https://stackoverflow.com/questions/27784271/how-can-i-use-setuptools-to-generate-a-console-scripts-entry-point-which-calls)

[Packaging Python Projects — Python Packaging User Guide](http://packaging.python.org/tutorials/packaging-projects/)

`./nb/notebook2script.py` from [course-v3/nbs/dl2 at master · fastai/course-v3](https://github.com/fastai/course-v3/tree/master/nbs/dl2)
