

import setuptools

with open("README.md", "r", encoding="UTF-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name="download-youtube-subtitle", # Replace with your own username
    version="0.0.9",
    author="xsthunder",
    author_email="xsthunder@outlook.com",
    description="download youtube subtitles(closed caption, cc) as txt or json",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/xsthunder/download-youtube-subtitle",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    entry_points = {
        "console_scripts": [
            "dl-youtube-cc = download_youtube_subtitle.__main__:fire_main",
        ]
    },
    install_requires=['fire', 'requests', 'IPython'],
    python_requires='>=3.4',
    
)

