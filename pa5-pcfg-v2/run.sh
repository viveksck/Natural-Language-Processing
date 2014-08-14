WORKING=./try/
FREQB='90 60 40 20 10'
CONTEXTO='90 80 70 60 50 40 30 20 10'
NUM=10000
for freqb in $FREQB
do
freqw=$((100-$freqb))
mkdir -p $WORKING/$freqw
cp S1.gr $WORKING/$freqw
cp S2.gr $WORKING/$freqw
cp Vocab.gr $WORKING/$freqw
for contexto in $CONTEXTO
do
contextnew=$((100-$contexto))
echo $freqw $contextnew
python ./skeleton.py --freqb $freqb --freqw $freqw --contexto $contexto --contextnew $contextnew > $WORKING/$freqw/$contextnew.gr
java -jar pcfg.jar generate -n $NUM $WORKING/$freqw/S1.gr $WORKING/$freqw/S2.gr $WORKING/$freqw/Vocab.gr $WORKING/$freqw/$contextnew.gr > $WORKING/$freqw/$contextnew.ngrams
done
done
