build:
	source .env && mkdir -p bin && go build -o ./bin/go-http ./src
clean:
	rm -rf ./bin/
install-deps:
	source .env && cd src && glide install
