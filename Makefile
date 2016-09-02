all: docker dependencies push register zip

docker:
	docker build -t gaba/nlp .

dependencies:
	docker run --rm -v "$PWD":/worker -w /worker gaba/nlp pip install -t packages -r requirements.txt

push:
	docker push gaba/nlp

register:
	iron register gaba/nlp:latest

zip:
	zip -r nlp.zip .
	iron worker upload --zip nlp.zip --name nlp gaba/nlp python3.5 nlp.py

test:
	docker run --rm -e "PAYLOAD_FILE=payload.json" -v "$PWD":/worker -w /worker gaba/nlp python3.5 nlp.py
