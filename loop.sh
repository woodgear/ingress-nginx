# make dev-env # init kind and start ingress controller
# SHELL_MODE="true" make e2e-test-build-and-run #  use this command in tmux panel 1load e2e image and run e2e pod
# since than we could build e2e binary and replace it to the running e2e pod and rerun e2e
make e2e-test-binary && md5sum ./test/e2e/e2e.test
kubectl cp ./test/e2e/e2e.test e2e:/e2e.test
tmux send-keys -t 1 C-c 'md5sum ./e2e.test' C-m 'ginkgo --v /e2e.test' C-m