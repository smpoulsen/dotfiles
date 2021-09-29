function data_manager_build
docker run --rm -it -v {$PWD}:/home/circleci/project ctoland/circleci-build-dmgr:latest bash
end
