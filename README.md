# WORKER

Run a worker with a python script it in for transformation of texts.


## User Cases

NLP data from a comments

- gender neutral
- readability
- time to read
- main concepts
- bad words
- spam filtering
- sentiment  analysis
- topic detection
- simple keyword frequency analysis



### Readability

Readability is the ease with which a reader can understand a written text.([Wikpedia](https://en.wikipedia.org/wiki/Readability))

Reading score = 1.599nosw − 1.015sl − 31.517 (Flesch-Kincaid grade level formula)

    Where:
      nosw = number of one-syllable words per 100 words and
      sl = average sentence length in words.

      # Flesch Reading Ease
          # 90-100 : Very Easy
          # 80-89 : Easy
          # 70-79 : Fairly Easy
          # 60-69 : Standard
          # 50-59 : Fairly Difficult
          # 30-49 : Difficult
          # 0-29 : Very Confusing


# Running it in an IRON.IO worker

## With Docker

Package the code

```
docker build -t gaba/nlp .
```

Installing dependencies:
```
docker run --rm -v "$PWD":/worker -w /worker gaba/nlp pip install -t packages -r requirements.txt
```

Testing locally

```
docker run --rm -e "PAYLOAD_FILE=payload.json" -v "$PWD":/worker -w /worker gaba/nlp python3.5 nlp.py
```

Push it to docker Hub

```
docker push USERNAME/nlp:0.0.1
```

Register the image with iron

```
iron register -e  gaba/nlp:latest
```

Upload the worker

```
zip -r nlp.zip
iron worker upload --zip nlp.zip --name nlp gaba/nlp python3.5 nlp.py
```

Schedule a task for the worker

```
iron worker queue  --payload-file payload.json  --wait nlp
```

## References

* [Quick example for a python worker](https://github.com/iron-io/dockerworker/tree/master/python).
* [Docker python micro-containers](https://github.com/iron-io/dockers/tree/master/python).
* [Get started](https://hud.iron.io/tq/projects/57bcaee34efcd50007b84e8b/get_started).
