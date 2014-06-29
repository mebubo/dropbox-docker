DOCKER := "/usr/bin/docker.io"

IMAGE := mebubo/docker-dropbox
COMPUTER_NAME := "docker-dropbox"
RUNARGS := -v /dropbox:/dropbox:rw -h ${COMPUTER_NAME}

build:
	${DOCKER} build -t ${IMAGE} .

run:	stop
	${DOCKER} run -d --name dropbox_run ${RUNARGS} ${IMAGE}
	${DOCKER} logs -f dropbox_run
stop:
	${DOCKER} kill dropbox_run || true
	${DOCKER} rm -v dropbox_run || true

# inspect the image
shell:
	${DOCKER} run --rm --name dropbox_shell -t -i ${RUNARGS} ${IMAGE} bash


clean:
	${DOCKER} rmi ${IMAGE}

