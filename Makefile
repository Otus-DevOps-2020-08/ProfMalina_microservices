init: docker-init docker-runner
docker-init:
	docker run -d --name gitlab-runner --restart always -v /srv/gitlab-runner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner:latest
docker-runner:
	docker exec -it gitlab-runner gitlab-runner register --url http://178.154.230.184.sslip.io/ --non-interactive --locked=false --name DockerRunner --executor docker --docker-image docker:latest --registration-token GturS1SZmg6ny52sAQ9W --tag-list "linux,xenial,ubuntu,docker" --run-untagged
	# --docker-privileged
down:
	docker stop gitlab-runner && docker rm gitlab-runner