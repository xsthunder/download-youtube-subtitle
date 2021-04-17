pip uninstall download-youtube-subtitle -y
python setup.py sdist bdist_wheel
pip install .\dist\download_youtube_subtitle-1.1.0-py3-none-any.whl
