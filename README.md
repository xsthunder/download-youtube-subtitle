Updates:
-----------------
3.0.0 fix download error and it finally supports download entire playlist! see [Download the caption of entire playlist](#download-the-caption-of-entire-playlist)


Try it now!
-----------------

try it online with google's free python runtime! protip: you are able to download the output file from the sidebar! FREE from installation on your machine!

https://colab.research.google.com/drive/1oseD2yEsScx0YYOZ1x1F8GSG9iJ4x3qi?usp=sharing

![图片](https://user-images.githubusercontent.com/15523788/219826982-df9af9a8-4c11-4894-ab88-5561902c0597.png)

# download-youtube-subtitle

**Due to changes of youtube api, you need to UPGRADE to 3.0.0, see [Install and Run](#install-and-run)**

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

`dl-youtube-cc https://www.youtube.com/watch?v=wgNiGj1nGYE --translation 'ru'`
or
`dl-youtube-cc wgNiGj1nGYE --translation 'ru'`

will saved as `Version1.5SpecialProgramGenshinImpact.txt`

```text
video_link	 https://www.youtube.com/watch?v=wgNiGj1nGYE
original	 code="zh-Hans" name="Chinese (Simplified)"
translation	 ru
---------00:00----------
从前，有一对双胞胎结伴在宇宙中旅行
Давным-давно, два близнеца вместе путешествовали по Вселенной.

---------00:05----------
但有一天，他们前路遇阻
Однажды путь им преградило неизвестное божество
```

#### save as json

`dl-youtube-cc wgNiGj1nGYE --translation ru --to_json=True` will saved as `Version1.5SpecialProgramGenshinImpact.json`

```json
{
    "original": [
        {
            "start": "0",
            "dur": "5056",
            "text": "从前，有一对双胞胎结伴在宇宙中旅行"
        },
    	// continue
	],
    "translation": [
        {
            "start": "0",
            "dur": "5056",
            "text": "Давным-давно, два близнеца вместе путешествовали по Вселенной."
        },
        // continue
	],
    "merged": [
        {
            "start": "0",
            "dur": "5056",
            "text": "从前，有一对双胞胎结伴在宇宙中旅行",
            "translate_text": "Давным-давно, два близнеца вместе путешествовали по Вселенной."
        },
		// continue
	]
```

#### use caption_num caption_num_second to get full control

All available caption will be displayed, use `--caption_num` `--caption_num_second` to choose the caption which will be displayed as original or translation transcript.

```bash
>> dl-youtube-cc "wgNiGj1nGYE" --caption_num=0 --caption_num_second=3 --output_file="0,3-zh,fr.txt"
INFO:  available caption(s):
INFO:  #0  ✔ as original code="zh-Hans" name="Chinese (Simplified)"
INFO:  #1  ⭕ code="zh-Hant" name="Chinese (Traditional)"
INFO:  #2  ⭕ code="en-US" name="English (United States)"
INFO:  #3  ✔ as translation code="fr" name="French"
INFO:  #4  ⭕ code="de" name="German"
INFO:  #5  ⭕ code="id" name="Indonesian"
INFO:  #6  ⭕ code="pt" name="Portuguese"
INFO:  #7  ⭕ code="ru" name="Russian"
INFO:  #8  ⭕ code="es" name="Spanish"
INFO:  #9  ⭕ code="th" name="Thai"
INFO:  #10 ⭕ code="vi" name="Vietnamese"
INFO:  given by --caption_num default to 0 as original
INFO:  Save to  0,3-zh,fr.txt
```
 
## Install and Run

### Install via [download-youtube-subtitle · PyPI](https://pypi.org/project/download-youtube-subtitle/)

1. `pip install download-youtube-subtitle` or `pip install download-youtube-subtitle --user`
2. `dl-youtube-cc -h`

or uninstall to reinstall new version

`pip uninstall download-youtube-subtitle -y`

### Run in CLI

#### Download the caption of one video

`dl-youtube-cc -h` will show the following.

```text
NAME
    dl-youtube-cc - download youtube closed caption(subtitles) by videoID

SYNOPSIS
    dl-youtube-cc VIDEOID <flags>

DESCRIPTION
    Examples:
    dl-youtube-cc -h # to see this helpful infomation
    dl-youtube-cc wgNiGj1nGYE --translation 'ru' # use russian translation, see ./lang_code for full list
    dl-youtube-cc wgNiGj1nGYE --caption_num=1 --translation 'ru' # choose the caption num for original transcript and use russian translation,
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


#### Download the caption of entire playlist


`dl-youtube-cc-playlist -h` will show the following.

```
NAME
    dl-youtube-cc-playlist - download youtube closed caption(subtitles) by playlist. To figure most of params, please use dl-youtube-cc to download one video first before downloading the entire playlist.

SYNOPSIS
    dl-youtube-cc-playlist PLAYLIST_URL <flags>

DESCRIPTION
    Examples:
    dl-youtube-cc-playlist -h # to see this helpful infomation
    dl-youtube-cc-playlist PLS1QulWo1RIaJECMeUT4LFwJ-ghgoSH6n
    dl-youtube-cc-playlist PLS1QulWo1RIaJECMeUT4LFwJ-ghgoSH6n 0 3 # download the first 3 videos
    dl-youtube-cc-playlist https://www.youtube.com/playlist?list=PLS1QulWo1RIaJECMeUT4LFwJ-ghgoSH6n

POSITIONAL ARGUMENTS
    PLAYLIST_URL
        Type: str
        the playlist link or the id of youtube playlist, the string after 'list=' in the url

FLAGS
    --start=START
        Default: 0
        the index number in the playlist to start downloading, starting from 0
    -e, --end=END
        Type: Optional[]
        Default: None
        the index number in the playlist to end downloading, exclusively
    --translation=TRANSLATION
        Type: Optional[typing.Union[st...
        Default: None
        which will be displayed as original transcript, default to 'zh-Hans' for simplified Chinese, see ./lang_code.json for full list, or pass False to disable translation
    --caption_num=CAPTION_NUM
        Type: int
        Default: 0
        choose the caption which will be displayed as original transcript
    --caption_num_second=CAPTION_NUM_SECOND
        Type: Optional[int]
        Default: None
        will surpass translation option, choose the caption which will be displayed as translation transcript
    -o, --output_file=OUTPUT_FILE
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
    -r, --remove_font_tag=REMOVE_FONT_TAG
        Type: bool
        Default: True
        remove font tag

NOTES
    You can also use flags syntax for POSITIONAL ARGUMENT
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
pip install 'fire' 'requests' 'IPython' 'sure' 'pytube' 'progiter'
pip install -e .
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

### Ref 

[deployment - How can I use setuptools to generate a console_scripts entry point which calls `python -m mypackage`? - Stack Overflow](https://stackoverflow.com/questions/27784271/how-can-i-use-setuptools-to-generate-a-console-scripts-entry-point-which-calls)

[Packaging Python Projects — Python Packaging User Guide](http://packaging.python.org/tutorials/packaging-projects/)

`./nb/notebook2script.py` from [course-v3/nbs/dl2 at master · fastai/course-v3](https://github.com/fastai/course-v3/tree/master/nbs/dl2)

[Google Style Python Docstrings](https://gist.github.com/redlotus/3bc387c2591e3e908c9b63b97b11d24e#file-docstrings-py-L153)
