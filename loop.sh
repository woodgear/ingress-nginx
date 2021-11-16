make e2e-test-binary && md5sum ./test/e2e/e2e.test
kubectl cp ./test/e2e/e2e.test e2e:/e2e.test
tmux send-keys -t 1 C-c 'md5sum ./e2e.test' C-m 'ginkgo --v /e2e.test' C-m