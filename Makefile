#makefile for running and cleaning up scripts

# this is for linux target
linux: clean
	@echo "Running linux.sh script" 
	@chmod +x ./bin/linux.sh
	@./bin/linux.sh

# Target to clean
clean: 
	@echo "Running cleanup.sh script"
	@chmod +x ./bin/cleanup.sh
	@./bin/cleanup.sh
