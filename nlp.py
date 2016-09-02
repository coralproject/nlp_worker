import sys
sys.path.append("packages")
import iron_mq
from iron_worker import *
from textstat.textstat import textstat


print('Flesch Reading Ease: %s' % textstat.flesch_reading_ease(IronWorker.payload()['text']))
