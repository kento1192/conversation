#encoding=utf-8

from choiseQuestion import *
import sys

reload(sys)
sys.setdefaultencoding('utf8')

cq = CQ_RandomForest(sys.argv[1], sys.argv[2])
rq = cq.recomendSimilarQuestion(sys.argv[3])

print("Predicted Question: %s" % rq)

