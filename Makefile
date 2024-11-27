#makefile for running and cleaning up scripts

# this is for linux target
linux: clean 
	@chmod +x ./bin/linux.sh
	@./bin/linux.sh

# Target to clean
clean: 
	@chmod +x ./bin/cleanup.sh
	@./bin/cleanup.sh
