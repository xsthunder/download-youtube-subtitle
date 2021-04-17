set -e
if test $TRAVIS
then
    source $HOME/miniconda/etc/profile.d/conda.sh
fi

# you may create indepent env by conda create --name ...
conda install fire requests -c conda-forge -y
yes | pip install sure
