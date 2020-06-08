IMAGE=xpracriu
CONTAINER=xpracriu_c
CHECKPOINT=checkpoint1

clean:	kill
	docker system prune -f

build:
	docker build --network=host -t $(IMAGE) .

start:
	xhost +local:root
	docker run -d --network=host --name $(CONTAINER) $(IMAGE)

checkpoint:
	docker checkpoint rm $(CONTAINER) $(CHECKPOINT) || true
	docker checkpoint create $(CONTAINER) $(CHECKPOINT)

restart:
	xhost +local:root
	docker start --checkpoint $(CHECKPOINT) $(CONTAINER)

connect:
	xpra attach -z0 tcp://localhost:16661/ --mmap=yes --compress=0

kill:
	docker kill $(CONTAINER) || docker rm -f $(CONTAINER) || true

logs:
	docker container logs $(CONTAINER)

debugattach:
	docker exec -ti $(CONTAINER) bash -il
