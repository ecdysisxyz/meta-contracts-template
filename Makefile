setup:
	forge install && forge remappings > remappings.txt && echo 'bundle/=src/' >> remappings.txt

dry-deploy-local:
	sh -c "anvil & ANVIL_PID=${!}; forge script DeployCounterScript --rpc-url http://127.0.0.1:8545; kill ${ANVIL_PID}"

run:
	forge script ${SCRIPT_NAME} --rpc-url ${RPC_URL} --broadcast

deploy:
	make run SCRIPT_NAME="DeployCounterScript"
