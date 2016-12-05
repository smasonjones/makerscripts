mkdir train
rsync -ai scripts/train_template/ train/
cd train/genemark
qsub -d $(pwd) train_genemark.sh
cd ..
CEGMA=$(qsub -d $(pwd) run_cegma.sh)
cd snap
qsub -W depend=afterok:$CEGMA -d $(pwd) train_snap.sh
