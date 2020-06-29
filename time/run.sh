 rm ZFP.result
# rm SZ.result
sh ZFP.run >>ZFP.result
#sh SZ.run >>SZ.result
python ../find.py ZFP.result
#python ../find.py SZ.result
python Time_plot.py
