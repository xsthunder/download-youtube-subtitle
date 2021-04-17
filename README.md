- [Download Youtube Subtitle ![Build Status](https://travis-ci.com/xsthunder/download-youtube-subtitle)](#download-youtube-subtitle-)
    - [Features](#features)
    - [Example](#example)
      - [save as txt](#save-as-txt)
      - [save as json](#save-as-json)
      - [use caption_num caption_num_second to get full control](#use-caption_num-caption_num_second-to-get-full-control)
  - [Install and Run](#install-and-run)
    - [Install via download-youtube-subtitle · PyPI](#install-via-download-youtube-subtitle--pypi)
    - [run in cli](#run-in-cli)
    - [Use in Code](#use-in-code)
  - [Development](#development)
    - [Environment Setup](#environment-setup)
    - [Usage](#usage)
    - [Tests](#tests)
      - [Ref](#ref)
# Download Youtube Subtitle [![Build Status](https://travis-ci.com/xsthunder/download-youtube-subtitle.svg?branch=master)](https://travis-ci.com/xsthunder/download-youtube-subtitle)

Download youtube subtitles(closed caption, cc) or srt as txt or json. 

### Features

1. Support exportting translation at the same time which is useful for language study.
1. Full control. All available caption will be displayed, [use `--caption_num` `--caption_num_second` to choose the caption which will be displayed as original or translation transcript.](#use-caption_num-caption_num_second-to-get-full-control)
1. Support proxy for youtube, follow the step at [Using Anaconda behind a company proxy by setting environment-variables](https://docs.anaconda.com/anaconda/user-guide/tasks/proxy/#environment-variables).
1. Full test with traivis [![Build Status](https://travis-ci.com/xsthunder/download-youtube-subtitle.svg?branch=master)](https://travis-ci.com/xsthunder/download-youtube-subtitle) to make sure things are on rail.

python version of [algolia/youtube-captions-scraper: Fetch youtube user submitted or fallback to auto-generated captions](https://github.com/algolia/youtube-captions-scraper)
 
 
### Example

#### save as txt

`dl-youtube-cc https://www.youtube.com/watch?v=wgnigj1ngye --translation ja`
or
`dl-youtube-cc wgNiGj1nGYE --translation ja`

will saved as `Version1.5SpecialProgramGenshinImpact.txt`

```text
https://www.youtube.com/watch?v=wgNiGj1nGYE
---------00:00----------
從前，有一對雙胞胎結伴在宇宙中旅行
昔々、宇宙を一緒に旅している双子のペアがいました

---------00:05----------
但有一天，他們前路遇阻
しかしある日、彼らの道は封鎖されました

---------00:07----------
被一個未知的神明生生分離
未知の神によって隔てられている
```

#### save as json

`dl-youtube-cc wgNiGj1nGYE --translation ja --to_json=True` will saved as `Version1.5SpecialProgramGenshinImpact.json`

```json
{
    "original": [
        {
            "start": "0",
            "dur": "5.056",
            "text": "Once upon a time, two twins traveled together throughout the universe."
        },
	// continue
	],
    "translation": [
        {
            "start": "0",
            "dur": "5.056",
            "text": "昔々、2人の双子が一緒に宇宙を旅していました。"
        },
		// continue
	],
    "merged": [
        {
            "start": "0",
            "dur": "5.056",
            "text": "Once upon a time, two twins traveled together throughout the universe.",
            "translate_text": "昔々、2人の双子が一緒に宇宙を旅していました。"
        },
		// continue
	]
```

#### use caption_num caption_num_second to get full control

All available caption will be displayed, use `--caption_num` `--caption_num_second` to choose the caption which will be displayed as original or translation transcript.

```bash
>> dl-youtube-cc "wgNiGj1nGYE" --caption_num=0 --caption_num_second=3, --output_file="0,3-zh,es.txt"
INFO:  available caption(s):
INFO:  ✔ as original #0. .zh-Hant 中文（繁體字）
INFO:  ⭕ #1. .zh-Hans 中文（簡體字）
INFO:  ⭕ #2. .id      印尼文
INFO:  ✔ as translation #3. .es      西班牙文
INFO:  ⭕ #4. .fr      法文
INFO:  ⭕ #5. .ru      俄文
INFO:  ⭕ #6. .en-US   英文（美國）
INFO:  ⭕ #7. .th      泰文
INFO:  ⭕ #8. .vi      越南文
INFO:  ⭕ #9. .pt      葡萄牙文
INFO:  ⭕ #10. .de      德文
INFO:  ✔ marks chosen one in 0-index
INFO:  given by --caption_num default to 0 as original
INFO:  Save to  0,3-zh,es.txt
```
 
## Install and Run

### Install via [download-youtube-subtitle · PyPI](https://pypi.org/project/download-youtube-subtitle/)

1. `pip install download-youtube-subtitle` or `pip install download-youtube-subtitle --user`
2. `dl-youtube-cc -h`

or uninstall to reinstall new version

`pip uninstall download-youtube-subtitle -y`

### run in cli

`dl-youtube-cc -h` will show the following.

```text
NAME
    dl-youtube-cc - download youtube closed caption(subtitles) by videoID

SYNOPSIS
    dl-youtube-cc VIDEOID <flags>

DESCRIPTION
    Examples:
    dl-youtube-cc -h # to see this helpful infomation
    dl-youtube-cc wgNiGj1nGYE --translation 'ja' # use japanese translation, see ./lang_code for full list
    dl-youtube-cc wgNiGj1nGYE --caption_num=1 --translation 'ja' # choose the caption num for original transcript and use japanese translation,
    dl-youtube-cc wgNiGj1nGYE --caption_num=1 --caption_num_second=2 # manually choose the original and translation transcript from available caption list
    dl-youtube-cc wgNiGj1nGYE --translation False # without translation
    dl-youtube-cc wgNiGj1nGYE --save_to_file=False # print stuff in console
    dl-youtube-cc wgNiGj1nGYE --output_file='test.txt' # print stuff in named file
    dl-youtube-cc wgNiGj1nGYE --to_json=True # print stuff in json

POSITIONAL ARGUMENTS
    VIDEOID
        Type: str
        the video link or the id of youtube video, the string after 'v=' in a youtube video link

FLAGS
    --translation=TRANSLATION
        Type: typing.Union[str, bool]
        Default: 'zh-Hans'
        which will be displayed as original transcript, default to 'zh-Hans' for simplified Chinese, see ./lang_code.json for full list, or pass False to disable translation
    --caption_num=CAPTION_NUM
        Type: int
        Default: 0
        choose the caption which will be displayed as original transcript
    --caption_num_second=CAPTION_NUM_SECOND
        Type: Optional[int]
        Default: None
        will surpass translation option, choose the caption which will be displayed as translation transcript
    --output_file=OUTPUT_FILE
        Type: Optional[str]
        Default: None
        default to video title
    --save_to_file=SAVE_TO_FILE
        Type: bool
        Default: True
        pass False to print in console
    --to_json=TO_JSON
        Type: bool
        Default: False
        pass True to export caption to json
    --remove_font_tag=REMOVE_FONT_TAG
        Type: bool
        Default: True
        remove font tag
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
pip install 'fire' 'requests' 'IPython' 'sure'
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
