WORKING=./try/
FREQB='90 60 40 20 10'
CONTEXTO='90 80 70 60 50 40 30 20 10'
NUM=10000
for freqb in $FREQB
do
freqw=$((100-$freqb))
mkdir -p $WORKING/$freqb
cp S1.gr $WORKING/$freqb
cp S2.gr $WORKING/$freqb
cp Vocab.gr $WORKING/$freqb
for contexto in $CONTEXTO
do
echo $freqb $contexto
contextnew=$((100-$contexto))
python ./skeleton.py --freqb $freqb --freqw $freqw --contexto $contexto --contextnew $contextnew > $WORKING/$freqb/$contexto.gr
java -jar pcfg.jar generate -n $NUM $WORKING/$freqb/S1.gr $WORKING/$freqb/S2.gr $WORKING/$freqb/Vocab.gr $WORKING/$freqb/$contexto.gr > $WORKING/$freqb/$contexto.ngrams
done
done
