WORKING=./try/
FREQB=90
FREQW=$((100-$FREQB))
CONTEXTO=30
CONTEXTNEW=$((100-$CONTEXTO))
NUM=10000
cp S1.gr $WORKING
cp S2.gr $WORKING
cp Vocab.gr $WORKING
python ./skeleton.py --freqb $FREQB --freqw $FREQW --contexto $CONTEXTO --contextnew $CONTEXTNEW > $WORKING/$CONTEXTO.gr
java -jar pcfg.jar generate -n $NUM $WORKING/*.gr > $WORKING/$CONTEXTO.ngrams

