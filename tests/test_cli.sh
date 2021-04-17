set -e
if test $TRAVIS
then
    source $HOME/miniconda/etc/profile.d/conda.sh
    conda activate test
fi
bash test_cli.cmd