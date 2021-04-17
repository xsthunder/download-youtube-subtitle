set -e
if test $TRAVIS
then
    source $HOME/miniconda/etc/profile.d/conda.sh
fi
bash test_cli.cmd
